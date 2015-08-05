//
//  AtmJsonRequest.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ATMJSONDelegate <NSObject>

@required
-(void)success;
-(void)failed;


@end

@interface AtmJsonRequest : NSObject

@property(nonatomic)id<ATMJSONDelegate>delegate;
@property (nonatomic)NSMutableArray *locationArray;



-(void) requestWebRequest:(NSURL*)chaseURL;

@end
