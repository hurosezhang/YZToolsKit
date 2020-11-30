//
//  UITableViewCell+ContentViewNoLazy.m
//  YZToolsKit_Example
//
//  Created by jonzhang on 2020/11/30.
//  Copyright © 2020 hurosezhang. All rights reserved.
//

#import "UITableViewCell+ContentViewNoLazy.h"
#import "YZHook.h"
@implementation UITableViewCell (ContentViewNoLazy)

+ (void)load {
    if (@available(iOS 14.0,*)) {
        //
        Class cls = [self class];
        [YZHook hookClass:cls fromSelector:@selector(initWithStyle:reuseIdentifier:) toSelector:@selector(yz_initWithStyle:reuseIdentifier:)];
    }
}

- (instancetype)yz_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    UITableViewCell *cell = [self yz_initWithStyle:style reuseIdentifier:reuseIdentifier];

    cell.contentView.backgroundColor = [UIColor clearColor];

    return cell;
}

@end
