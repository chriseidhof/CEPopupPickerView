//
//  CEViewController.h
//  CEPopupPickerView
//
//  Created by Chris Eidhof on 2/4/12.
//  Copyright (c) 2012 Chris Eidhof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CEViewController : UIViewController

- (IBAction)chooseCharacter:(id)sender;
- (IBAction)close:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *selectedCharacter;

@end
