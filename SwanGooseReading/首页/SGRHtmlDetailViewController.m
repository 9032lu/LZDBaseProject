//
//  SGRHtmlDetailViewController.m
//  SwanGooseReading
//
//  Created by ZhangTu on 2018/11/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "SGRHtmlDetailViewController.h"
#import <WebKit/WebKit.h>
@interface SGRHtmlDetailViewController ()<WKNavigationDelegate>
/**
 <#Description#>
 */
@property (nonatomic,strong)  WKWebView*webView;
@property(nonatomic,strong)UIProgressView *progressView;

@end

@implementation SGRHtmlDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];

    if (@available(iOS 11.0, *)) {
        _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.webView.navigationDelegate = self;
    [self progressView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];

    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    [self.webView loadRequest:request];
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
}
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    
}

#pragma mark 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"])
    {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1)
        {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }
        else
        {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
    if (object == self.webView && [keyPath isEqualToString:@"title"])
    {
        
        self.title = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"======%@",change);
        
    }
}


- (WKWebView *)webView{
    
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        // 设置偏好设置
        config.preferences = [[WKPreferences alloc] init];
        // 默认为0
        config.preferences.minimumFontSize = 10;
        // 默认认为YES
        config.preferences.javaScriptEnabled = YES;
        // 在iOS上默认为NO，表示不能自动通过窗口打开
        config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        config.processPool = [[WKProcessPool alloc] init];
        // 通过JS与webview内容交互
        config.userContentController = [[WKUserContentController alloc] init];
        
//        // 注入JS对象名称AppModel，当JS通过AppModel来调用时，
//        // 我们可以在WKScriptMessageHandler代理中接收到
//        [config.userContentController addScriptMessageHandler:self name:@"AppModel"];
//        if (_type ==9||_type ==10) {
//            [config.userContentController addScriptMessageHandler:self name:@"goPage"];
//
//        }
//
//
            _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, StatusBarAndNavigationBarHeight, ScreenWidth, ScreenHeight - StatusBarAndNavigationBarHeight) configuration:config];

        _webView.scrollView.bounces = NO;
        // 这行代码可以是侧滑返回webView的上一级，而不是根控制器（*只针对侧滑有效）
        [_webView setAllowsBackForwardNavigationGestures:true];
        
    }
    return _webView;
}

//进度条
- (UIProgressView *)progressView
{
    if (!_progressView)
    {
        UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, StatusBarAndNavigationBarHeight, self.view.frame.size.width, 2)];
      
        progressView.tintColor = ZTBTNCOLOR;
        progressView.trackTintColor = [UIColor whiteColor];
        [self.view addSubview:progressView];
        self.progressView = progressView;
    }
    return _progressView;
}


-(void)dealloc{
    
    NSLog(@"dealloc");
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
     [self.webView removeObserver:self forKeyPath:@"title" context:nil];
}

@end
