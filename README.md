CEPopupPickerView
=============

CEPopupPickerView is a library that shows a UIPickerView at the bottom of the
screen, just like the Facebook app. When the users taps outside the UIPickerView
or taps the selected row, the popup dismisses and calls the delegate.

Installation
------------

CEPopupPickerView is best installed via [CocoaPods](https://github.com/CocoaPods/CocoaPods). Alternatively, you can drag the `CEPopupPickerView/CEPopupPickerView.{h,m}` into your project.

Usage
-----

Put this somewhere in your view controller:

    NSArray* values = [NSArray arrayWithObjects:@"Don", @"Peggy", @"Pete", nil];
    CEPopupPickerView* popupPicker = [[CEPopupPickerView alloc] initWithValues:values callback:^(NSInteger selectedIndex) {
            NSLog(@"you chose: %@", [values objectAtIndex:selectedIndex]);
        }];
    }
    [popupPicker presentInView:self.view];

If you want to run an example, clone this project and open the XCode Project.

Tests
-----

To run the tests, clone this project. Then run 

        pod install CEPopupPickerView.xcodeproj

This will generate a `CEPopupPickerView.xcworkspace`, which you can then open.
Run the target "Integration Tests". 
The tests use [KIF](https://github.com/square/KIF) and can be found in the group `CEPopupPickerViewIntegrationTests`.
