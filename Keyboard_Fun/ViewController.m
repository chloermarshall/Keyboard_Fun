//
//  ViewController.m
//  Keyboard_Fun
//
//  Created by Chloe Marshall on 2/16/17.
//  Copyright © 2017 Chloe Marshall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneWithKeyboard:(id)sender {
    activeField = nil;
    [sender resignFirstResponder];
}

- (IBAction)didBeginEditing:(id)sender {
    //how come we didnt have to sythesize this variable;
    activeField = sender;
}

- (IBAction)didEndEditing:(id)sender {
    activeField = nil;
}

- (void) keyboardWasShown: (NSNotification *) aNotification{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    if(!CGRectContainsPoint(aRect, activeField.frame.origin)){
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
        [_scrollView setContentOffset: scrollPoint animated:YES];
        
    }
    
}
- (void) keyboardWillBeHidden: (NSNotification *) aNotification{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
}
@end
