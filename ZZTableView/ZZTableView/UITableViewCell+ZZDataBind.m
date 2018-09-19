//
//  UITableViewCell+ZZDataBind.m
//  ZZTableView
//
//  Created by 赵梁 on 2018/9/19.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "UITableViewCell+ZZDataBind.h"

@implementation UITableViewCell (ZZDataBind)

#pragma mark - Public

+ (NSString *)zz_cellIdentifier
{
    return NSStringFromClass([self class]);
}

+ (NSString*)zz_xibName
{
    NSString *nib = [NSString stringWithFormat:@"%@.nib", NSStringFromClass(self.class)];
    return nib;
}

+ (id)zz_cellForTableView:(UITableView *)tableView
{
    NSString *cellID = [self zz_cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSString *xib = [[NSBundle mainBundle] pathForResource:self.zz_xibName  ofType:nil];
        if (xib.length > 0) {
            [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] forCellReuseIdentifier:cellID];
            cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
            NSAssert(NO, @"你应该先注册再使用 registerNib: forCellReuseIdentifier:");
        } else {
            cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    }
    return cell;
}

- (void)zz_bindModel:(id)cellModel {
    NSAssert(NO, @"子类必须实现");
}

@end
