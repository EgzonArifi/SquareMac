//
//  RepeatString.h
//  Square
//
//  Created by Egzon Arifi on 1/15/17.
//  Copyright © 2017 Egzon Arifi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepeatString : NSObject

-(int)minimalModify:(NSString *)text;
- (void)minimalModify:(NSString *)text WithPrintCompletion:(void (^)(int minalOperations, NSString *transformations))completion;
@end
