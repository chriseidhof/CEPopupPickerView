//
//  KIFTestStep+CEAdditions.m
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/7/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "KIFTestStep+CEAdditions.h"

@implementation KIFTestStep (CEAdditions)

+ (id)stepToAppear {
    return [KIFTestStep stepToTapViewWithAccessibilityLabel:@"Choose"];
}

+ (id)stepToTapOutsideOfPicker {
    return [KIFTestStep stepToTapScreenAtPoint:CGPointMake(100, 100)];
}

+ (id)stepToReset {
    return [KIFTestStep stepToTapViewWithAccessibilityLabel:@"Tap to close"];
}

@end
