//
//  main.m
//  PigLatin
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        [@"Hello World" stringByPigLatinization];
        [@"Glitter Turkey" stringByPigLatinization];
        [@"Alex is a babe" stringByPigLatinization];

        
    }
    return 0;
}
