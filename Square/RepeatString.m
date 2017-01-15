//
//  RepeatString.m
//  Square
//
//  Created by Egzon Arifi on 1/15/17.
//  Copyright © 2017 Egzon Arifi. All rights reserved.
//

#import "RepeatString.h"
#ifndef MIN
#import <NSObjCRuntime.h>
#endif

@implementation RepeatString

-(int)minimalModify:(NSString *)text {
    
    NSString *leftPart = [text substringWithRange:NSMakeRange(0, text.length/2)];
    NSString *rightPart = [text substringFromIndex:text.length/2];
    
    NSMutableArray *leftCharArray = [NSMutableArray array];
    for (int i = 0; i < [leftPart length]; i++) {
        [leftCharArray addObject:[NSString stringWithFormat:@"%C", [leftPart characterAtIndex:i]]];
    }
    
    NSMutableArray *rightCharArray = [NSMutableArray array];
    for (int i = 0; i < [leftPart length]; i++) {
        [rightCharArray addObject:[NSString stringWithFormat:@"%C", [rightPart characterAtIndex:i]]];
    }
    
    int matrix [leftPart.length + 1][rightPart.length + 1];
    
    for (int i = 0; i < leftPart.length + 1; i++) {
        matrix[i][0] = i;
    }
    for (int i = 0; i < rightPart.length + 1; i++) {
        matrix[0][i] = i;
    }
    
    for (int i = 1; i < leftPart.length + 1; i++) {
        for (int j = 1; j < rightPart.length + 1; j++)
        {
            if (leftCharArray[i - 1] == rightCharArray[j - 1])
            {
                matrix[i][j] = matrix[i - 1][j - 1];
            }
            else
            {
                matrix[i][j] = MIN(matrix[i - 1][j], MIN(matrix[i][j - 1], matrix[i - 1][j - 1])) + 1;
            }
        }
    }
    return matrix[leftPart.length][rightPart.length];;
}
- (int) calculateTransformations: (NSString *)leftString rightString:(NSString*)rightString {
    return 0;
}
@end
