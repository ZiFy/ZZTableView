//
//  ZZTableViewManager.h
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/28.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTableViewDataManager : NSObject<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithTableView:(UITableView*)tableView cellModels:(NSArray*)cellModels;

- (void)addCellModel:(id)cellModel;
- (void)resetCellModels:(NSArray*)cellModels;
- (NSArray*)getCellModels;

@end
