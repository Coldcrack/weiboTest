//
//  ThemeImageView.m
//  SinaWeibo
//
//  Created by 嗷嗷叫 on 2017/6/20.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "ThemeImageView.h"

@implementation ThemeImageView

/*
 1. 监听主题切换的通知
 2. 当主题发生切换时，改变显示的图片
 */
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(themeDidChanged:) name:kThemeChangedNotificationName object:nil];
    }
    return self;
}
-(void)awakeFromNib {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(themeDidChanged:) name:kThemeChangedNotificationName object:nil];
    [super awakeFromNib];
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)themeDidChanged:(NSNotification *)noti {
    NSString *Path = noti.userInfo[@"imagePath"];
    NSString *imageName = [NSString stringWithFormat:@"%@%@",Path,_imageName];
    self.image = [UIImage imageNamed:imageName];
}
@end
