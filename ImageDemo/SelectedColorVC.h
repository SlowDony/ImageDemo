//
//  SelectedColorVC.h
//  DrowImage
//
//  Created by 高备资产 on 16/8/3.
//  Copyright © 2016年 高备资产. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SelectedColorPickerViewControllerDelegate
- (void)setSelectedColor:(UIColor *)color;
@end

@interface SelectedColorVC : UIViewController
@property (weak) id <SelectedColorPickerViewControllerDelegate> delegate;
//@property (strong, nonatomic) UIColor *selectedColor;
@end