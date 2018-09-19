//
//  ZZBlankAreaCell.h
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/26.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZBlankAreaCellModel;
@interface ZZBlankAreaCell : UITableViewCell

@property (nonatomic, strong, readonly) ZZBlankAreaCellModel* viewModel;//!<

@end

@interface ZZBlankAreaCellModel : NSObject

@property (nonatomic, strong) UIColor* color;//!< default 0xE9ECF4
@property (nonatomic, assign) CGFloat height;//!< default 0.5
@property (nonatomic, assign) UIEdgeInsets lineEdgeInsets;//!< only left and right , default both 0

@end
