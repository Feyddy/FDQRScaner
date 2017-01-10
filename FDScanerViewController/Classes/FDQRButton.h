//
//  FDQRButton.h
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, QRButtonType) {
    QRButtonTypeQRCode = 0,
    QRButtonTypeOther,
};

@interface FDQRButton : UIButton

@property (nonatomic, assign) QRButtonType type;

- (instancetype)initWithFrame:(CGRect)frame
                       titile:(NSString *)titile;
@end
