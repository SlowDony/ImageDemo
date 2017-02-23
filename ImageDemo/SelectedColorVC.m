//
//  SelectedColorVC.m
//  DrowImage
//
//  Created by 高备资产 on 16/8/3.
//  Copyright © 2016年 高备资产. All rights reserved.
//
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
#import "SelectedColorVC.h"
#import "HRColorPickerView.h"
#import "HRColorInfoView.h"
#import "HRBrightnessSlider.h"
#import "HRColorMapView.h"

@interface SelectedColorVC ()
@property (weak, nonatomic)HRColorPickerView *SelectedColorPickerView;
@end

@implementation SelectedColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavView];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    HRColorPickerView *colorPickV = [[HRColorPickerView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    self.SelectedColorPickerView = colorPickV;
    colorPickV.backgroundColor = [UIColor whiteColor];
    colorPickV.color = [UIColor colorWithHue:0
                                  saturation:1
                                  brightness:1
                                       alpha:1];
    [self.view addSubview:colorPickV];

    
}

-(void)addNavView{
    
    UIView *navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0,WIDTH,64);
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    //
    UILabel *navTitle = [[UILabel alloc] init];
    navTitle.frame = CGRectMake(0, 20, WIDTH, 64-20);
    navTitle.backgroundColor = [UIColor clearColor];
    navTitle.textColor = [UIColor blackColor];
    navTitle.text = @"设置颜色";
    
    navTitle.textAlignment = NSTextAlignmentCenter;
    navTitle.font = [UIFont systemFontOfSize:20];
    navTitle.numberOfLines = 0;
    [navView addSubview:navTitle];
    
    //
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = CGRectMake(20, 20, 40, 44);
    [backbtn setTitle:@"返回" forState:UIControlStateNormal];
    [backbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backbtn  addTarget:self action:@selector(backbtn) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview: backbtn];
    
    
    
    
}
-(void)backbtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    if (self.delegate) {
        [self.delegate setSelectedColor:self.SelectedColorPickerView.color];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
