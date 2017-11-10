//
//  SomeViews.h
//  Shifubao
//
//  Created by listome on 2016/12/29.
//  Copyright © 2016年 listome. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaojiaListModel;
@interface SomeViews : NSObject

+ (instancetype )shared;
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+(NSData *)dicToData:(NSDictionary *)dic;
-(CGFloat)labH:(NSString *)labStr;//宽度一定，计算一定字符串的label的高度
-(UIView *)linWithTop:(CGFloat)top;
-(NSString *)sjC:(NSString *)dateStr;
//普通按钮  frame 按钮名 字体大小 颜色
-(UIButton *)buttonFrame:(CGRect)theFrame Andtext:(NSString *)theText AndFont:(CGFloat)theFont AndBColor:(UIColor *)col;
//图片按钮 frame picName(Normal)   picName(Select)
-(UIButton *)F:(CGRect)theF Img:(NSString *)imgNormal AndSelImg:(NSString *)imgSelect;

-(CGFloat)rowHWM:(BaojiaListModel *)dmod;
//label   frame text font theTag(判断theTag设置字体颜色)
-(UILabel *)labelFrame:(CGRect)theFrame Andtext:(NSString *)theText AndFont:(CGFloat)theFont AndTag:(NSInteger)theTag;


//textField frame font plcHd
-(UITextField *)F:(CGRect)theF AndF:(CGFloat)theFont Andplc:(NSString *)plcHd;


//view 为view或控件设置 圆角 & 边框属性
-(void)oneView:(UIView *)v WithLC:(CGFloat)lc WLBW:(CGFloat)lbw WLBC:(UIColor *)lbc;
-(void)oneView:(UIView *)v WithLC:(CGFloat)lc;

//view 为view或控件设置 阴影属性
-(void)oneViewShadow:(UIView *)v WithSC:(UIColor*)sc WithSO:(float)so WithSOfSet:(CGSize)sOfSet;
-(void)animationAlert:(UIView *)view;
-(void)dissAnimationAlert:(UIView *)view;

//- (void)keyboardWasShown:(NSNotification*)aNotif OneView:(UIView *)v WithFrame:(CGFloat)Ht;
//- (void)keyboardWillBeHidden:(NSNotification*)aNotif OneView:(UIView *)v WithFrame:(CGFloat)Ht;
//- (void)registerForKeyboardNotificationsOneView:(UIView *)v WithFrame:(CGFloat)Ht;
-(void)removeKeyNotif;
- (BOOL)validateNumber:(NSString*)number text:(NSString *)textFieldText floatCount:(NSInteger)floatCount;
@end
