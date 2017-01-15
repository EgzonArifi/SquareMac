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

- (int)minimalModify:(NSString *)text {
    
    int result = (int)text.length;
    
    if ((int)text.length == 1) {
        return 1;
    }
    
    for (int i = (int)(text.length/2-1); i < (int)(text.length/2+1); i++)
    {
        result = MIN(result, [self calculateTransformations:[text substringWithRange:NSMakeRange(0, i)]
                                                rightString:[text substringFromIndex:i] WithCompletion:^(NSString *transformations) {
                                                    
                                                }]);
    }
    return result;
    
}
- (int) calculateTransformations: (NSString *)leftPart rightString:(NSString*)rightPart WithCompletion:(void (^)(NSString *transformations))completion {
    
//    NSString *leftPart = [text substringWithRange:NSMakeRange(0, text.length/2)];
//    NSString *rightPart = [text substringFromIndex:text.length/2];
    
    NSMutableArray *leftCharArray = [NSMutableArray array];
    for (int i = 0; i < [leftPart length]; i++) {
        [leftCharArray addObject:[NSString stringWithFormat:@"%C", [leftPart characterAtIndex:i]]];
    }
    
    NSMutableArray *rightCharArray = [NSMutableArray array];
    for (int i = 0; i < [rightPart length]; i++) {
        [rightCharArray addObject:[NSString stringWithFormat:@"%C", [rightPart characterAtIndex:i]]];
    }
    
    int matrix [leftPart.length + 1][rightPart.length + 1];
    
    for (int i = 0; i <= leftPart.length; i++)
        for (int j = 0; j <= rightPart.length; j++)
            if (i == 0)
            {
                matrix[i][j] = j;
            }
            else if (j == 0)
            {
                matrix[i][j] = i;
            }
            else if (leftCharArray[i - 1] == rightCharArray[j - 1])
            {
                matrix[i][j] = matrix[i - 1][j - 1];
            }
            else
            {
                matrix[i][j] = MIN(matrix[i - 1][j], MIN(matrix[i][j - 1], matrix[i - 1][j - 1])) + 1;
            }

    //Print
    NSString *rez = @"";
    for (int i = 0; i <= leftPart.length; i++) {
        for (int j = 0; j <= rightPart.length; j++) {
            rez = [NSString stringWithFormat:@"%@ %d",rez,matrix[i][j]];
        }
        rez = [NSString stringWithFormat:@"%@\n",rez];
    }
    NSLog(@"%@",rez);
    completion(rez);
    return matrix[leftPart.length][rightPart.length];;
}
- (void)minimalModify:(NSString *)text WithPrintCompletion:(void (^)(int minalOperations, NSString *transformations))completion {
    int result = (int)text.length;
    
    if ((int)text.length == 1) {
        completion(1,@"");
    }
    
    __block NSString *printResult = nil;
    for (int i = (int)(text.length/2-1); i < (int)(text.length/2+1); i++)
    {
        printResult = @"";
        result = MIN(result, [self calculateTransformations:[text substringWithRange:NSMakeRange(0, i)]
                                                rightString:[text substringFromIndex:i] WithCompletion:^(NSString *transformations) {
                                                    printResult = transformations;
                                                }]);
    }
    completion(result,printResult);
}
@end
