//
//  WebViewController.m
//
//  Copyright (c) 2014 Satoshi Asano. All rights reserved.
//

#import "WebViewController.h"
#import "UIViewController+NJKFullScreenSupport.h"

@interface WebViewController ()
@property (strong, nonatomic) UIWebView *webView;
@property (nonatomic) NJKScrollFullScreen *scrollProxy;
@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webView = [[UIWebView alloc] init];
    [self.view addSubview:_webView];
    
    _scrollProxy = [[NJKScrollFullScreen alloc] initWithForwardTarget:self.webView];
    self.webView.scrollView.delegate = _scrollProxy;
    _scrollProxy.delegate = self;

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/macbook-pro/"]]];
}

// same as ViewController
#pragma mark -
#pragma mark NJKScrollFullScreenDelegate

- (void)scrollFullScreen:(NJKScrollFullScreen *)proxy scrollViewDidScrollUp:(CGFloat)deltaY
{
    [self moveNavigationBar:deltaY animated:YES];
    [self moveToolbar:-deltaY animated:YES]; // move to revese direction
}

- (void)scrollFullScreen:(NJKScrollFullScreen *)proxy scrollViewDidScrollDown:(CGFloat)deltaY
{
    [self moveNavigationBar:deltaY animated:YES];
    [self moveToolbar:-deltaY animated:YES];
}

- (void)scrollFullScreenScrollViewDidEndDraggingScrollUp:(NJKScrollFullScreen *)proxy
{
    [self hideNavigationBar:YES];
    [self hideToolbar:YES];
}

- (void)scrollFullScreenScrollViewDidEndDraggingScrollDown:(NJKScrollFullScreen *)proxy
{
    [self showNavigationBar:YES];
    [self showToolbar:YES];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_scrollProxy reset];
    [self showNavigationBar:YES];
    [self showToolbar:YES];
}

@end
