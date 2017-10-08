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
    //prep character sets
    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *whiteChars = [NSMutableCharacterSet whitespaceCharacterSet];
    
    //break into words
    NSArray<NSString *> *wordsArray = [self componentsSeparatedByString:@" "];
    
    //create return string
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@" "];

    //iterate on words
    for (NSString *word in wordsArray) {
        NSString *pigShiftedWord;
        
        //check for uppercase then pigShift
        NSRange hasUpperCase = [word rangeOfCharacterFromSet: upperCaseSet];
        if(hasUpperCase.location == 0){
            pigShiftedWord = [[NSString pigShift:word.lowercaseString] capitalizedString];
        } else {
            pigShiftedWord = [NSString pigShift:word.lowercaseString];
        }
        
        //append to returnString
        [returnString appendFormat:@"%@ ", pigShiftedWord];
    }
    
    //return after trimming whitespace
    return [returnString stringByTrimmingCharactersInSet:whiteChars];
}


+(NSString *)pigShift:(NSString *)stringToPigShift{
    //get vowels
    NSCharacterSet *vowelsSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    //check for initial vowels
    NSRange initialVowels = [stringToPigShift rangeOfCharacterFromSet:vowelsSet];
    
    //if initial consonant shift to end and call again
    if (initialVowels.location != 0) {
        return [NSString pigShift:[NSString stringWithFormat:@"%@%@",
                            [stringToPigShift substringFromIndex:1],
                            [stringToPigShift substringToIndex:1]]];
    }
    
    //if initial vowel, append "ay" and return
    else {
        return [NSString stringWithFormat:@"%@ay", stringToPigShift];
    }
}

@end

// Recapitalize
// Assemble into string
// Trim last space
// Return

