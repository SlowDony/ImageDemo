//
//  SetFontViewController.h
//  ImageDemo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 dony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetFontViewController : UIViewController

@property (nonatomic,copy)void (^fontTextBlock)(UIFont *font,UIColor *color);

@end
