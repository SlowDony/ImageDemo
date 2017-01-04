//
//  ViewController.m
//  ImageDemo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "ViewController.h"

#import "SetFontViewController.h"
#import "SelectedColorVC.h"
#define mdWidth [UIScreen mainScreen].bounds.size.width
#define mdHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UITextViewDelegate,SelectedColorPickerViewControllerDelegate>
{
    UIImageView *topImageView;
    UITextView *textView;
    UILabel *nameLabel;
    UIImage *image ;
}
@property (strong, nonatomic) SelectedColorVC *selectedColorVC;
@property (strong,nonatomic)SetFontViewController *setFontViewVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view, typically from a nib.
}
//隐藏电池栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupUI{
    

    //
    topImageView = [[UIImageView alloc] init];
    topImageView.frame = CGRectMake(40, 40, mdWidth-80, (mdWidth-80)*3/4);
    topImageView.image = [UIImage imageNamed:@"addImage"];
    topImageView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:topImageView];
    
    //
    UIButton *imagebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imagebtn.frame = CGRectMake(40, 40, mdWidth-80, (mdWidth-80)*3/4);
    
    [imagebtn  addTarget:self action:@selector(imageBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: imagebtn];

    
    textView =[[UITextView alloc]init];
    textView.frame =CGRectMake(40, (mdWidth-80)*3/4+80, mdWidth-80,mdHeight -130-((mdWidth-80)*3/4+80));
    textView.text =@"哈哈";
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor blackColor];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.font = [UIFont systemFontOfSize:15];
    textView.delegate=self;
    [self setTextViewFontLine];
    [self.view addSubview:textView];
    
    //
    UIImageView *erImageView = [[UIImageView alloc] init];
    erImageView.frame = CGRectMake(mdWidth-110, mdHeight-110, 70, 70);
    erImageView.image = [UIImage imageNamed:@"erImage"];
    [self.view addSubview:erImageView];

    //
    nameLabel= [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(0, mdHeight-110+45, mdWidth, 30);
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"<史姑娘>";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.numberOfLines = 0;
    [self.view addSubview:nameLabel];
    
    //
    UIButton *topLeftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topLeftbtn.frame = CGRectMake(0, 0, 40, 40);
    topLeftbtn.tag=1001;
    topLeftbtn.backgroundColor=[UIColor clearColor];
    [topLeftbtn  addTarget:self action:@selector(topBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: topLeftbtn];
    
    //
    UIButton *topRightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topRightbtn.frame = CGRectMake(mdWidth-40, 0, 40, 40);
    topRightbtn.tag=1002;
    topRightbtn.backgroundColor=[UIColor clearColor];
    [topRightbtn  addTarget:self action:@selector(topBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: topRightbtn];
    
    //
    UIButton *bottomLeftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomLeftbtn.frame = CGRectMake(0,mdHeight-40, 40, 40);
    bottomLeftbtn.tag=1003;
    bottomLeftbtn.backgroundColor=[UIColor clearColor];
    [bottomLeftbtn  addTarget:self action:@selector(bottombtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: bottomLeftbtn];
    
    //
    UIButton *bottomRightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomRightbtn.frame = CGRectMake(mdWidth-40, mdHeight-40, 40, 40);
    bottomRightbtn.tag=1004;
    bottomRightbtn.backgroundColor=[UIColor clearColor];
    [bottomRightbtn  addTarget:self action:@selector(bottombtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomRightbtn];
    
     self.selectedColorVC.delegate = self;
}

-(void)imageBtn{
    //创建一个ActionSheet
    UIActionSheet *headActionSheet =[[UIActionSheet alloc]initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选择",@"拍照", nil];
    [headActionSheet showInView:self.view];
    
    
}

-(void)topBtn:(UIButton *)sender{
    if (sender.tag==1001)
    {
        UIGraphicsBeginImageContext(self.view.bounds.size);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector (image:didFinishSavingWithError:contextInfo:), nil);
        
    }else if (sender.tag==1002){
        
        
        self.setFontViewVC.fontTextBlock =^(UIFont *font,UIColor *color){
            
            textView.font =font;
            textView.textColor =color;
        };
        [self presentViewController:self.setFontViewVC animated:YES completion:nil];
    }
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(error) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"保存至相册失败" message:   [NSString  stringWithFormat:@"error是%@",error.localizedDescription]delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }else{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"保存成功" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

-(SetFontViewController *)setFontViewVC{
    if(!_setFontViewVC){
        self.setFontViewVC =[[SetFontViewController alloc]init];
    }
    return _setFontViewVC;
}
-(SelectedColorVC *)selectedColorVC{
    if (!_selectedColorVC) {
        self.selectedColorVC = [[SelectedColorVC alloc]init];
        
    }
    return _selectedColorVC;
}


-(void)bottombtn:(UIButton *)sender{
    if (sender.tag==1003)
    {
        self.view.backgroundColor=[UIColor whiteColor];
        
    }else{
        [self presentViewController:self.selectedColorVC animated:YES completion:nil];
    }
}

- (void)setSelectedColor:(UIColor *)color{
    
    self.view.backgroundColor=color;
}
#pragma mark - 上传图片
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    // NSLog(@"点击了:%ld",buttonIndex);
    switch (buttonIndex) {
        case 0://从相册选择
        {
            [self createImagePickerControl];
        }
            break;
        case 1: //从相机选择
        {
            //[self createImagePickerControl];
            [self createImagePickerControlCamera];
        }
            break;
        default:
            break;
    }
    
    
    
}
//图片
- (void)createImagePickerControl{
    UIImagePickerController *headImagePickerControl =[[UIImagePickerController alloc]init];
    //设置从照片库中选择照片
    [headImagePickerControl setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //设置允许编辑图片
    [headImagePickerControl setAllowsEditing:YES];
    //设置代理
    [headImagePickerControl setDelegate:self];
    //弹出图片的选择器
    [self presentViewController:headImagePickerControl animated:YES completion:nil];
}

//相机
- (void)createImagePickerControlCamera{
    UIImagePickerController *headImagePickerControl =[[UIImagePickerController alloc]init];
    //设置从照片库中选择照片
    [headImagePickerControl setSourceType:UIImagePickerControllerSourceTypeCamera];
    //设置允许编辑图片
    [headImagePickerControl setAllowsEditing:YES];
    //设置代理
    [headImagePickerControl setDelegate:self];
    //弹出图片的选择器
    [self presentViewController:headImagePickerControl animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //NSLog(@"=================info:%@=============",info);
    
    topImageView.image =info[@"UIImagePickerControllerEditedImage"];
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)setTextViewFontLine{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 
                                 };
    
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
}

@end
