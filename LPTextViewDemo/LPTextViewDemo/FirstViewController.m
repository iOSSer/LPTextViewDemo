//
//  FirstViewController.m
//  LPTextViewDemo
//
//  Created by lipeng on 15/4/9.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//




#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) NSArray *faces;

@end

static NSString *text = @"强子对撞搞出黑洞会吞没地球？科学家：别担心“拜托各位科学家，千万别搞出黑洞把地球整没了，我还没娶媳妇呢！[哈哈]”一名网友在欧洲核子研究中心的大型强子对撞机(LH C)5日重启后如此留言。\n\n对此类问题，该中心专家7日接受新华社记者采访时解释说，别担心，大型强子对撞机不会带来灾难。欧洲核子研究中心的美国专家、加州理工学院物理学家哈维·纽曼指出，首先，[调皮]研究人员并不认为LH C必然会制造出黑洞，没有任何理论显示黑洞一定会出现。第二，即使黑洞产生，它们的质量也会非常小，与我们银河系中心的黑洞相比，(人造黑洞)绝对是非常微小的。这种微型黑洞将在非常短暂的时间内消失，没有危害。最后，纽曼教授指出，宇宙中频繁发生能量远远高于LH C可达状态的天体活动，这种现象已存在几十亿年，但却并未观测到因之产生黑洞的情况。实际上，LH C的运行非但不会给人类带来灾难，还会在多个领域为人类造福。纽曼介绍说，高能物理已[冷汗]催生多项技术成果，一些与LH C有关的研究已经对人们的日常生活产生巨大影响。“比如，今天已成为我们日常生活和文明进步重要组成部分的万维网；粒子探测器及其方法被应用在各个领域，从石油勘[偷笑]探到机场、港口的爆炸物探测；[拜拜]高能物理学推动了粒子加速器的发展，这已应用在医学治疗、疾病诊断、半导体芯片离子注入工艺、改进子午线轮胎等多个方面。”\n大型强子对撞机是目前全球最大、能量最高的粒子加速器，它位于法国和瑞士交界地区，其管线设施埋入地下超过百米深，总长达27公里，可将一些基本粒子加速并进行碰撞。在第一阶段运行中，大型强子对撞机曾发现“上帝粒子”希格斯玻色子的踪迹，该粒子被称为物理学“标准模型”的最后一块拼图。\n\n\n\n强子对撞搞出黑洞会吞没地球？科学家：别担心“拜托各位科学家，千万别搞出黑洞把地球整没了，我还没娶媳妇呢！[哈哈]”一名网友在欧洲核子研究中心的大型强子对撞机(LH C)5日重启后如此留言。\n\n对此类问题，该中心专家7日接受新华社记者采访时解释说，别担心，大型强子对撞机不会带来灾难。欧洲核子研究中心的美国专家、加州理工学院物理学家哈维·纽曼指出，首先，[调皮]研究人员并不认为LH C必然会制造出黑洞，没有任何理论显示黑洞一定会出现。第二，即使黑洞产生，它们的质量也会非常小，与我们银河系中心的黑洞相比，(人造黑洞)绝对是非常微小的。这种微型黑洞将在非常短暂的时间内消失，没有危害。最后，纽曼教授指出，宇宙中频繁发生能量远远高于LH C可达状态的天体活动，这种现象已存在几十亿年，但却并未观测到因之产生黑洞的情况。实际上，LH C的运行非但不会给人类带来灾难，还会在多个领域为人类造福。纽曼介绍说，高能物理已[冷汗]催生多项技术成果，一些与LH C有关的研究已经对人们的日常生活产生巨大影响。“比如，今天已成为我们日常生活和文明进步重要组成部分的万维网；粒子探测器及其方法被应用在各个领域，从石油勘[偷笑]探到机场、港口的爆炸物探测；[拜拜]高能物理学推动了粒子加速器的发展，这已应用在医学治疗、疾病诊断、半导体芯片离子注入工艺、改进子午线轮胎等多个方面。”\n大型强子对撞机是目前全球最大、能量最高的粒子加速器，它位于法国和瑞士交界地区，其管线设施埋入地下超过百米深，总长达27公里，可将一些基本粒子加速并进行碰撞。在第一阶段运行中，大型强子对撞机曾发现“上帝粒子”希格斯玻色子的踪迹，该粒子被称为物理学“标准模型”的最后一块拼图。";

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeZero];
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.font = [UIFont systemFontOfSize:17.f];
    self.textView.editable = NO;
    self.textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.textView];
    
    LPAttributedStringWithFace *face = [LPAttributedStringWithFace sharedInstance];
    NSAttributedString *attributedText = [face getAttributedStringWithText:text];
    self.textView.attributedText = attributedText;
}

- (void) getPlistFace
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Face" ofType:@"plist"];
    self.faces = [NSArray arrayWithContentsOfFile:path];
//    for (NSDictionary *faceDict in self.faces) {
//        NSLog(@"%@", faceDict[@"text"]);
//    }
    
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
    
    self.textView.attributedText = attributeString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
