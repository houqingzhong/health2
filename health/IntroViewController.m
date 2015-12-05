//
//  IntroViewController.m
//  health
//
//  Created by lizhuzhu on 15/10/29.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import "IntroViewController.h"
#import "HPublic.h"

@interface IntroViewController()<NJKScrollFullscreenDelegate, UIScrollViewDelegate, UIWebViewDelegate>
{
    NJKScrollFullScreen     *_scrollProxy;
    
    BOOL                            _fileExist;
    NSURL                          *_targetURL;
}

@property (nonatomic, strong) UIWebView *webView;;


@end

@implementation IntroViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[UIDevice currentDevice] setOrientation:UIDeviceOrientationLandscapeRight];
    [self od_setStatusBarStyle:UIStatusBarStyleLightContent];
    

    _scrollProxy = [[NJKScrollFullScreen alloc] initWithForwardTarget:self];
    self.webView.scrollView.delegate = _scrollProxy;
    _scrollProxy.delegate = self;
    self.webView.delegate = self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.webView.frame = self.view.bounds;
}

//- (void)loadHtml:(NSString *)fileName
//{
//    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
//    NSURL* url = [NSURL fileURLWithPath:path];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
//    [_webView loadRequest:request];
//
//}

- (void)loadPath:(NSURL *)fileURL
{

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString *docPath = [HPublicMethod documentsDirectoryPath];
    NSString *pathToDownloadTo = [NSString stringWithFormat:@"%@/%@", docPath, [NSString stringWithFormat:@"%@.%@", [fileURL.absoluteString tb_MD5String], fileURL.pathExtension]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    _fileExist = [fileManager fileExistsAtPath:pathToDownloadTo];
    NSURL *targetURL = [NSURL fileURLWithPath:pathToDownloadTo];

    if (!_fileExist) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *fileData = [[NSData alloc] initWithContentsOfURL:fileURL];
            NSString *docPath = [HPublicMethod documentsDirectoryPath];
            NSString *pathToDownloadTo = [NSString stringWithFormat:@"%@/%@", docPath, [NSString stringWithFormat:@"%@%@", [fileURL.absoluteString tb_MD5String], fileURL.pathExtension]];
            [fileData writeToFile:pathToDownloadTo atomically:YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSURLRequest* request = [NSURLRequest requestWithURL:targetURL] ;
                [self.webView loadRequest:request];
            });
            
        });
    }

}

#pragma mark webview delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
}


#pragma mark NJKScrollFullScreen

- (void)scrollFullScreen:(NJKScrollFullScreen *)proxy scrollViewDidScrollUp:(CGFloat)deltaY
{
    [self moveNavigationBar:deltaY animated:YES];
}

- (void)scrollFullScreen:(NJKScrollFullScreen *)proxy scrollViewDidScrollDown:(CGFloat)deltaY
{
    [self moveNavigationBar:deltaY animated:YES];
}

- (void)scrollFullScreenScrollViewDidEndDraggingScrollUp:(NJKScrollFullScreen *)proxy
{
    [self hideNavigationBar:YES];
}

- (void)scrollFullScreenScrollViewDidEndDraggingScrollDown:(NJKScrollFullScreen *)proxy
{
    [self showNavigationBar:YES];
}

#pragma mark changeOrientation
- (void)changeOrientation
{
    [self showNavigationBar:YES];
    
    self.webView.frame = self.view.bounds;
}

#pragma mark initial view

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
    }
    
    if (!_webView.superview) {
        [self.view addSubview:_webView];
    }

    return _webView;
}
@end
