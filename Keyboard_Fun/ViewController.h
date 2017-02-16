//
//  ViewController.h
//  Keyboard_Fun
//
//  Created by Chloe Marshall on 2/16/17.
//  Copyright © 2017 Chloe Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITextField *activeField;
    //Placeholder for the active textbox
}
@property (weak, nonatomic) IBOutlet UITextField *textbox1;
@property (weak, nonatomic) IBOutlet UITextField *textbox2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)doneWithKeyboard:(id)sender;
- (IBAction)didBeginEditing:(id)sender;
- (IBAction)didEndEditing:(id)sender;
- (void) keyboardWasShown: (NSNotification *) aNotification;
- (void) keyboardWillBeHidden: (NSNotification *) aNotification;


@end

