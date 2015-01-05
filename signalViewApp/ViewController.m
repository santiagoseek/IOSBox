//
//  ViewController.m
//  signalViewApp
//
//  Created by zkk赵珂珂 on 15/1/4.
//  Copyright (c) 2015年 zkk赵珂珂. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)testFun:(id)sender{
    NSString *str = @"111.01";
    id result = [NSNumber numberWithFloat:[str floatValue]];
    NSLog(@"%f", [str floatValue]);
    NSLog(@"%f", [result floatValue]);
    
    [self NSMutableStringTest];
    [self NSDictionaryTest];
    [self NSNumberTest];
}

-(IBAction)NSstringTest:(id)sender{
    NSString *str1 = @"this is string A";
    NSString *str2 = @"this is string B";
    NSString *res;
    NSComparisonResult compareResult;
    
    NSLog(@"Length of str1: %lu", [str1 length]);
    
    
    //字符串复制
    //isEqualToString比较内容相等，==比较是否同一个对象
    res=[NSString stringWithString:str1];
    NSLog(@"copy:%@",res);
    if ([str1 isEqualToString:res] == YES) {
        NSLog(@"str1 == res");
    }
    else
    {
        NSLog(@"str1 != res");
    }
    
    //str2放在str1的末尾
    str2 = [str1 stringByAppendingString:str2];
    NSLog(@"concatentation: %@", str2);
    
    //格式化输出
    NSString *newString = [NSString stringWithFormat:@"%@%@", str1,str2];
    NSLog(@"stringWithFormat: %@", newString);
    
    //验证一个字符串是否小于，等于或大于另一个字符串
    compareResult = [str1 compare:str2];
    if (compareResult == NSOrderedAscending) {
        NSLog(@"str1 < str2");
    }
    else if (compareResult == NSOrderedSame) {
        NSLog(@"str1 == str2");
    }
    else{
        NSLog(@"str1 > str2");
    }
    
    //字符串转化为大写
    res = [str1 uppercaseString];
    NSLog(@"uppercase conversion:%s", [res UTF8String]);
    
    //字符串转化为小写
    res = [str1 lowercaseString];
    NSLog(@"lowercase conversion:%@", res);
    
    NSLog(@"original string:%@", str1);
    
    //获取字符串对应的C风格字符串
    const char *cstr = [str1 UTF8String];
    NSLog(@"获取的c字符串:%s", cstr);
    
    //在str1后面追加带变量的字符串
    //原来的字符串对象并不改变，只是将新生成的字符串重新赋给str1指针变量
    str1 = [str1 stringByAppendingFormat:@"%@ str1.",str1];
    NSLog(@"str1 is:%@", str1);
    NSLog(@"Length of the str1:%lu",[str1 length]);
    
    //获取str的前10个字符组成的字符串
    NSString *s1 = [str1 substringToIndex:10];
    NSLog(@"str1 substringToIndex10:%@", s1);
    
    //获取str从第5个字符开始，与后面字符组成的字符串
    NSString *s2 = [str1 substringFromIndex:5];
    NSLog(@"str1 substringFromIndex5:%@", s2);
    
    //获取str从第5个字符开始，到第15个字符组成的字符串
    NSString *s3 = [str1 substringWithRange:NSMakeRange(5, 15)];
    NSLog(@"substringWithRange:NSMakeRange(5, 15):%@", s3);
    
    //获取"Athis"在str1中出现的位置
    NSRange pos = [str1 rangeOfString:@"Athis"];
    NSLog(@"Athis start position:%ld, the length is:%ld", pos.location, pos.length);
    
    //字符串转基本数据类型
    NSString *numString = @"3.3333";
    NSLog(@"3.3333 to bool:%d",[numString boolValue]);
    NSLog(@"3.3333 to float:%f",[numString floatValue]);
    NSLog(@"3.3333 to double:%f",[numString doubleValue]);
    NSLog(@"3.3333 to int:%d",[numString intValue]);
    
    //字符串转数组
    NSString *stringconvert = @"string convert to array";
    NSArray *arrayString = [stringconvert componentsSeparatedByString:@" "];
    NSLog(@"string convert to array:%@",arrayString);
}

-(void)NSstringTest{
    NSLog(@"this is testing fun override.");
}

-(void)NSMutableStringTest{
    NSString *str1 = @"this is nsmutablestring A";
    NSMutableString *mstr;
    
    //从不可变字符串创建可变字符串
    mstr = [NSMutableString stringWithString:str1];
    NSLog(@"NSMutableString:%@", mstr);
    
    //插入字符
    [mstr insertString:@"insert" atIndex:4];
    NSLog(@"insert the \"insert\" at the 4:%@",mstr);
    
    //插入末尾进行有效拼接
    [mstr insertString:@" and string B" atIndex:[mstr length]];
    NSLog(@"the end insert:%@", mstr);
    
    //appendString
    [mstr appendString:@" and string C"];
    NSLog(@"appendString:%@", mstr);
    
    //根据范围删除子字符串
    [mstr deleteCharactersInRange:NSMakeRange(0, 7)];
    NSLog(@"deleteCharaterInrange:%@", mstr);
    
    //查找然后删除
    NSRange substr = [mstr rangeOfString:@"string B and "];
    if (substr.location != NSNotFound) {
        [mstr deleteCharactersInRange:substr];
        NSLog(@"find and delete the \"string B and\":%@", mstr);
    }
    
    //直接设置为可变的字符串
    [mstr setString:@"this is new string A"];
    NSLog(@"the new mstr:%@",mstr);
    
    [mstr replaceCharactersInRange:NSMakeRange(8, 6) withString:@" a mutable string"];
    NSLog(@"replaceCharactersInRange:%@", mstr);
    
    NSLog(@"mstr:%@", mstr);
    
    NSString *search = @"a";
    NSString *replace = @"X";
    
    substr = [mstr rangeOfString:search];
    if (substr.location != NSNotFound) {
        [mstr replaceCharactersInRange:substr withString:replace];
    }
    NSLog(@"replace a with X:%@",mstr);
}


-(void)NSDictionaryTest{
    //创建不可改变的词典
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"key1",@"value1",@"key2",@"value2",@"key3",@"value3", nil];
    NSLog(@"Dictionary's number:%lu",[dict1 count]);
    
    //NSEnumerator用来遍历集合中每一处索引的对象，先得到里面所有的键值 objectEnumerator得到里面的对象，keyEnumerator得到里面的键值
    NSEnumerator *enumerator = [dict1 keyEnumerator];
    
    id object;
    while (object = [enumerator nextObject]) {
        NSLog(@"Key is:%@",object);
        
        id objectValue =[dict1 objectForKey:object];
        if (objectValue != nil) {
            NSLog(@"%@ the value is:%@", object,objectValue);
        }
    }
    
    
    //创建可改变的动态词典，添加的数据超过容量时，会自动扩大
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
    
    [mutableDictionary setObject:@"value1" forKey:@"key1"];
    [mutableDictionary setObject:@"value2" forKey:@"key2"];
    
    //不用遍历就得到key和value
    NSLog(@"output all keys:%@",[mutableDictionary allKeys]);
    NSLog(@"output all values:%@",[mutableDictionary allValues]);
    
    //可以动态添加修改key和value， 但是NSDictionay却不可以修改
    [mutableDictionary setObject:@"updatevalue2tovalue3" forKey:@"key2"];
    [mutableDictionary setObject:@"value3" forKey:@"key3"];
    NSLog(@"output all keys:%@",[mutableDictionary allKeys]);
    NSLog(@"output all values:%@",[mutableDictionary allValues]);
    
    //动态删除，删除指定键值的数据
    [mutableDictionary removeObjectForKey:@"key1"];
    NSLog(@"output all keys:%@",[mutableDictionary allKeys]);
    NSLog(@"output all values:%@",[mutableDictionary allValues]);
    
    //删除所有数据
    [mutableDictionary removeAllObjects];
    NSLog(@"output all keys:%@",[mutableDictionary allKeys]);
    NSLog(@"output all values:%@",[mutableDictionary allValues]);
}

-(void) NSNumberTest{
    NSNumber *monthNumber = [NSNumber numberWithInt:10];
    NSNumber *lengthNumber =[[NSNumber alloc]initWithFloat:10.8];
    NSLog(@"monthNumber:%@",monthNumber);
    NSLog(@"lengthNumber:%@",lengthNumber);
    
    int month = [monthNumber intValue];
    float length = [lengthNumber floatValue];
    NSLog(@"month:%d",month);
    NSLog(@"length:%f",length);
}







































@end
