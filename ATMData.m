//
//  ATMData.m
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import "ATMData.h"

@implementation ATMData



-(void)setLobbyHrs:(NSMutableArray *)lobbyHrs{
    if (!_lobbyHrs){
        _lobbyHrs = [[NSMutableArray alloc] init];
    }
    _lobbyHrs = lobbyHrs;
}

-(void)setDriveUpHrs:(NSMutableArray *)driveUpHrs{
    if (!_driveUpHrs){
        _driveUpHrs = [[NSMutableArray alloc] init];
    }
    _driveUpHrs = driveUpHrs;
}

@end
