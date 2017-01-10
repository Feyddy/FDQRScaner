//
//  FDQRCodeViewController.h
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ScanCompleteBlock)(NSString *url);

@interface FDQRCodeViewController : UIViewController

@property (nonatomic, copy, readonly) NSString *urlString;

- (instancetype)initWithScanCompleteHandler:(ScanCompleteBlock)scanCompleteBlock;

- (void)stopRunning;

@end
