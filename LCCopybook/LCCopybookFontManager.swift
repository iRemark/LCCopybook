//
//  LCCopybookFontLoader.swift
//  LCCopybook
//
//  Created by lc-macbook pro on 2018/1/19.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

import UIKit
import CoreText

class LCCopybookFontManager: NSObject {
    
  
    
    func asynchronouslySetFontName(_: (_ content:String) ->() ,fontName:String) {
//        let manager = LCFontManager();
//        manager.asynchronouslySetFontName(fontName, completion: completion);
//
//
//        func blocData(resource:(content:String) ->() ,withData:String){
//            resource(content: "callBackData")
//        }
//
//        blocData(resource: <#T##(String) -> ()#>, withData: <#T##String#>)
//
//        self.blocData({ (content) -> () in
//            println(content)
//
//        }, withData: "putinData")
        
//        if let aFont = UIFont.init(name: fontName, size: 29) {
//            if aFont.fontName == fontName &&  aFont.familyName == fontName {
//                return true;
//            }
//        }
//
//        let attrs: NSMutableDictionary = NSMutableDictionary();
//        attrs.setValue(fontName, forKey: kCTFontNameAttribute as String);
//
//        let desc: CTFontDescriptorRef = CTFontDescriptorCreateWithAttributes(attrs);
//
//        var descs = NSMutableArray();
//        descs.add(desc);
        
        
//        return false;
    }
//    func asynchronouslySetFontName(fontName: String) -> Void {

//        // Create a dictionary with the font's PostScript name.
//        NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
//        
//        // Create a new font descriptor reference from the attributes dictionary.
//        CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
//        
//        NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
//        [descs addObject:(__bridge id)desc];
//        CFRelease(desc);
//        
//        __block BOOL errorDuringDownload = NO;
//        
//        // Start processing the font descriptor..
//        // This function returns immediately, but can potentially take long time to process.
//        // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
//        // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
//        CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter) {
//            
//            //NSLog( @"state %d - %@", state, progressParameter);
//            
//            double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
//            
//            if (state == kCTFontDescriptorMatchingDidBegin) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            // Show an activity indicator
//            [_fActivityIndicatorView startAnimating];
//            _fActivityIndicatorView.hidden = NO;
//            
//            // Show something in the text view to indicate that we are downloading
//            _fTextView.text= [NSString stringWithFormat:@"Downloading %@", fontName];
//            _fTextView.font = [UIFont systemFontOfSize:14.];
//            
//            NSLog(@"Begin Matching");
//            });
//            } else if (state == kCTFontDescriptorMatchingDidFinish) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            // Remove the activity indicator
//            [_fActivityIndicatorView stopAnimating];
//            _fActivityIndicatorView.hidden = YES;
//            
//            // Display the sample text for the newly downloaded font
//            NSUInteger sampleIndex = [_fontNames indexOfObject:fontName];
//            _fTextView.text = [_fontSamples objectAtIndex:sampleIndex];
//            _fTextView.font = [UIFont fontWithName:fontName size:24.];
//            
//            // Log the font URL in the console
//            CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)fontName, 0., NULL);
//            CFStringRef fontURL = CTFontCopyAttribute(fontRef, kCTFontURLAttribute);
//            NSLog(@"%@", (__bridge NSURL*)(fontURL));
//            CFRelease(fontURL);
//            CFRelease(fontRef);
//            
//            if (!errorDuringDownload) {
//            NSLog(@"%@ downloaded", fontName);
//            }
//            });
//            } else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            // Show a progress bar
//            _fProgressView.progress = 0.0;
//            _fProgressView.hidden = NO;
//            NSLog(@"Begin Downloading");
//            });
//            } else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            // Remove the progress bar
//            _fProgressView.hidden = YES;
//            NSLog(@"Finish downloading");
//            });
//            } else if (state == kCTFontDescriptorMatchingDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            // Use the progress bar to indicate the progress of the downloading
//            [_fProgressView setProgress:progressValue / 100.0 animated:YES];
//            NSLog(@"Downloading %.0f%% complete", progressValue);
//            });
//            } else if (state == kCTFontDescriptorMatchingDidFailWithError) {
//            // An error has occurred.
//            // Get the error message
//            NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
//            if (error != nil) {
//            _errorMessage = [error description];
//            } else {
//            _errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
//            }
//            // Set our flag
//            errorDuringDownload = YES;
//            
//            dispatch_async( dispatch_get_main_queue(), ^ {
//            _fProgressView.hidden = YES;
//            NSLog(@"Download error: %@", _errorMessage);
//            });
//            }
//            
//            return (bool)YES;
//            });
//        
//    }
}

