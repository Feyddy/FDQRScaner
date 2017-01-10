//
//  FDQRView.h
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDQRMenuView.h"

@protocol FDQRViewDelegate <NSObject>

- (void)scanTypeConfig:(FDQRButton *)item;

@end

@interface FDQRView : UIView
@property (nonatomic, weak) id<FDQRViewDelegate> delegate;
/**
 *  透明的区域
 */
@property (nonatomic, assign) CGSize transparentArea;
@end
