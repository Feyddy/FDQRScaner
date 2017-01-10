//
//  FDQRMenuView.h
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDQRButton.h"

typedef void(^QRMenuDidSelectedBlock)(FDQRButton *button);


@interface FDQRMenuView : UIView
@property (nonatomic, copy) QRMenuDidSelectedBlock didSelectedBlock;

- (instancetype)initWithFrame:(CGRect)frame;
@end
