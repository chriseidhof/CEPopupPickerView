CEPopupPickerView
=============

CEPopupPickerView is a library that shows a UIPickerView at the bottom of the
screen, just like the Facebook app. When the users taps outside the UIPickerView
or taps the selected row, the popup dismisses and calls the delegate.

Installation
------------

CEPopupPickerView is best installed via [CocoaPods](https://github.com/CocoaPods/CocoaPods). Alternatively, you can drag the `CEPopupPickerView/CEPopupPickerView.{h,m}` files into your project.

Usage
-----

Add an instance variable to your view controller to make sure you keep a
reference:

    CEPopupPickerView* popupPicker;

Put this somewhere in your view controller:

    NSArray* values = [NSArray arrayWithObjects:@"Don", @"Peggy", @"Pete", nil];
    popupPicker = [[CEPopupPickerView alloc] initWithValues:values callback:^(NSInteger selectedIndex) {
            NSLog(@"you chose: %@", [values objectAtIndex:selectedIndex]);
    }];
    [popupPicker presentInView:self.view];

If you want to run an example, clone this project and open the Xcode Project.

For now, the view only works in portrait mode on the iPhone, but patches for landscape mode are more than welcome. An iPad port isn't planned, as it is probably better to put a UIPickerView inside a UIPopover.

Tests
-----

To run the tests, clone this project. Then run 

        pod install CEPopupPickerView

This will generate a `CEPopupPickerView.xcworkspace`, which you can then open.
Run the target "Integration Tests". 
The tests use [KIF](https://github.com/square/KIF) and can be found in the group
`CEPopupPickerViewIntegrationTests`.
