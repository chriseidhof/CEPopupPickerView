//
//  CEPopupPickerView.h
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/4/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^pickerViewCloseHandler)(NSInteger selectedIndex);

@interface CEPopupPickerView : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

- (id)initWithValues:(NSArray*)values callback:(pickerViewCloseHandler)callback;
- (void)presentInView:(UIView*)view;
- (void)close;

@property (nonatomic,assign) NSInteger selectedIndex;
@property (nonatomic,copy) pickerViewCloseHandler callback;
@property (nonatomic,retain) NSString* pickerAccessibilityLabel;

@end
