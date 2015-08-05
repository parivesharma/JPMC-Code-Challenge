//
//  AtmJsonRequest.m
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import "AtmJsonRequest.h"

#import "ATMData.h"

@interface AtmJsonRequest()

@property (nonatomic)NSArray *locationArrayTemp;


@end

@implementation AtmJsonRequest



-(void)requestWebRequest:(NSURL *)chaseURL{
    _locationArray = [[NSMutableArray alloc] init];
    _locationArrayTemp = [[NSArray alloc] init];
    
    NSLog(@"%@", chaseURL);
    //Mak asynchronous request to get JSON response from the public chase API
    NSURLRequest *request = [NSURLRequest requestWithURL:chaseURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error == nil){
            NSError *jsonError;
            NSDictionary *dataAfterJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
           
            if ( jsonError == nil){
            self.locationArrayTemp= [dataAfterJson objectForKey:@"locations"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self manageDataFromJSON];
                 });
            }
        }
        
    }];
    [ task resume];
    
    

}

-(void) manageDataFromJSON{
    //Storing the JSON in ATMData Object class
    for(NSDictionary *locationData in self.locationArrayTemp){
        ATMData *atmData = [[ATMData alloc] init];
        
        for(int i = 0; i<7; i++){
            atmData.lobbyHrs[i] = @"";
            atmData.driveUpHrs[i] = @"";
        }
        
        
        atmData.name = [locationData valueForKey:@"name"];
        atmData.address = [locationData valueForKey:@"address"];
        atmData.city = [locationData valueForKey:@"city"];
        atmData.state = [locationData valueForKey:@"state"];
        atmData.zip = [locationData valueForKey:@"zip"];
        atmData.latitude = [locationData valueForKey:@"lat"];
        atmData.longitude = [locationData valueForKey:@"lng"];
        atmData.distance = [NSString stringWithFormat:@"%@", [locationData valueForKey:@"distance"]];
        atmData.locationType = [locationData valueForKey:@"locType"];
        atmData.label = [locationData valueForKey:@"label"];
        atmData.bank = [locationData valueForKey:@"bank"];
        
        if ([locationData valueForKey:@"lobbyHrs"] != nil) {
            atmData.lobbyHrs = [locationData valueForKey:@"lobbyHrs"];
        }
        if ([locationData valueForKey:@"driveUpHrs"] != nil) {
            atmData.driveUpHrs = [locationData valueForKey:@"driveUpHrs"];
        }
        
        [self.locationArray addObject:atmData];
        
    
    }
        
    if (self.delegate != nil) {
        
        
        if ([self.delegate respondsToSelector:@selector(success)]) {
            [self.delegate success];
        }
    }
}

@end
