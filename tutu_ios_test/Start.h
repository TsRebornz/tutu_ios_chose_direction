//
//  Start.h
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 17/06/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Start : NSObject

+(Start*)sharedInstance;

-(void)startConnectionToServer;

@end
