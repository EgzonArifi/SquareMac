//
//  ViewController.m
//  Square
//
//  Created by Egzon Arifi on 1/15/17.
//  Copyright © 2017 Egzon Arifi. All rights reserved.
//

#import "ViewController.h"
#import "RepeatString.h"

@interface ViewController()

@property (weak) IBOutlet NSButton *calculateButton;
@property (nonatomic) RepeatString *repeatString;
@property (weak) IBOutlet NSTextField *inputTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repeatString = [[RepeatString alloc] init];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)calculateAction:(id)sender {
    NSAlert *alert = [[NSAlert alloc] init];
    
    if ([self.inputTextField stringValue].length == 0) {
        [alert setMessageText:@"Teksti eshte i zbrazet"];
    } else if ([self.inputTextField stringValue].length > 50) {
        [alert setMessageText:@"Teksti eshte i limituar me 50 karaktere"];
    } else {
        int returnValue = [self.repeatString minimalModify:[self.inputTextField stringValue]];
        [alert setMessageText:[NSString stringWithFormat:@"Numri minimal i operacioneve eshte: %d",returnValue]];
    }
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}
@end
