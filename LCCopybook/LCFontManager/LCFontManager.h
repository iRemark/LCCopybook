//
//  LCFontLoader.h
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/19.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



static NSInteger LCFontManager_willBeginLoad = 1001;
static NSInteger LCFontManager_beginLoad = 1002;
static NSInteger LCFontManager_loadding= 1003;
static NSInteger LCFontManager_loadCompletion = 1004;

static NSInteger LCFontManager_loaded = 1005;

static NSInteger LCFontManager_error = 1006;


@interface LCFontManager : NSObject


/**
 异步下载 apple 字体册中的字体
 
 @param fontName 字体册中的 PostScript 名称
 @param fontSize 字体大小
 @param block 返回
 

 ===== iResCode=1001:
    将要开始下载
    block里面其他参数无用;
 
 ===== iResCode=1002:
     开始下载
     block里面其他参数无用;
 
  ===== iResCode=1003:
     正在下载中
     block返回 progressValue 0.0000-1.0000
     block里面其他参数无用;
 
  ===== iResCode=1004:
     下载结束
     block里面其他参数无用;
 
 
 ===== iResCode=1005:
    已经下载过了
    block里面其他参数无用;
 
 
 ===== iResCode=1006:
    报错
    block返回 retError
    block里面其他参数无用;
 
 */

- (void)asynchronouslySetFontName:(NSString *)fontName
                         fontSize:(CGFloat)fontSize
                       completion:(void(^)(NSInteger iResCode, UIFont *retFont, double progressValue, NSError *retError))block;



/**
 根据下载的字体 路径返回一个字体 UIFont

 @param fontPath 字体路径
 @param fontSize 字体大小
 @return 返回字体
 */
- (UIFont *)cofigFontWithFontPath:(NSString *)fontPath fontSize:(CGFloat)fontSize;

@end



