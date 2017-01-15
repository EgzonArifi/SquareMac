//
//  ViewController.m
//  Make Square
//
//  Created by Egzon Arifi on 1/15/17.
//  Copyright © 2017 Egzon Arifi. All rights reserved.
//

#import "MainController.h"
#import "RepeatString.h"

@interface MainController ()
@property (nonatomic) RepeatString *repeatString;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIView *terminalView;
@property (weak, nonatomic) IBOutlet UITextView *terminalTextView;
@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repeatString = [[RepeatString alloc] init];
}

- (IBAction)calculateAction:(id)sender {
    self.terminalTextView.text = @"";
    [self.inputTextField resignFirstResponder];
    if (self.inputTextField.text.length == 0) {
        [self showMessage:@"Teksti eshte i zbrazet" withTitle:@"Gabim!"];
    } else if (self.inputTextField.text.length > 50) {
        [self showMessage:@"Teksti eshte i limituar me 50 karaktere" withTitle:@"Gabim"];
    } else {
        [self.repeatString minimalModify:self.inputTextField.text WithPrintCompletion:^(int minalOperations, NSString *transformations) {
            [self showMessage:[NSString stringWithFormat:@"Numri minimal i operacioneve eshte: %d",minalOperations] withTitle:@""];
            [self.terminalView setHidden:NO];
            self.terminalTextView.text = transformations;
        }];
    }
}
- (void)showMessage:(NSString*)message withTitle:(NSString *)title {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action){
                                                         
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
