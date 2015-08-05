//
//  ATMData.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <Foundation/Foundation.h>
//Helper object class to store the JSON data from API
@interface ATMData : NSObject

@property(nonatomic) NSString *name;
@property(nonatomic) NSString *locationType;
@property(nonatomic) NSString *address;
@property(nonatomic) NSString *city, *state, *zip;
@property(nonatomic) NSString *latitude, *longitude;
@property(nonatomic) NSString *bank, *label, *type;
@property(nonatomic) NSMutableArray *lobbyHrs, *driveUpHrs;
@property(nonatomic) NSString *distance, *atm, *phone;

@property(nonatomic)NSArray *services;

@end
