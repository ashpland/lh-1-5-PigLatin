//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "NSString+PigLatin.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization
{
    
    NSRange upperCaseRange;
    if (upperCaseRange.length == 0)
        NSLog(@"stringToTest does not contain any upper-case characters.");
    
    
    
    
    
    
    
    NSLog(@"%@", self);
    
    NSArray<NSString *> *wordsArray = [self componentsSeparatedByString:@" "];
    
    NSMutableArray<NSMutableDictionary<NSString *, NSString *> *> *pigWordHolder = [NSMutableArray new];

    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];

    
    for (NSString *word in wordsArray) {
        NSDictionary<NSString *, NSString *> *wordInfo;
        
        NSString *firstLetter = [word substringToIndex:1];
        NSRange hasUpperCase = [firstLetter rangeOfCharacterFromSet: upperCaseSet];
        if(hasUpperCase.length != 0){
            wordInfo = @{
                         @"wordKey" : word,
                         @"capitalKey" : @"YES"
                         };
        } else {
            wordInfo = @{
                         @"wordKey" : word,
                         @"capitalKey" : @"NO"
                         };
        }
        
        [pigWordHolder addObject:[[NSMutableDictionary alloc]
                                  initWithDictionary:wordInfo]];
    }
    
    

    
    
    NSLog(@"%@\n",pigWordHolder);

    
    return @"";
}

@end
