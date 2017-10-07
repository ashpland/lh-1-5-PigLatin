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
    NSArray<NSString *> *wordsArray = [self componentsSeparatedByString:@" "];
    
    NSMutableArray<NSMutableDictionary<NSString *, NSString *> *> *pigWordHolder = [NSMutableArray new];

    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];

    
    for (NSString *word in wordsArray) {
        NSDictionary<NSString *, NSString *> *wordInfo;
        
        NSString *firstLetter = [word substringToIndex:1];
        NSRange hasUpperCase = [firstLetter rangeOfCharacterFromSet: upperCaseSet];
        if(hasUpperCase.length != 0){
            wordInfo = @{
                         @"wordKey" : word.lowercaseString,
                         @"capitalKey" : @"YES"
                         };
        } else {
            wordInfo = @{
                         @"wordKey" : word.lowercaseString,
                         @"capitalKey" : @"NO"
                         };
        }
        
        [pigWordHolder addObject:[[NSMutableDictionary alloc]
                                  initWithDictionary:wordInfo]];
    }
    
    NSCharacterSet *vowelsSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@" "];
    
    NSMutableString *transformWord = [NSMutableString new];
    
    for (NSMutableDictionary *wordInfo in pigWordHolder){
        transformWord = [[NSMutableString alloc]
                         initWithString:[wordInfo objectForKey:@"wordKey"]];
        NSRange initialVowels = [transformWord rangeOfCharacterFromSet:vowelsSet];
        // if word starts with a consonant
        if (initialVowels.location != 0) {
            do {
                NSString *firstLetter = [transformWord substringToIndex:1];
                transformWord = [[NSMutableString alloc]
                                 initWithString:[transformWord substringFromIndex:1]];
                [transformWord appendString:firstLetter];
                initialVowels = [transformWord rangeOfCharacterFromSet:vowelsSet];
            } while (initialVowels.location != 0);
        }
        [transformWord appendString:@"ay"];
        
        if([[wordInfo objectForKey:@"capitalKey"] isEqualToString:@"YES"]) {
            transformWord = [[NSMutableString alloc] initWithString:[transformWord capitalizedString]];
        }
        
        [returnString appendFormat:@"%@ ", transformWord];
        
        [wordInfo addEntriesFromDictionary:@{@"pigKey" : transformWord}];
    }
    
    NSCharacterSet *whiteChars = [NSMutableCharacterSet whitespaceCharacterSet];
    
    return [returnString stringByTrimmingCharactersInSet:whiteChars];
}

@end

// Recapitalize
// Assemble into string
// Trim last space
// Return

