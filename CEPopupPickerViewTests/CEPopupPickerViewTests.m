//
//  CEPopupPickerViewTests.m
//  CEPopupPickerViewTests
//
//  Created by Chris Eidhof on 2/4/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "CEPopupPickerViewTests.h"
#import "CEPopupPickerView.h"

@interface CEPopupPickerViewTests () {
@private
CEPopupPickerView* popupPickerView;
}
@end

@implementation CEPopupPickerViewTests

- (void)setUp
{
    [super setUp];
    STAssertNotNil(popupPickerView, @"Could not create test subject.");
}

- (void)tearDown
{
    // Tear-down code here.
    popupPickerView = nil;
    [super tearDown];
}

@end
