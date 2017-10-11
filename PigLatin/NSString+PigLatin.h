//
//  NSString+PigLatin.h
//  PigLatin
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PigLatin)

- (NSString *)stringByPigLatinization;
+ (NSString *)pigShiftWord:(NSString *)wordToPigShift;
+ (NSString *)pigShiftLowercaseString:(NSString *)stringToPigShift;

@end
