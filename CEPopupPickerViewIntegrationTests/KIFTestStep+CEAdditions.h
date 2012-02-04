//
//  KIFTestStep+CEAdditions.h
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/7/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "KIFTestStep.h"

@interface KIFTestStep (CEAdditions)

+ (id)stepToAppear;
+ (id)stepToReset;
+ (id)stepToTapOutsideOfPicker;

@end
