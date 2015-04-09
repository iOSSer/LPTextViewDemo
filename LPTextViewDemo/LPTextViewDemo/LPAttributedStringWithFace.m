//
//  LPAttributedStringWithFace.m
//  LPTextViewDemo
//
//  Created by lipeng on 15/4/9.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import "LPAttributedStringWithFace.h"

@implementation LPAttributedStringWithFace


+ (instancetype) sharedInstance
{
    static dispatch_once_t onceToken;
    static LPAttributedStringWithFace *att = nil;
    dispatch_once(&onceToken, ^{
        att = [[LPAttributedStringWithFace alloc] init];
        att.faces = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Face" ofType:@"plist"]];
    });
    return att;
}


- (NSAttributedString *)getAttributedStringWithText:(NSString *)text
{
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Face" ofType:@"plist"];
//    self.faces = [NSArray arrayWithContentsOfFile:path];
    
    NSString * pattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    NSError *error = nil;
    NSRegularExpression * re = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (!re) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //通过正则表达式来匹配字符串
    NSArray *resultArray = [re matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    
    for (NSTextCheckingResult *result in resultArray) {
        NSRange range = [result range];
        NSString *subSr = [text substringWithRange:range];
        for (NSInteger i = 0; i < self.faces.count; i ++) {
            if ([self.faces[i][@"text"] isEqualToString:subSr]) {
                NSTextAttachment *ment =[[ NSTextAttachment alloc] init];
                ment.image = [UIImage imageNamed:self.faces[i][@"image"]];
                NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:ment];
                
                //把图片和图片对应的位置存入字典中
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                [imageDic setObject:imageStr forKey:@"image"];
                [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                //把字典存入数组中
                [imageArray addObject:imageDic];
                
                //从后往前替换
                for (NSInteger i = imageArray.count -1; i >= 0; i--)
                {
                    NSRange range;
                    [imageArray[i][@"range"] getValue:&range];
                    //进行替换
                    [attributeString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
                    
                }
            }
        }
    }
    
    return attributeString;

}

@end
