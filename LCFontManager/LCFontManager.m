//
//  LCFontLoader.m
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/19.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

#import "LCFontManager.h"
#import <CoreText/CoreText.h>


@implementation LCFontManager



- (void)asynchronouslySetFontName:(NSString *)fontName
                         fontSize:(CGFloat)fontSize
                       completion:(void(^)(NSInteger iResCode, UIFont *retFont, double progressValue, NSError *retError))block {
    UIFont* aFont = [UIFont fontWithName:fontName size:fontSize];
    // If the font is already downloaded
    if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
        // Go ahead and display the sample text.
        if (block) {
            block(LCFontManager_loaded, aFont, 0, nil);
        }
    }
    // Create a dictionary with the font's PostScript name.
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
    
    // Create a new font descriptor reference from the attributes dictionary.
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    
    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
    [descs addObject:(__bridge id)desc];
    CFRelease(desc);
    
    __block BOOL errorDuringDownload = NO;
    
    // Start processing the font descriptor..
    // This function returns immediately, but can potentially take long time to process.
    // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
    // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter) {
        
        //NSLog( @"state %d - %@", state, progressParameter);
        
        double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
        
        if (state == kCTFontDescriptorMatchingWillBeginDownloading) {//将要开始下载
            dispatch_async( dispatch_get_main_queue(), ^ {
                // Show a progress bar
                NSLog(@"Begin Downloading");
                if (block) {
                    block(LCFontManager_willBeginLoad, aFont, 0, nil);
                }
            });
        }else if (state == kCTFontDescriptorMatchingDidBegin) {//已经开始下载
            dispatch_async( dispatch_get_main_queue(), ^ {
                // Show an activity indicator
                
                NSLog(@"Begin Matching");
                
                if (block) {
                    block(LCFontManager_beginLoad, aFont, 0, nil);
                }
            });
        }else if (state == kCTFontDescriptorMatchingDownloading) {
            dispatch_async( dispatch_get_main_queue(), ^ {
                // Use the progress bar to indicate the progress of the downloading
                NSLog(@"Downloading %.0f%% complete", progressValue);
                if (block) {
                    block(LCFontManager_loadding, aFont, progressValue, nil);
                }
            });
        }else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {//完成下载
            dispatch_async( dispatch_get_main_queue(), ^ {
                // Remove the progress bar
                NSLog(@"Finish downloading");
                
                if (block) {
                    block(LCFontManager_loadCompletion, aFont, 0, nil);
                }
            });
        }else if (state == kCTFontDescriptorMatchingDidFinish) {//下载过了
            dispatch_async( dispatch_get_main_queue(), ^ {
                // Log the font URL in the console
                CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)fontName, 0., NULL);
                CFStringRef fontURL = CTFontCopyAttribute(fontRef, kCTFontURLAttribute);
                NSLog(@"%@", (__bridge NSURL*)(fontURL));
                CFRelease(fontURL);
                CFRelease(fontRef);
                
                if (!errorDuringDownload) {
                    NSLog(@"%@ downloaded", fontName);
                    
                    if (block) {
                        block(LCFontManager_loaded, aFont, 0, nil);
                    }
                    
                }else {
//                    if (block) {
//                        block(LCFontManager_loaded, aFont, 0, nil);
//                    }
                }
            });
        } else if (state == kCTFontDescriptorMatchingDidFailWithError) {//下载报错
            // An error has occurred.
            // Get the error message
            
            NSString *_errorMessage;
            NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
            if (error != nil) {
                _errorMessage = [error description];
            } else {
                _errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
            }
            // Set our flag
            errorDuringDownload = YES;
            
            dispatch_async( dispatch_get_main_queue(), ^ {
                NSLog(@"Download error: %@", _errorMessage);
                
                if (block) {
                    block(LCFontManager_error, aFont, 0, error);
                }
            });
        }
       
        return (bool)YES;
    });

}

- (UIFont *)cofigFontWithFontPath:(NSString *)fontPath fontSize:(CGFloat)fontSize {
    fontPath = [[NSBundle mainBundle] pathForResource:fontPath ofType:@"ttf"];

    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithFilename([fontPath UTF8String]);
    CGFontRef customfont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    NSString *fontName = (__bridge NSString *)CGFontCopyFullName(customfont);
    NSLog(@"==== 配置的新字体：%@ ====",fontName);
    CFErrorRef error;
    CTFontManagerRegisterGraphicsFont(customfont, &error);
    if (error){
        // 为了可以重复注册
        CTFontManagerUnregisterGraphicsFont(customfont, &error);
        CTFontManagerRegisterGraphicsFont(customfont, &error);
    }
    CGFontRelease(customfont);
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    return font;
}
@end
