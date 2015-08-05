//
//  ViewController.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AtmJsonRequest.h"

#import <CoreLocation/CoreLocation.h>

//
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ATMJSONDelegate, CLLocationManagerDelegate>

@property(nonatomic) AtmJsonRequest *atmJsonRequest;
@property (nonatomic) CLLocationManager *locationManager;

@end

