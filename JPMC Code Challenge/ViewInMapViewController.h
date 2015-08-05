//
//  ViewInMapViewController.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/5/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <UIKit/UIKit.h>


@import GoogleMaps;



@interface ViewInMapViewController : UIViewController<GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *smallView;
@property (nonatomic) NSMutableArray *atmList;
@property (nonatomic)NSString *latitude, *longitude;

@end