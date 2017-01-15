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
    NSLog(@"Egzon");
    int returnValue = [self.repeatString minimalModify:[self.inputTextField stringValue]];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:[NSString stringWithFormat:@"Numri minimal i operacioneve per shendrimin e ketij teksti ne 'SQUARE' eshte \n => %d",returnValue]];
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}
@end
