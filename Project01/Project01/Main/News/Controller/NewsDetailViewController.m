//
//  NewsDetailViewController.m
//  Project01
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    [self.view addSubview:_webView];
    [self _loadData];
}
-(void)_loadData{
    NSDictionary *jsonDic = (NSDictionary *)[JsonField jsonField:@"news_detail.json"];
    
    NSString *title = [jsonDic objectForKey:@"title"];
    NSString *content = [jsonDic objectForKey:@"content"];
    NSString *source = [jsonDic objectForKey:@"source"];
    NSString *time = [jsonDic objectForKey:@"time"];
    NSString *anthor = [jsonDic objectForKey:@"anthor"];
    
    //读取网络数据
    NSString *fieldString = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:fieldString encoding:NSUTF8StringEncoding error:nil];
    
    //拼接标题
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    //拼接作者
    NSString *subAuthor = [NSString stringWithFormat:@"来自强大的作者:%@",anthor];
    //拼接html文件
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,subAuthor];
    
    //将html文件添加到视图上
    [_webView loadHTMLString:htmlString baseURL:nil];
    _webView.delegate = self;
    //视图内容自适应
    _webView.scalesPageToFit = YES;
    
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.frame = CGRectMake(0, 0, 50, 50);
    _activityView.center = self.view.center;
    
    [self.view addSubview:_activityView];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityView startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
