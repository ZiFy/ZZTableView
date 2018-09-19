//
//  ZZTableViewManager.m
//  ZZTableView
//
//  Created by 赵梁 on 2018/7/28.
//  Copyright © 2018年 layzhao. All rights reserved.
//

#import "ZZTableViewDataManager.h"

#import "UITableViewCell+ZZDataBind.h"

@interface ZZTableViewDataManager ()

@property (nonatomic, strong, readwrite) NSMutableArray* cellModels;//!<
@property (nonatomic, weak, readwrite) UITableView* tableView;//!<

@end

@implementation ZZTableViewDataManager

#pragma mark - ==================== Life Circle ====================

- (instancetype)initWithTableView:(UITableView *)tableView cellModels:(NSArray *)cellModels
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
        if (cellModels.count == 0) {
            cellModels = @[];
        }
        self.cellModels = [NSMutableArray arrayWithArray:cellModels];
        [self registerCells];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@:%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

#pragma mark - ==================== delegate ====================
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject<ZZTableViewCellModelProtocal> *cellModel = self.cellModels[indexPath.row];
    Class CellClass = [self getCellClass:cellModel];
    
    UITableViewCell *cell = [CellClass zz_cellForTableView:tableView];
    [cell zz_bindModel:cellModel];
    if ([cellModel conformsToProtocol:@protocol(ZZTableViewCellModelProtocal)]) {
        cellModel.cell = cell;
        cellModel.tableView = tableView;
    }
    return cell;
}

- (Class)getCellClass:(NSObject*)cellModel
{
    NSString *cellModelClass = NSStringFromClass(cellModel.class);
    NSString *modelStr = @"Model";
    NSAssert([cellModelClass hasSuffix:modelStr], @"格式不对");
    NSRange modelRange = [cellModelClass rangeOfString:modelStr options:NSBackwardsSearch];
    NSString *cellClassStr = [cellModelClass substringToIndex:modelRange.location];
    Class CellClass = NSClassFromString(cellClassStr);
    return CellClass;
}

- (void)registerCells
{
    [self.cellModels enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self registerCell:obj];
    }];
}

- (void)registerCell:(id)cellModel
{
    Class CellClass = [self getCellClass:cellModel];
    NSString *cellIdentifier = [CellClass zz_cellIdentifier];
    NSString *cellString = NSStringFromClass(CellClass);
    NSString *xib = [[NSBundle mainBundle] pathForResource:cellString ofType:@"nib"];
    if (xib.length > 0) {
        [self.tableView registerNib:[UINib nibWithNibName:cellString bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
}

- (void)addCellModel:(id)cellModel
{
    [self.cellModels addObject:cellModel];
    [self registerCell:cellModel];
}

- (void)resetCellModels:(NSArray *)cellModels
{
    if (cellModels.count == 0) {
        cellModels = @[];
    }
    self.cellModels = [NSMutableArray arrayWithArray:cellModels];
    [self registerCells];
}

- (NSArray *)getCellModels
{
    return [NSArray arrayWithArray:self.cellModels];
}
#pragma mark - ==================== setters & getters ====================


- (NSMutableArray *)cellModels
{
    if (!_cellModels) {
        _cellModels = ({
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
            array;
        });
    }
    return _cellModels;
}

@end
