//
//  NSMutableDictionary+crashProtect.m
//  YZToolsKit_Example
//
//  Created by jonzhang on 2020/11/30.
//  Copyright © 2020 hurosezhang. All rights reserved.
//

#import "NSMutableDictionary+crashProtect.h"
#import "YZHook.h"
@implementation NSMutableDictionary (crashProtect)
+ (void)load {
    
    Class cls = NSClassFromString(@"__NSDictionaryM");
    
    [YZHook hookClass:cls fromSelector:@selector(setObject:forKey:) toSelector:@selector(yz_setObject:forKey:)];
    
}
- (void)yz_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject) {
        
        NSLog(@"插入字典的数据为nil,做了防奔溃处理");

        return;;
    }
    [self yz_setObject:anObject forKey:aKey];
    
}




@end
