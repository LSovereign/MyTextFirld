//
//  SomeViews.m
//  Shifubao
//
//  Created by listome on 2016/12/29.
//  Copyright © 2016年 listome. All rights reserved.
//

#import "SomeViews.h"
#import "BaojiaListModel.h"
#import "BJSmallModel.h"
#define SH kScreenWidth-10-45-100
@interface SomeViews ()
{
    CGFloat zH;
}
@property(nonatomic,strong)NSMutableArray *xmodArr;
@end
@implementation SomeViews

+ (instancetype )shared{
    static SomeViews *someViews = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        someViews = [[SomeViews alloc] init];
        
    });
    
    return someViews;
}
//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
+(NSData *)dicToData:(NSDictionary *)dic{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return jsonData;
}
-(CGFloat)labH:(NSString *)labStr{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, kScreenWidth-45-100, 0)];
    lab.font = [UIFont fontWithName:@"Arial" size:16];
    lab.numberOfLines = 0;
    lab.text=labStr;
    [lab sizeToFit];
    return lab.height;
}

-(UIView *)linWithTop:(CGFloat)top{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, top, kScreenWidth, 1)];
    line.backgroundColor = JYColor(226, 226, 226);
    return line;
}
-(NSString *)sjC:(NSString *)dateStr{
//    NSString *str=@"1368082020";//时间戳
    NSTimeInterval time=[dateStr doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}
-(UIButton *)buttonFrame:(CGRect)theFrame Andtext:(NSString *)theText AndFont:(CGFloat)theFont AndBColor:(UIColor *)col{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = theFrame;
    [btn setTitle:theText forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:theFont];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    //    btn.layer.borderWidth =1;
    //    btn.layer.borderColor =[JYColor(52,67,153)CGColor];
    [btn setBackgroundColor:col];
    
    return btn;
    
}
-(UIButton *)F:(CGRect)theF Img:(NSString *)imgNormal AndSelImg:(NSString *)imgSelect{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = theF;
    [btn setBackgroundImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imgSelect] forState:UIControlStateSelected];
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    return btn;
}
-(NSMutableArray *)xmodArr{
    if (_xmodArr == nil) {
        _xmodArr = [NSMutableArray array];
    }
    return _xmodArr;
}
-(CGFloat)rowHWM:(BaojiaListModel *)dmod{
    for (NSDictionary *smDic in dmod.details) {
        BJSmallModel *smMod = [[BJSmallModel alloc]initWithDic:smDic];
        [self.xmodArr addObject:smMod];
    }
    //    [self.hArr addObject:@0.f];
    for (int i=0; i<self.xmodArr.count; i++) {
        BJSmallModel *xmod = self.xmodArr[i];
        UILabel *smLab = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, SH, 0)];
        smLab.numberOfLines =0;
        NSString *Str = [NSString stringWithFormat:@"%@  ¥%.2f * %@%@",xmod.detail,xmod.price,xmod.number,xmod.unit];
        smLab.text=Str;
        [smLab sizeToFit];
        
        zH = zH+smLab.height;
        NSLog(@"小%f",smLab.height);
        //        CGFloat lh=smLab.height;
        //        [_Harr addObject:@(smLab.height)];
    }
    return zH;
}

-(UILabel *)labelFrame:(CGRect)theFrame Andtext:(NSString *)theText AndFont:(CGFloat)theFont AndTag:(NSInteger)theTag{
    
    UILabel *oneLab = [[UILabel alloc]initWithFrame:theFrame];
    oneLab.font = [UIFont systemFontOfSize:theFont];
    if (theTag ==111) {
        oneLab.textColor=[UIColor darkGrayColor];
    }else if (theTag ==112){
        oneLab.textColor=JYColor(160,160, 160);//JYColor(197, 197, 197);
    }else if (theTag ==113){
        oneLab.textColor=[UIColor blackColor];
    }else if (theTag ==114){
        oneLab.textColor = [UIColor redColor];
    }else if(theTag ==115){
        oneLab.textColor =[UIColor whiteColor];
    }
    
    oneLab.text=theText;
    return oneLab;
}
-(UITextField *)F:(CGRect)theF AndF:(CGFloat)theFont Andplc:(NSString *)plcHd{
    UITextField *fi = [[UITextField alloc]initWithFrame:theF];
    fi.font =[UIFont systemFontOfSize:theFont];
    fi.placeholder = plcHd;
    fi.clearButtonMode = UITextFieldViewModeAlways;
//    fi.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    return fi;
}
-(void)oneView:(UIView *)v WithLC:(CGFloat)lc WLBW:(CGFloat)lbw WLBC:(UIColor *)lbc{
    v.layer.borderColor = [lbc CGColor];
    v.layer.borderWidth=lbw;
    v.layer.cornerRadius = lc;
    v.layer.masksToBounds=YES;
}
-(void)oneView:(UIView *)v WithLC:(CGFloat)lc{
    v.layer.cornerRadius = lc;
    v.layer.masksToBounds=YES;
}
-(void)oneViewShadow:(UIView *)v WithSC:(UIColor*)sc WithSO:(float)so WithSOfSet:(CGSize)sOfSet{
    v.layer.shadowColor = [sc CGColor];
    v.layer.shadowOpacity = so;
    v.layer.shadowOffset = sOfSet;
}

-(void)animationAlert:(UIView *)view
{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
    
    
}
-(void)dissAnimationAlert:(UIView *)view
{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.1)]];
    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
    
    
}

//- (void)registerForKeyboardNotificationsOneView:(UIView *)v WithFrame:(CGFloat)Ht 
//{
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWasShown:OneView:WithFrame:)
//                                                 name:KeyboardDidShow object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillBeHidden:OneView:WithFrame:)
//                                                 name:KeyboardWillHide object:nil];
//    
//}
-(void)removeKeyNotif{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
//- (void)keyboardWasShown:(NSNotification*)aNotif OneView:(UIView *)v WithFrame:(CGFloat)Ht
//{
//    NSDictionary* info = [aNotif userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    [UIView animateWithDuration:0.5 animations:^{
//        v.frame =CGRectMake(v.left, v.top-kbSize.height-Ht, v.width, v.height);
//    }];
////    CGRect aRect = self.view.frame;
////    aRect.size.height -= kbSize.height;
//}
//
//
//- (void)keyboardWillBeHidden:(NSNotification*)aNotif OneView:(UIView *)v WithFrame:(CGFloat)Ht
//{
//    NSDictionary* info = [aNotif userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    v.frame =CGRectMake(v.left, v.top+kbSize.height+Ht, v.width, v.height);
//    
//}
- (BOOL)validateNumber:(NSString*)number text:(NSString *)textFieldText floatCount:(NSInteger)floatCount {
    
    BOOL res = YES;
    
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    
    int i = 0;
    
    if (number.length==0) {
        
        //允许删除
        
        return  YES;
        
    }
    
    while (i < number.length) {
        
        //确保是数字
        
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        
        if (range.length == 0) {
            
            res = NO;
            
            break;
            
        }
        
        i++;
        
    }
    
    if (textFieldText.length==0) {
        
        //第一个不能是0和.
        
        if ([number isEqualToString:@"0"]||[number isEqualToString:@"."]) {
            
            return NO;
            
        }
        
    }
    
    NSArray *array = [textFieldText componentsSeparatedByString:@"."];
    
    NSInteger count = [array count] ;
    
    //小数点只能有一个
    
    if (count>1&&[number isEqualToString:@"."]) {
        
        return NO;
        
    }
    
    //控制小数点后面的字数
    
    if ([textFieldText rangeOfString:@"."].location!=NSNotFound) {
        
        if (textFieldText.length-[textFieldText rangeOfString:@"."].location>floatCount) {
            
            return NO;
            
        }
        
    }
    
    return res;
    
}



@end
