//
//  CEViewController.m
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/4/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import "CEViewController.h"
#import "CEPopupPickerView.h"

@interface CEViewController () {
@private
CEPopupPickerView* popupPicker;
}
@end

@implementation CEViewController
@synthesize selectedCharacter;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSelectedCharacter:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)chooseCharacter:(id)sender {
    NSArray* values = [NSArray arrayWithObjects:@"Don", @"Peggy", @"Pete", nil];
    if(popupPicker == nil) {
        popupPicker = [[CEPopupPickerView alloc] initWithValues:values callback:^(NSInteger selectedIndex) {
            self.selectedCharacter.text = [NSString stringWithFormat:@"you chose: %@", [values objectAtIndex:selectedIndex]];
        }];
        popupPicker.pickerAccessibilityLabel = @"Picker";
    }
    [popupPicker presentInView:self.view];
}

- (IBAction)close:(id)sender {
    [popupPicker close];
}

@end
