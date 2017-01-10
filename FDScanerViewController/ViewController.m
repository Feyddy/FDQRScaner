//
//  ViewController.m
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "FDQRCodeViewController.h"
#import "FDPhotoQRCodeViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)openQR:(id)sender {
    if ([self validateCamera] && [self canUseCamera]) {
        
        [self showQRViewController];
        
    } else {
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有摄像头或摄像头不可用" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:controller animated:YES completion:nil];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [controller addAction:action];
        
    }
}

- (IBAction)readPhotoQR:(id)sender {
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
    
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"这个功能必须8.0系统之后才能使用" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:controller animated:YES completion:nil];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [controller addAction:action];
        
        return;
    }
    
    [self showPhotoQRViewController];
}



-(BOOL)canUseCamera {
    
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设备的设置-隐私-相机中允许访问相机。" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:controller animated:YES completion:nil];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [controller addAction:action];
        
        return NO;
    }
    
    return YES;
}

-(BOOL)validateCamera {
    
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] &&
    [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}


- (void)showQRViewController {
    
    FDQRCodeViewController *vc = [[FDQRCodeViewController alloc] initWithScanCompleteHandler:^(NSString *url) {
    }];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showPhotoQRViewController {
    
    FDPhotoQRCodeViewController *vc = [[FDPhotoQRCodeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

