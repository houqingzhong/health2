//
//  WebViewDetailController.m
//  health
//
//  Created by lizhuzhu on 15/10/29.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import "WebViewDetailController.h"
#import "HPublic.h"

@interface WebViewDetailController ()
{
    UIWebView   *_webView;
}
@property (nonatomic, strong) NSDictionary *dict;
@end

@implementation WebViewDetailController

- (void)dealloc
{
    
}

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
    
    NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"7.0" options: NSNumericSearch];
    if (order == NSOrderedSame || order == NSOrderedDescending)
    {
        // OS version >= 7.0
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = YES ;
    }
    
    _webView = [[UIWebView alloc] init];
    
    [self.view addSubview:_webView];

    [_webView anchorTopLeftWithLeftPadding:0 topPadding:0 width:self.view.width height:self.view.height];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:_dict[@"html"] ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [_webView loadRequest:request];

}


- (void)loadData:(NSDictionary *)dict
{
    
}


@end
