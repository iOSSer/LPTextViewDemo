//
//  LPAttributedStringWithFace.h
//  LPTextViewDemo
//
//  Created by lipeng on 15/4/9.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LPAttributedStringWithFace : NSObject


+ (instancetype) sharedInstance;
/**
 **从plist文件取出的表情字符串存入此数组
 **/
@property (nonatomic, strong) NSArray *faces;
/**
 **将NSString转为带有图片的NSAttributedString
 **/
- (NSAttributedString *) getAttributedStringWithText:(NSString *)text;
@end
