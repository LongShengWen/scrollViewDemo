//
//  swScrollViewController.m
//  scrollViewDemo
//
//  Created by 粟黄 on 2018/6/25.
//  Copyright © 2018年 lsw. All rights reserved.
//

#import "swScrollViewController.h"
#import <Masonry/Masonry.h>
#import <WebKit/WKWebView.h>

@interface swScrollViewController ()

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) WKWebView *webView;

@end

@implementation swScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildUI];
}
- (void)buildUI
{
    self.tableView.hidden = NO;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        [self.scrollView addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.webView.mas_bottom);
            make.left.right.mas_equalTo(self.scrollView);
            make.height.mas_equalTo(400);
        }];
        _tableView.backgroundColor = [UIColor greenColor];
    }
    
    return _tableView;
}
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]init];
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    
    return _scrollView;
}
- (WKWebView *)webView
{
    if (_webView == nil) {
        _webView = [[WKWebView alloc]init];
        [self.scrollView addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.left.mas_equalTo(_scrollView);
            make.height.mas_equalTo(100);
        }];
        _webView.backgroundColor = [UIColor blueColor];
    }
    return _webView;
}
@end
