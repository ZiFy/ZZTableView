//
//  ZZLabelCell.m
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/27.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "ZZLabelCell.h"

/* ViewController */
/* View  */
/* Data  */
/* Other */
#import <YYModel.h>
#import <Masonry.h> //自动布局第三方库

@interface ZZLabelCell()

#pragma mark ViewModel
@property (nonatomic, strong, readwrite) ZZLabelCellModel* viewModel;//!< <#描述#>

#pragma mark View

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ZZLabelCell


#pragma mark - ==================== Life Circle ====================

- (void)dealloc {
    
}

#pragma mark - ==================== Init View ====================


#pragma mark - ==================== Data ====================

- (void)zz_bindModel:(ZZLabelCellModel*)viewModel {
    self.viewModel = viewModel;
    
    self.label.attributedText = viewModel.attributedText;
    self.contentView.backgroundColor = viewModel.backgroundColor;
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewModel.textEdgeInsets.left);
        make.top.mas_equalTo(viewModel.textEdgeInsets.top);
        make.bottom.mas_equalTo(-viewModel.textEdgeInsets.bottom);
        make.right.mas_equalTo(-viewModel.textEdgeInsets.right);
    }];
}

#pragma mark - ==================== action ====================


#pragma mark - ==================== delegate ====================


#pragma mark - ==================== setters & getters ====================


@end

@implementation ZZLabelCellModel

- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }


- (UIColor *)backgroundColor
{
    if (!_backgroundColor) {
        _backgroundColor = [UIColor whiteColor];
    }
    return _backgroundColor;
}

@end
