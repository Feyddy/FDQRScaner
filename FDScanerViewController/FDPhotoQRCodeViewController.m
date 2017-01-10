//
//  FDPhotoQRCodeViewController.m
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDPhotoQRCodeViewController.h"

@interface FDPhotoQRCodeViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation FDPhotoQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    [self defaultQRImageView];

}

- (void)defaultQRImageView {
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QRCode"]];
    self.imageView.frame = CGRectMake(0, 0, 250, 250);
    self.imageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    //给二维码添加长按手势识别二维码的功能
    UILongPressGestureRecognizer *longPressGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidLongPressed:)];
    longPressGes.minimumPressDuration = 1.5;
    [self.imageView addGestureRecognizer:longPressGes];
}

- (void)imageViewDidLongPressed:(UILongPressGestureRecognizer *)ges {
    
    //因为长按手势开始和结束会调用两次这个方法，所以按自己的逻辑处理
    if(ges.state == UIGestureRecognizerStateBegan) {
        
        [self readPhotoQR];
        
    } else if(ges.state == UIGestureRecognizerStateEnded) {
        
    }else if(ges.state == UIGestureRecognizerStateChanged) {
        
    }
    
}

- (void)readPhotoQR {
    
    UIImage *srcImage = self.imageView.image;
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *image = [CIImage imageWithCGImage:srcImage.CGImage];
    NSArray *features = [detector featuresInImage:image];
    CIQRCodeFeature *feature = [features firstObject];
    
    NSString *result = feature.messageString;
    
    UIAlertController *controller;
    
    if ([result isEqualToString:@""] || result.length == 0) {
        
        controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"此二维码没有数据！" preferredStyle:UIAlertControllerStyleAlert];
    } else {
        
        controller = [UIAlertController alertControllerWithTitle:@"提示" message:result preferredStyle:UIAlertControllerStyleAlert];
        
    }
    
    [self presentViewController:controller animated:YES completion:nil];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:action];
}






@end
