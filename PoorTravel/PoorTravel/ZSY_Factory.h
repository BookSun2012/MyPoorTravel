//
//  ZSY_Factory.h
//  05_UI_Fatory
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZSY_Factory : NSObject
//按钮的所有属性
+(UIButton *)buttonWithFrame:(CGRect)frame
                        Type:(UIButtonType)type
                       Title:(NSString *)title
                    fontSize:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
                     bgColor:(UIColor *)bgColor
                      target:(id)target
                    selector:(SEL)sel
                       layer:(CGFloat)layer
                         tag:(NSInteger)tag
                  supperView:(UIView *)supperView;


//button.layer.cornerRadius=5;
//button.layer.masksToBounds=YES;
//创建一个按钮 标题为蓝色 标题大小为20 像素 背景颜色为绿色 系统按钮类型
+(UIButton *)buttonWithFrame:(CGRect)frame
                       Title:(NSString *)title
                      fontSize:(CGFloat)fontSize
                      target:(id)target
                    selector:(SEL)sel
                   layer:(CGFloat)layer
                        tag:(NSInteger)tag
                  supperView:(UIView *)supperView;

+(UILabel *)labelWithFrame:(CGRect)frame
                      text:(NSString*)text
                  fontSzie:(CGFloat)fontSize
                     layer:(CGFloat)layer
                 textColor:(UIColor*)textColor
                   bgColor:(UIColor*)bgColor
                     align:(NSTextAlignment)align
                supperView:(UIView *)supperView;


@end
