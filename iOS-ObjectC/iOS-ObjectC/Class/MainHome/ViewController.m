//
//  ViewController.m
//  iOS-ObjectC
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "ViewController.h"
#import "LFShareViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *functionTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layoutPages];
    NSLog(@"测试");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"分享";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //分享
    if (indexPath.row == 0) {
        
        LFShareViewController *shareVC = [[LFShareViewController alloc] init];
        [self.navigationController pushViewController:shareVC animated:YES];
    }
}

#pragma mark - layout
- (void)layoutPages {
    
    self.title = @"功能";
    
    [self.view addSubview:self.functionTableView];
    [self.functionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

#pragma mark - getter
- (UITableView *)functionTableView {
    
    if (!_functionTableView) {
        
        _functionTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGFLOAT_MIN)];
        view.backgroundColor = ColorFromHEX(0xf5f5f5, 1);
        _functionTableView.tableHeaderView = view;
        _functionTableView.tableFooterView = view;
        
        _functionTableView.showsVerticalScrollIndicator = NO;
        
        _functionTableView.estimatedRowHeight = 0;
        _functionTableView.estimatedSectionHeaderHeight = 0;
        _functionTableView.estimatedSectionFooterHeight = 0;
        
        [_functionTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _functionTableView.delegate = self;
        _functionTableView.dataSource = self;
        
    }
    return _functionTableView;
}
@end
