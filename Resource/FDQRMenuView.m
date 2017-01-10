//
//  FDQRMenuView.m
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDQRMenuView.h"

@implementation FDQRMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupQRButton];
        
    }
    
    return self;
}

- (void)setupQRButton {
    
    FDQRButton *qrButton = [[FDQRButton alloc] initWithFrame:(CGRect){
        .origin.x = 0,
        .origin.y = 0,
        .size.width = self.bounds.size.width / 2,
        .size.height = self.bounds.size.height
    } titile:@"二维码扫描"];
    qrButton.type = QRButtonTypeQRCode;
    [qrButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:qrButton];
    
    FDQRButton *otherButton = [[FDQRButton alloc] initWithFrame: (CGRect){
        
        .origin.x = self.bounds.size.width / 2,
        .origin.y = 0,
        .size.width = self.bounds.size.width / 2,
        .size.height = self.bounds.size.height
    } titile:@"条形码扫描"];
    [otherButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    otherButton.type = QRButtonTypeOther;
    [self addSubview:otherButton];
    
    [qrButton addTarget:self action:@selector(qrScan:) forControlEvents:UIControlEventTouchUpInside];
    [otherButton addTarget:self action:@selector(qrScan:) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma mark - Action

- (void)qrScan:(FDQRButton *)qrButton {
    
    if (self.didSelectedBlock) {
        
        self.didSelectedBlock(qrButton);
    }
}



@end
