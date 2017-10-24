//
//  ViewController.m
//  test_Gif
//
//  Created by rongxin on 2017/7/7.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"

@interface ViewController ()
@property(nonatomic,strong)NSData *imageData;
@end

@implementation ViewController

-(NSData *)imageData {
    
    if (!_imageData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"magic" ofType:@"gif"];
        _imageData = [NSData dataWithContentsOfFile:path];
    }
    return _imageData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self SDLoadLocalGif];
    
    [self SDLoadNetwarkGif];
    
//    [self webViewLoadGif];
    
}

-(void)SDLoadLocalGif {
    FLAnimatedImageView *gifView = [[FLAnimatedImageView alloc] initWithFrame:self.view.bounds];
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:self.imageData];
//    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:self.imageData];
    // optimalFrameCacheSize不为0时，动画会变慢
//    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:self.imageData optimalFrameCacheSize:1 predrawingEnabled:YES];
    
    gifView.animatedImage = image;
    gifView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:gifView];
}

-(void)SDLoadNetwarkGif {
    FLAnimatedImageView *gifView = [[FLAnimatedImageView alloc] initWithFrame:self.view.bounds];
//    NSString *urlStr = @"http://img4.duitang.com/uploads/item/201211/24/20121124112047_KUFxK.gif";
    NSString *urlStr = @"http://7jpnak.com1.z0.glb.clouddn.com/-2_1508812812584_扭蛋机动效3.gif";
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [gifView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
    gifView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:gifView];
}

-(void)webViewLoadGif {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dancer" ofType:@"gif"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSURL *baseURL = [url URLByDeletingLastPathComponent];
    
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:baseURL];
    [self.view addSubview:webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
