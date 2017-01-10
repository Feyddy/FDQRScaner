//
//  FDQRUtil.h
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FDQRUtil : NSObject
+ (CGRect)screenBounds;

+ (AVCaptureVideoOrientation) videoOrientationFromCurrentDeviceOrientation;
@end
