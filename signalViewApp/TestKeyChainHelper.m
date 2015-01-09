//
//  TestKeyChainHelper.m
//  signalViewApp
//
//  Created by test on 15-1-9.
//  Copyright (c) 2015年 zkk赵珂珂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestKeyChainHelper.h"

@implementation TestKeyChainHelper

+(NSMutableDictionary*) getKeyChainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword, (__bridge id)kSecClass,
            service, (__bridge id)kSecAttrService,
            service, (__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock, (__bridge id)kSecAttrAccessible,
            nil];
}

+(void) saveUserName:(NSString *)userName
            userNameService:(NSString *)userNameService
            password:(NSString *)pwd
            passwordService:(NSString *)pwdService
{
    NSMutableDictionary *keychainQuerty = [self getKeyChainQuery:userNameService];
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuerty));
    [keychainQuerty setObject:[NSKeyedArchiver archivedDataWithRootObject:userName] forKey:(__bridge id)(kSecValueData)];
    SecItemAdd(CFBridgingRetain(keychainQuerty), NULL);
}

+(void) deleteWithUserNameService:(NSString *)userNameService passwordService:(NSString *)pwdService
{
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:userNameService];
    SecItemDelete(CFBridgingRetain(keychainQuery));
    
    keychainQuery = [self getKeyChainQuery:pwdService];
    SecItemDelete(CFBridgingRetain(keychainQuery));
}


+(NSString*) getUserNameWithService:(NSString *)userNameService
{
    NSString* ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:userNameService];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = nil;
    if (SecItemCopyMatching(CFBridgingRetain(keychainQuery), (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", userNameService,exception);
        }
        @finally {
            
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return ret;
}

+(NSString*) getPasswordWithService:(NSString *)pwdService
{
    NSString* ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:pwdService];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = nil;
    if (SecItemCopyMatching(CFBridgingRetain(keychainQuery), (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", pwdService,exception);
        }
        @finally {
            
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return ret;
}

@end
