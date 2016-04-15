//
//  DataSingleton.h
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 12/04/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface DataSingleton : NSObject
+(DataSingleton*) sharedInstance;

//-(NSDictionary*)cityId;

@property (strong) NSDictionary* cityId;
@property (strong) NSString* test;
@property (strong) NSMutableDictionary* cities;
@property (strong) NSMutableDictionary* stations;


-(NSString*)getTest;

-(void)setNewTest:(NSString*)newVal;

-(instancetype)getStationBy:(int)Id;
-(instancetype)getCityBy:(int)Id;



@end