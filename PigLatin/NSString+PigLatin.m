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
    NSLog(@"%@", self);
    
    NSArray<NSString *> *wordsArray = [self componentsSeparatedByString:@" "];
    
    NSLog(@"%@\n",wordsArray);

    
    return @"";
}

@end
