//
//  CETestController.m
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/7/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "CETestController.h"
#import "KIFTestScenario.h"
#import "KIFTestScenario+CEAdditions.h"

@implementation CETestController

- (void)initializeScenarios;
{
    [self addScenario:[KIFTestScenario scenarioToAppear]];
    [self addScenario:[KIFTestScenario scenarioToCloseWhenTappedOutsideOfPicker]];
    [self addScenario:[KIFTestScenario scenarioToCloseWhenTappedOnCenterRowOfPicker]];
}

@end
