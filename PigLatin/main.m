//
//  main.m
//  PigLatin
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSLog(@"%@", [@"Hello World" stringByPigLatinization]);
        NSLog(@"%@", [@"Glitter Turkey" stringByPigLatinization]);
        NSLog(@"%@", [@"Alex is a babe" stringByPigLatinization]);

        
    }
    return 0;
}
