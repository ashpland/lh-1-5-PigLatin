//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "NSString+PigLatin.h"


@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization
{
    NSMutableString *returnString = [NSMutableString new];
    
    NSArray<NSString *> *wordsArray = [self componentsSeparatedByString:@" "];
    for (NSString *word in wordsArray) {
        [returnString appendFormat:@"%@ ", [NSString pigShiftWord:word]];
    }
    
    return [returnString stringByTrimmingCharactersInSet:[NSMutableCharacterSet whitespaceCharacterSet]];
}

+ (NSString *)pigShiftWord:(NSString *)wordToPigShift
{
    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
    
    NSString *pigShiftedWord;
    
    BOOL hasUpperCase = [wordToPigShift rangeOfCharacterFromSet: upperCaseSet].location != 0;
    
    // Don't shout, wont work with all uppercase
    pigShiftedWord = hasUpperCase ?
    [NSString pigShiftLowercaseString:wordToPigShift.lowercaseString] :
    [[NSString pigShiftLowercaseString:wordToPigShift.lowercaseString] capitalizedString];
    
    return pigShiftedWord;
}




+(NSString *)pigShiftLowercaseString:(NSString *)stringToPigShift
{
    NSCharacterSet *vowelsSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    bool firstLetterIsConsonant = [stringToPigShift rangeOfCharacterFromSet:vowelsSet].location != 0;
    if (firstLetterIsConsonant) {
        return [NSString pigShiftLowercaseString:
                [NSString stringWithFormat:@"%@%@", [stringToPigShift substringFromIndex:1], [stringToPigShift substringToIndex:1]]];
    }
    
    return [NSString stringWithFormat:@"%@ay", stringToPigShift];
}

@end
