//
//  UITableViewCell+ZZDataBind.h
//  ZZTableView
//
//  Created by 赵梁 on 2018/9/19.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZZTableViewCellDataBindProtocal <NSObject>

@required;
- (void)zz_bindModel:(id)cellModel;

@end

@protocol ZZTableViewCellModelProtocal <NSObject>

@property (nonatomic, weak) UITableViewCell *cell;
@property (nonatomic, weak) UITableView *tableView;

@end

@interface UITableViewCell (ZZDataBind)<ZZTableViewCellDataBindProtocal>

+ (NSString*)zz_cellIdentifier;
+ (NSString*)zz_xibName;

+ (id)zz_cellForTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
