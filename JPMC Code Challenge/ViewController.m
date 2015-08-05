//
//  ViewController.m
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/4/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import "ViewController.h"
#import "AtmTableCell.h"
#import "ATMData.h"
#import "UtilitiesConfiguration.h"
#import "ViewInMapViewController.h"

#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *numberOfAtms;
@property (nonatomic) NSString *latitude, *longitude;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic)ATMData *sendData;


@end

@implementation ViewController

-(void)setNumberOfAtms:(NSMutableArray *)numberOfAtms{
    if (!_numberOfAtms){
        _numberOfAtms = [[NSMutableArray alloc] init];
    }
    _numberOfAtms = numberOfAtms;
}

- (IBAction)refreshTable:(UIBarButtonItem *)sender {
    [self startUpdateLocation];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Code to check if the app can respond to the new selector found in iOS 8. If so, request it.
    [self.locationManager requestWhenInUseAuthorization];
    
    [self startUpdateLocation];
    
        //[self makeURLRequest];
}

-(IBAction)updateNewLocation:(id)sender{
    
}

- (void) startUpdateLocation{
    [self.activityIndicator startAnimating];
    [self.locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    [self.locationManager stopUpdatingLocation];
    CLLocation *location = locations.lastObject;
    self.latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
    [self makeURLRequest];

}

- (void)makeURLRequest{
    self.atmJsonRequest = [[AtmJsonRequest alloc] init];
    self.atmJsonRequest.delegate = self;
    NSString *completeUrl = [NSString stringWithFormat:baseURL, self.latitude, self.longitude];
    
    [self.atmJsonRequest requestWebRequest:[NSURL URLWithString:completeUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma MARK ATMJSONDelegate
-(void)success{
    NSLog(@"success");
    
    [self.activityIndicator stopAnimating];
    self.numberOfAtms = self.atmJsonRequest.locationArray;
    
    [[self tableView] reloadData];
    
}

-(void)failed{
    
}

#pragma mark Table View Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    //NSLog(@"%ld", [[self numberOfAtms]count]);
    return [[self numberOfAtms] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AtmTableCell *cell = (AtmTableCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    ATMData *eachRow = [self.numberOfAtms objectAtIndex:indexPath.row];
    
    cell.name.text = eachRow.name;
    cell.locType.text = eachRow.locationType;
    cell.distance.text = [NSString stringWithFormat:@"%@ mil", eachRow.distance];
    cell.address.text = [NSString stringWithFormat:@"%@ %@,%@ %@",eachRow.address, eachRow.city, eachRow.state, eachRow.zip];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.sendData = [self.numberOfAtms objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"more" sender:self];
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mapView"]) {
        
        ViewInMapViewController *viewMapView = segue.destinationViewController;
        viewMapView.latitude = self.latitude;
        viewMapView.longitude = self.longitude;
        viewMapView.atmList = self.numberOfAtms;
    }else if ([segue.identifier isEqualToString:@"more"]){
        DetailViewController *detailView = segue.destinationViewController;
        detailView.atmData = self.sendData;
        
    }
    
}

@end
