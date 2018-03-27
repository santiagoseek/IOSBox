//
//  TestKeyChainHelper.h
//  signalViewApp
//
//  Created by test on 15-1-9.
//  Copyright (c) 2015年 zkk赵珂珂. All rights reserved.
//

#ifndef signalViewApp_TestKeyChainHelper_h
#define signalViewApp_TestKeyChainHelper_h


#endif
<<<<<<< HEAD
=======

#import <Foundation/Foundation.h>

@interface TestKeyChainHelper : NSObject

+ (void) saveUserName:(NSString*) userName
      userNameService:(NSString*) userNameService
             password:(NSString*) pwd
      passwordService:(NSString*) pwdService;

+ (void) deleteWithUserNameService:(NSString*) userNameService
                   passwordService:(NSString*) pwdService;

+(NSString*) getUserNameWithService:(NSString*) userNameService;

+(NSString*) getPasswordWithService:(NSString*) pwdService;

@end
>>>>>>> 8219fa9ba6b90a230c88bb72930ca243005347b0
