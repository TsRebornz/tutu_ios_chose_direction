//
//  Start.m
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 17/06/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

#import <Foundation/Foundation.h>

#if iOS

#endif

@implementation Start : NSObject

+(id)sharedInstance{
    static Start *sharedData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData = [[self alloc] init];
    });
    return sharedData;
}

@end