//
//  MySwiftUIView.h
//  SwiftUIColorButton
//
//  Created by Micah Kimel on 1/12/25.
//


#import <UIKit/UIKit.h>

@class MySwiftUIView;

@interface MySwiftUIView : NSObject
- (void)setLabelText:(NSString *)text;
- (NSString *)getLabelText;
- (UIViewController *)createView;
@end
