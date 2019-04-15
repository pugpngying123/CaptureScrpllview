//
//  ViewController.m
//  CaptureScrpllview
//
//  Created by wochu on 2019/4/15.
//  Copyright © 2019年 Fhj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (UIImage *)CaptureScrollView:(UIScrollView *)scrollView{
    UIImage* image = nil;
    //    UIGraphicsBeginImageContext(scrollView.contentSize);
    //优化分享截屏模糊
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, 0.0);    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}


@end
