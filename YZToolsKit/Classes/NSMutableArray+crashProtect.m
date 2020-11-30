//
//  NSMutableArray+crashProtect.m
//  YZToolsKit_Example
//
//  Created by jonzhang on 2020/11/30.
//  Copyright © 2020 hurosezhang. All rights reserved.
//

#import "NSMutableArray+crashProtect.h"
#import "YZHook.h"
@implementation NSMutableArray (crashProtect)
+ (void)load {
  
    Class cls = NSClassFromString(@"__NSArrayI");
    
    Class cls2 = NSClassFromString(@"__NSArrayM");

    
    // 数组越界防奔溃处理
    [YZHook hookClass:cls fromSelector:@selector(objectAtIndexedSubscript:) toSelector:@selector(yz_objectAtIndexedSubscript:)];
    
    [YZHook hookClass:cls2 fromSelector:@selector(objectAtIndexedSubscript:) toSelector:@selector(yz_objectAtIndexedSubscript:)];
    
    [YZHook hookClass:cls2 fromSelector:@selector(insertObject:atIndex:) toSelector:@selector(yz_insertObject:atIndex:)];


}

- (id)yz_objectAtIndexedSubscript:(NSUInteger)idx {
    
    if (idx >= self.count) {
       
        NSLog(@"此时数组越界,做了防奔溃处理");
        
        return [self lastObject];
    }else{
        
      // 此时是正常的
        
    }
    
    return [self yz_objectAtIndexedSubscript:idx] ;
    
}

- (void)yz_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject){
       
        NSLog(@"插入数组的数据为nil,做了防奔溃处理");

        return;

    }
        
    
    [self yz_insertObject:anObject atIndex:index];
    
    
}

@end
