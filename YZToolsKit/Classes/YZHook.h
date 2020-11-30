//
//  YZHook.h
//  YZToolsKit_Example
//
//  Created by jonzhang on 2020/11/30.
//  Copyright © 2020 hurosezhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZHook : NSObject
+ (void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector;

@end

NS_ASSUME_NONNULL_END
