//
//  KIFTestScenario+CEAdditions.h
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/7/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "KIFTestScenario.h"

@interface KIFTestScenario (CEAdditions)

+ (id)scenarioToAppear;
+ (id)scenarioToCloseWhenTappedOutsideOfPicker;
+ (id)scenarioToCloseWhenTappedOnCenterRowOfPicker;

@end
