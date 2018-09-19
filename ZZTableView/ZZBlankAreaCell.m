//
//  ZZBlankAreaCell.m
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/26.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "ZZBlankAreaCell.h"

/* ViewController */
/* View  */
/* Data  */
/* Other */
#import <Masonry.h> //自动布局第三方库

@interface ZZBlankAreaCell()

#pragma mark ViewModel
@property (nonatomic, strong, readwrite) ZZBlankAreaCellModel* viewModel;//!< <#描述#>

@property (nonatomic, strong) UIView* line;//!< <#描述#>
@end

@implementation ZZBlankAreaCell


#pragma mark - ==================== Life Circle ====================

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupBaseAttribute];
        [self setupSubviews];
        [self setupSubviewsLayout];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@:%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

#pragma mark - ==================== Init View ====================
/**
 设置view以及subviews的基本属性
 */
- (void)setupBaseAttribute {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

/**
 添加subviews
 */
- (void)setupSubviews {
    [self.contentView addSubview:self.line];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
}

/**
 subviews的布局约束
 */
- (void)setupSubviewsLayout {
//    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(0.5).priority(MASLayoutPriorityRequired);
//        make.left.mas_equalTo(self.contentView);
//        make.right.mas_equalTo(self.contentView);
//        make.top.bottom.mas_equalTo(0);
//    }];
}

#pragma mark - ==================== Data ====================
- (void)zz_bindModel:(ZZBlankAreaCellModel*)viewModel {
    self.viewModel = viewModel;
    self.line.backgroundColor = viewModel.color;
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.height.mas_equalTo(viewModel.height).priority(MASLayoutPriorityDefaultHigh);
        make.left.mas_equalTo(self.contentView).mas_offset(viewModel.lineEdgeInsets.left);
        make.right.mas_equalTo(self.contentView).mas_offset(-viewModel.lineEdgeInsets.right);
    }];
}

#pragma mark - ==================== action ====================


#pragma mark - ==================== delegate ====================


#pragma mark - ==================== setters & getters ====================
- (UIView *)line
{
    if (!_line) {
        _line = ({
            UIView *view = [UIView new];
            view;
        });
    }
    return _line;
}

@end

@implementation ZZBlankAreaCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineEdgeInsets = UIEdgeInsetsZero;
        self.height = 0.5;
        self.color = [UIColor whiteColor];
    }
    return self;
}



@end
