//
//  ViewController.m
//  Square
//
//  Created by Egzon Arifi on 1/15/17.
//  Copyright © 2017 Egzon Arifi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (weak) IBOutlet NSButton *calculateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)calculateAction:(id)sender {
    NSLog(@"Egzon");
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Numri minimal i operacioneve per shendrimin e ketij teksti ne 'SQUARE' eshte \n => 5"];
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}
@end
