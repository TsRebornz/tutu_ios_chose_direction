//
//  DataSingleton.m
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 12/04/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSingleton.h"

@implementation DataSingleton

- (id)init
{
    if (self = [super init])
    {
        self.cityId = [NSDictionary dictionaryWithObjectsAndKeys: @"Jo", @"first", @"Smith", @"last", nil];
        self.test = @"Singleton_test";
        self.cities = [[NSMutableDictionary alloc] init];
        self.stations = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+(id)sharedInstance
 {
      static DataSingleton *sharedData = nil;
      static dispatch_once_t onceToken;
      dispatch_once(&onceToken, ^{
         sharedData = [[self alloc] init];
     });
    return sharedData;
 }

-(id)getCityBy:(int)Id{
    return [[NSObject alloc] init];
}

-(id)getStationBy:(int)Id{
    return [[NSObject alloc] init];
}

-(NSString*)getTest{
    return self.test;
}

-(void)setNewTest:(NSString *)newVal{
    self.test = newVal;
}

-(NSMutableDictionary*)getDataForTableView{
    NSMutableDictionary* data = [[NSMutableDictionary alloc] init];
    //get from data property
    return data;
}

@end
