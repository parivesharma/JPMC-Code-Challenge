//
//  AtmTableCell.h
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtmTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *locType;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
