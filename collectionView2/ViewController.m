//
//  ViewController.m
//  collectionView2
//
//  Created by 张旭 on 16/7/21.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ViewController.h"
static NSString *cell1 = @"cell1";
static NSString *cell2 = @"cell2";

//#define width self.view.frame.size.width;
//#define height self.view.frame.size.height;
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong)UITableView *rigthView;

@property (nonatomic,strong)UITableView *lightView;
@property (nonatomic, strong)UIScrollView *slideScrollView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//
//    _rigthView.frame =CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
//    _lightView.frame = CGRectMake(0, 0, self.view.frame.size.width*2,  self.view.frame.size.height);
//    _slideScrollView .frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width,  self.view.frame.size.height);
   
    


    
    _rigthView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
    _lightView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*2-100,  self.view.frame.size.height)];
    _slideScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2,  self.view.frame.size.height)];
     _slideScrollView.contentSize = CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height);
    
    _slideScrollView.showsVerticalScrollIndicator = YES;
    _slideScrollView.showsHorizontalScrollIndicator = YES;
    _slideScrollView.backgroundColor = [UIColor cyanColor];
  
    [_rigthView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell1];
    [_lightView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell2];
    
    _rigthView.dataSource =self;
    _rigthView.delegate =self;
    _lightView.delegate = self;
    _lightView.dataSource =self;
    
    [self.view addSubview:_rigthView];
    
    [self.view addSubview:_slideScrollView];
    [_slideScrollView addSubview:_lightView];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//-(UICollectionView *)rigthView{
//    
//    if (!_rigthView) {
//        _rigthView = [self rigthView];
//    }
//    
//    return _rigthView;
//}
//
//-(UICollectionView *)lightView{
//    
//    if (!_lightView) {
//        _lightView = [self lightView];
//    }
//    return _lightView;
//    
//}
//
//-(UIScrollView *)slideScrollView{
//    
//    if (!_slideScrollView) {
//        _slideScrollView = [self slideScrollView];
//    }
//    return _slideScrollView;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _rigthView) {
        return 100;
    }else{
        return 100;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _rigthView) {
        UITableViewCell *cell = [_rigthView dequeueReusableCellWithIdentifier:cell1 forIndexPath:indexPath];
        return cell;
    }else{
        
        UITableViewCell *cell1 = [_lightView dequeueReusableCellWithIdentifier:cell2 forIndexPath:indexPath];
        UILabel *label= [[UILabel alloc]initWithFrame:cell1.frame];
        label.text =  @(indexPath.item).stringValue;
        [cell1 addSubview:label];
        return cell1;
        
    }

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView != self.slideScrollView) {
        [_rigthView setContentOffset:scrollView.contentOffset];
        [_lightView setContentOffset:scrollView.contentOffset];
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
