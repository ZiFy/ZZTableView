//
//  UITableView+ZZTableViewDataManager
//  ZZTableView
//
//  Created by 赵梁 on 2018/9/18.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "UITableView+ZZTableViewDataManager.h"
#import <objc/runtime.h>

@implementation UITableView (ZZTableViewDataManager)

- (ZZTableViewDataManager *)zz_tableViewDataSource
{
    ZZTableViewDataManager *source = objc_getAssociatedObject(self, _cmd);
    if (source == nil) {
        source = [[ZZTableViewDataManager alloc] initWithTableView:self cellModels:nil];
        
        objc_setAssociatedObject(self, _cmd, source, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return source;
}

@end
