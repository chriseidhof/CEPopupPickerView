//
//  KIFTestScenario+CEAdditions.m
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/7/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "KIFTestScenario+CEAdditions.h"
#import "KIFTestStep.h"
#import "KIFTestStep+CEAdditions.h"
#import "UIApplication-KIFAdditions.h"
#import "UIAccessibilityElement-KIFAdditions.h"

static NSString* pickerAccessibilityLabel = @"Picker";

@implementation KIFTestScenario (CEAdditions)

+ (id)scenarioToAppear {
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that the picker appears."];
    [scenario addStep:[KIFTestStep stepToAppear]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:pickerAccessibilityLabel]];
    return scenario;
}

+ (id)scenarioToCloseWhenTappedOutsideOfPicker {
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that the picker closes when tapped outside"];
    
    [scenario addStep:[KIFTestStep stepToReset]];
    [scenario addStep:[KIFTestStep stepToAppear]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:pickerAccessibilityLabel]];
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Tap to close"]];
    [scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:pickerAccessibilityLabel]];
    return scenario;
}

+ (id)scenarioToCloseWhenTappedOnCenterRowOfPicker {
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that the picker closes when tapped on the selected row"];
    [scenario addStep:[KIFTestStep stepToAppear]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:pickerAccessibilityLabel]];
    [scenario addStep:[KIFTestStep stepToSelectPickerViewRowWithTitle:@"Peggy"]];
    [scenario addStep:[KIFTestStep stepToSelectPickerViewRowWithTitle:@"Peggy"]];
    [scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:pickerAccessibilityLabel]];
    return scenario;
}

@end
