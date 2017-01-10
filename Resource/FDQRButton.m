//
//  FDQRButton.m
//  FDScanerViewController
//
//  Created by 徐忠林 on 10/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDQRButton.h"
#import <objc/runtime.h>


@implementation FDQRButton

- (instancetype)initWithFrame:(CGRect)frame
                       titile:(NSString *)titile{
    
    self =  [FDQRButton buttonWithType:UIButtonTypeSystem];
    if (self) {
        
        [self setTitle:titile forState:UIControlStateNormal];
        self.frame = frame;
    }
    return self;
}

@end
