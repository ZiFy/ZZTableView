//
//  ZZLabelCell.h
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/27.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZLabelCellModel;
@interface ZZLabelCell : UITableViewCell

@property (nonatomic, strong, readonly) ZZLabelCellModel* viewModel;//!<

@end
@interface ZZLabelCellModel : NSObject<NSCopying>

@property (nonatomic, strong) NSAttributedString* attributedText;//!<
@property (nonatomic, assign) UIEdgeInsets textEdgeInsets;//!<
@property (nonatomic, strong) UIColor* backgroundColor;//!< default 0xfefefc

@end
