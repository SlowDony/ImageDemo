//
//  SetFontViewController.m
//  ImageDemo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "SetFontViewController.h"
#define mdWidth [UIScreen mainScreen].bounds.size.width
#define mdHeight [UIScreen mainScreen].bounds.size.height


#define fontHightColor [UIColor colorWithRed:77/255.0f green:77/255.0f blue:77/255.0f alpha:1]

@interface SetFontViewController ()
{
    UILabel *fontLab;
    CGFloat fontValue;
    UIFont *font;
    UIColor *fontColor;
    
}
@end

@implementation SetFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    fontValue=12;
    self.view.backgroundColor=[UIColor whiteColor];
    font =[UIFont systemFontOfSize:fontValue];
    fontColor =fontHightColor;
    [self addNavView];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addNavView{
    
    UIView *navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0,mdWidth,64);
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    //
    UILabel *navTitle = [[UILabel alloc] init];
    navTitle.frame = CGRectMake(0, 20, mdWidth, 64-20);
    navTitle.backgroundColor = [UIColor clearColor];
    navTitle.textColor = [UIColor blackColor];
    navTitle.text = @"设置字体";
    
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
    if (self.fontTextBlock){
        self.fontTextBlock (font,fontColor);
    }
    
    
    
}
-(void)setupUI{
    
    
    [self addHeadTitle:@"1.滑动下方滑块改变字体大小" andH:64];
    
    [self addUISlider];
    
    [self addHeadTitle:@"2.选择字体颜色" andH:240];

    [self addColorBtn];
    
    [self addHeadTitle:@"3.选择字体" andH:380];
    
    [self addFontTypeBtn];
    
    
}

-(void)addUISlider{
    
    
    //
    fontLab = [[UILabel alloc] init];
    fontLab.frame = CGRectMake(0, 100, mdWidth, 60);
    fontLab.backgroundColor = [UIColor clearColor];
    fontLab.textColor = [UIColor blackColor];
    fontLab.text = @"支持动态字体";
    fontLab.textAlignment = NSTextAlignmentCenter;
    fontLab.font = [UIFont systemFontOfSize:fontValue];
    fontLab.numberOfLines = 0;
    [self.view addSubview:fontLab];
    
    UILabel *smallA = [[UILabel alloc] init];
    smallA.frame = CGRectMake(10, 150, 60, 60);
    smallA.backgroundColor = [UIColor clearColor];
    smallA.textColor = [UIColor blackColor];
    smallA.text = @"A";
    smallA.textAlignment = NSTextAlignmentCenter;
    smallA.font = [UIFont systemFontOfSize:10];
    smallA.numberOfLines = 0;
    [self.view addSubview:smallA];
    
    UILabel *bigA = [[UILabel alloc] init];
    bigA.frame = CGRectMake(mdWidth-60, 150, 60, 60);
    bigA.backgroundColor = [UIColor clearColor];
    bigA.textColor = [UIColor blackColor];
    bigA.text = @"A";
    bigA.textAlignment = NSTextAlignmentCenter;
    bigA.font = [UIFont systemFontOfSize:50];
    bigA.numberOfLines = 0;
    [self.view addSubview:bigA];
    
    
    
    UISlider * slider =[[UISlider alloc]init];
    slider.frame=CGRectMake(20, 200, mdWidth-40, 30);
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue=50;
    slider.minimumValue=10;
    slider.value=12;
    [self.view addSubview:slider];
    
   
}

-(void)slider:(UISlider *)slider{
    UIButton *defautbtn =[self.view viewWithTag:20];
    
    fontValue =slider.value;
    
    if (defautbtn.selected==YES){
        
        font =[UIFont systemFontOfSize:fontValue];
        fontLab.font=font;
    }else {
        font=[UIFont fontWithName:@"FZQingKeBenYueSongS-R-GB" size:fontValue];
        fontLab.font=font;
        
    }
}

-(void)addHeadTitle:(NSString *)title andH:(CGFloat )h{
    
    UILabel *line = [[UILabel alloc] init];
    line.frame = CGRectMake(0, h, mdWidth, 0.5);
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    //
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, h, mdWidth-40, 50);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.text = title;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

-(void)addColorBtn{
    
    for (int i =0 ;i<3;i++){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(48+(i*((mdWidth-4*48)/3+48)), 310, (mdWidth-4*48)/3, (mdWidth-4*48)/3);
        
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn  addTarget:self action:@selector(colorBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+10;
        btn.layer.cornerRadius=(mdWidth-4*48)/3/2;
        btn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth=0.5;
        btn.layer.masksToBounds=YES;
        
        if (i==1){
            [btn setBackgroundColor:fontHightColor];
        }else if (i==2){
            [btn setBackgroundColor:[UIColor blackColor]];
        }else {
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
        [self.view addSubview: btn];
        
    }
}
-(void)colorBtn:(UIButton *)sender{
    
    if (sender.tag==10){
        
        fontColor =[UIColor whiteColor];
        fontLab.backgroundColor = fontHightColor;
        fontLab.textColor = [UIColor whiteColor];
    }else if (sender.tag==11){
        fontLab.backgroundColor = [UIColor clearColor];
        fontLab.textColor = fontHightColor;
        fontColor =fontHightColor;
    }else if (sender.tag==12){
        fontLab.backgroundColor = [UIColor clearColor];
        fontLab.textColor = [UIColor blackColor];
        fontColor =[UIColor blackColor];
    }
    
}
-(void)addFontTypeBtn {
    
    NSArray *arr =[[NSArray alloc]initWithObjects:@"系统默认",@"方正清刻", nil];
    
    for (int i =0 ;i<2;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(mdWidth/2-40+40)*i, 450,mdWidth/2-40, 40);
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.tag=20+i;
        [btn  addTarget:self action:@selector(typeBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius=2;
        btn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth=0.5;
        btn.layer.masksToBounds=YES;
        
        if (i==1)
        {
            
            btn.titleLabel.font=[UIFont fontWithName:@"FZQingKeBenYueSongS-R-GB" size:15];
            
            btn.selected=NO;
        }else
        {
            btn.titleLabel.font=[UIFont systemFontOfSize:15];
            btn.selected=YES;
        }
        
        [self.view addSubview: btn];
        
    }
}
-(void)typeBtn:(UIButton *)sender{
    for (int i =0;i<2;i++){
        UIButton *btn =[self.view viewWithTag:i+20];
        if (sender.tag==btn.tag){
            btn.selected=YES;
        }else {
            btn.selected=NO;
        }
    }
    UIButton *btn =[self.view viewWithTag:20];
    
    if (btn.selected==YES){
        font =[UIFont systemFontOfSize:fontValue];
        fontLab.font=font;
    }else {
        font=[UIFont fontWithName:@"FZQingKeBenYueSongS-R-GB" size:fontValue];
        fontLab.font=font;
        
    }
    
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
