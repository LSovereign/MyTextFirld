//
//  MyTextField.h
//  EaseMobTwo
//
//  Created by listome on 16/8/26.
//  Copyright © 2016年 listome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTextFieldDelegate <NSObject>
-(void)sendText:(UITextField *)field;
@end
@interface MyTextField : UIView
@property(nonatomic,assign)NSInteger textfieldTag;
@property(nonatomic, strong)UITextField *mytextfield;
-(instancetype)initWithFrame:(CGRect)frame WithImgArr:(NSArray *)imgArr HoldStrArr:(NSArray *)holdStrArr;
@property (nonatomic, weak) id<MyTextFieldDelegate> delegate;
@end
