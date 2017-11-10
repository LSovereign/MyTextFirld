//
//  MyTextField.m
//  EaseMobTwo
//
//  Created by listome on 16/8/26.
//  Copyright © 2016年 listome. All rights reserved.
//

#define KColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "MyTextField.h"

@interface MyTextField()<UITextFieldDelegate>

@end
@implementation MyTextField
-(instancetype)initWithFrame:(CGRect)frame WithImgArr:(NSArray *)imgArr HoldStrArr:(NSArray *)holdStrArr{
    self = [super initWithFrame:frame];
    if (self) {
        [self someTextFieldWithImg:imgArr AndHold:holdStrArr];
    }
    return self;
}

-(void)someTextFieldWithImg:(NSArray *)imgArr AndHold:(NSArray *)holdStrArr{
    
    for (int i = 0; i < imgArr.count; i++) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 44 * i + 15, 20, 20)];
        imgView.image = [UIImage imageNamed:imgArr[i]];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43*(i+1),self.width , 1)];
//        lineView.backgroundColor = KColor(202, 236, 240);
        lineView.backgroundColor = KColor(202,236,240);
        _mytextfield = [[UITextField alloc]initWithFrame:CGRectMake(50,44 * i + 3, self.width - 50, 44)];

        _mytextfield.placeholder = holdStrArr[i];
        _mytextfield.clearButtonMode = UITextFieldViewModeAlways;
        _mytextfield.returnKeyType = UIRectEdgeNone;
        _mytextfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _mytextfield.tintColor = KColor(0, 170, 220);
        _mytextfield.delegate = self;
        _mytextfield.tag = i+1;
//        _mytextfield.borderStyle = UITextBorderStyleRoundedRect;

        if (i != 0) {
            _mytextfield.secureTextEntry = YES;
        }
        [self addSubview:imgView];
        [self addSubview:lineView];
        [self addSubview:_mytextfield];
    }
}

#pragma mark - textFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //将要开始编辑，可以不让textField编辑
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //已经开始编辑
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //将要结束编辑，可以不让textfield失去第一响应者
    
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //已经结束编辑
    [self.delegate sendText:textField];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [self.delegate sendText:textField];
    return YES;
}
-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;//判断是否开启清楚按钮
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

@end

















