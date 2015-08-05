//
//  DetailViewController.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/5/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATMData.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationbarr;
@property (nonatomic)BOOL navigationBarRequired;
@property(nonatomic)ATMData *atmData;
@end
