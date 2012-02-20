//
//  CEPopupPickerView.m
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/4/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "CEPopupPickerView.h"

@interface CEPopupPickerView () {
@private
    NSArray* values;
    UIView* parentView;
    UIPickerView* pickerView;
    NSInteger selectedIndex;
}

- (void)setupGlasspane;
- (void)setupAndAddPickerView;
- (void)animatePickerViewFromBottomOfParentView;
- (void)movePickerViewToBottomOfParentView;
- (void)movePickerViewOutsideBoundsOfParentView;
- (BOOL)isDisplaying;

@end

@implementation CEPopupPickerView

@synthesize callback, pickerAccessibilityLabel;

- (id)initWithValues:(NSArray*)theValues callback:(pickerViewCloseHandler)theCallback {
    self = [super initWithFrame:CGRectZero];
    if(self) {
        values = theValues;
        self.callback = theCallback;
        selectedIndex = 0;
    }
    return self;
}

- (void)presentInView:(UIView*)theParentView {
    parentView = theParentView;
    [self setupGlasspane];
    [self setupAndAddPickerView];
    [self animatePickerViewFromBottomOfParentView];
}

- (void)close {
    if (![self isDisplaying]) return;
    
    [UIView animateWithDuration:0.2 animations:^{
        [self movePickerViewToBottomOfParentView];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSInteger)selectedIndex {
    return [pickerView selectedRowInComponent:0];
}

- (void)setSelectedIndex:(NSInteger)theSelectedIndex {
    if(theSelectedIndex > [values count]-1) {
        NSException* e = [NSException exceptionWithName:NSInvalidArgumentException reason:@"Selected index out of bounds" userInfo:nil];
        [e raise];
    }
    selectedIndex = theSelectedIndex;
    BOOL animateSelection = [self isDisplaying];
    [pickerView selectRow:selectedIndex inComponent:0 animated:animateSelection];
}

- (void)setupGlasspane {
    [parentView addSubview:self];
    self.frame = parentView.bounds;
    self.accessibilityLabel = @"Tap to close";
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    UITapGestureRecognizer* glassPaneTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGlassPane:)];
    [self addGestureRecognizer:glassPaneTapRecognizer];
}

- (void)setupAndAddPickerView {
    if(pickerView != nil) return;
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    [self addSubview:pickerView];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.accessibilityLabel = self.pickerAccessibilityLabel;
    [pickerView selectRow:selectedIndex inComponent:0 animated:YES];
    UITapGestureRecognizer* pickerViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPickerView:)];
    pickerViewTapGestureRecognizer.cancelsTouchesInView = NO;
    [pickerView addGestureRecognizer:pickerViewTapGestureRecognizer];
}

- (void)animatePickerViewFromBottomOfParentView {
    [self movePickerViewToBottomOfParentView];
    [UIView animateWithDuration:0.2 animations:^{
        [self movePickerViewOutsideBoundsOfParentView];
    }];
}

- (void)movePickerViewToBottomOfParentView {
    CGFloat maxY = CGRectGetMaxY(parentView.bounds);
    CGRect pickerFrame = pickerView.frame;
    pickerFrame.origin.y = maxY;
    pickerView.frame = pickerFrame;
}

- (void)movePickerViewOutsideBoundsOfParentView {
    CGFloat maxY = CGRectGetMaxY(parentView.bounds);
    CGRect pickerFrame = pickerView.frame;
    pickerFrame.origin.y = maxY - pickerFrame.size.height;
    pickerView.frame = pickerFrame;
}

- (void)notifyDelegateAndClose {
    selectedIndex = [pickerView selectedRowInComponent:0];
    callback(selectedIndex);
    [self close];
}

- (BOOL)isDisplaying {
    return [self superview] != nil;
}

#pragma mark UIGestureRecognizer callbacks

- (void)tapGlassPane:(UITapGestureRecognizer*)sender {
    [self notifyDelegateAndClose];
}

- (void)tapPickerView:(UITapGestureRecognizer*)sender {
    CGPoint point = [sender locationInView:pickerView];
    const CGFloat numberOfVisibleRows = 5;
    const CGFloat middleRow = 2;
    CGFloat heightOfPickerRow = pickerView.frame.size.height/numberOfVisibleRows;
    CGFloat tappedRow = floor(point.y / heightOfPickerRow);
    if(tappedRow == middleRow) {
        [self notifyDelegateAndClose];
    }
}

#pragma mark UIPickerView methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [values objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [values count];
}

@end
