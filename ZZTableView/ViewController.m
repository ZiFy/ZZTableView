//
//  ViewController.m
//  ZZTableView
//
//  Created by 赵梁 on 2018/9/18.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+ZZTableViewDataManager.h"
#import "ZZBlankAreaCell.h"
#import "ZZLabelCell.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]



#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.estimatedRowHeight = 100;
    
    NSMutableArray *cells = [NSMutableArray array];
    
    NSMutableString *text = [NSMutableString string];
    CGFloat height = 10;
    for (int i = 0 ; i < 20; i++) {
        
        [text appendString:@"这是一段文字，有点文盲。"];
        ZZBlankAreaCellModel *area = [ZZBlankAreaCellModel new];
        area.color = randomColor;
        area.height = height;
        [cells addObject:area];
        height += 10;
        ZZLabelCellModel *model = [ZZLabelCellModel new];
        model.backgroundColor = randomColor;
        model.attributedText = [[NSAttributedString alloc] initWithString:text];
//        model.textEdgeInsets = UIEdgeInsetsMake(i, 0, 0, 0);
        [cells addObject:model];
    }
    [self.tableView.zz_tableViewDataSource resetCellModels:cells];
}


@end
