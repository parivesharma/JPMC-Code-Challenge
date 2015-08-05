
//
//  DetailViewController.m
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/5/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *citystatezip;
@property (weak, nonatomic) IBOutlet UILabel *locTy;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *bank;


@property (weak, nonatomic) IBOutlet UILabel *lM;
@property (weak, nonatomic) IBOutlet UILabel *lt;
@property (weak, nonatomic) IBOutlet UILabel *lw;
@property (weak, nonatomic) IBOutlet UILabel *lth;
@property (weak, nonatomic) IBOutlet UILabel *lf;
@property (weak, nonatomic) IBOutlet UILabel *ls;
@property (weak, nonatomic) IBOutlet UILabel *lsu;

@property (weak, nonatomic) IBOutlet UILabel *dm;
@property (weak, nonatomic) IBOutlet UILabel *dt;
@property (weak, nonatomic) IBOutlet UILabel *dw;
@property (weak, nonatomic) IBOutlet UILabel *dth;
@property (weak, nonatomic) IBOutlet UILabel *df;
@property (weak, nonatomic) IBOutlet UILabel *ds;
@property (weak, nonatomic) IBOutlet UILabel *dsu;
@end

@implementation DetailViewController
-(void)setAtmData:(ATMData *)atmData{
    if (!_atmData) {
        _atmData = [[ATMData alloc] init];
    }
    _atmData = atmData;
}

- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //if (self.navigationBarRequired) {
       // self.navigationbarr. = self.navigationBarRequired;
    //}
    
    self.nameLabel.text = _atmData.name;
    _address.text = _atmData.address;
    _citystatezip.text = [NSString stringWithFormat:@"%@, %@ %@",_atmData.city, _atmData.state, _atmData.zip];
    _locTy.text = _atmData.locationType;
    _distance.text = [NSString stringWithFormat:@"%@ mi",_atmData.distance];
    _bank.text = _atmData.bank;
    
    _labelTitle.text = _atmData.label;
    
    _lM.text = ([_atmData.lobbyHrs[1] isEqualToString:@""] || _atmData.lobbyHrs[1]==nil)? @"N/A" : _atmData.lobbyHrs[1] ;
    _lt.text = ([_atmData.lobbyHrs[2] isEqualToString:@""]|| _atmData.lobbyHrs[2]==nil)? @"N/A" : _atmData.lobbyHrs[2] ;
    _lw.text = ([_atmData.lobbyHrs[3] isEqualToString:@""]|| _atmData.lobbyHrs[3]==nil)? @"N/A" : _atmData.lobbyHrs[3] ;
    _lth.text = ([_atmData.lobbyHrs[4] isEqualToString:@""]|| _atmData.lobbyHrs[4]==nil)? @"N/A" : _atmData.lobbyHrs[4] ;
    _lf.text = ([_atmData.lobbyHrs[5] isEqualToString:@""]|| _atmData.lobbyHrs[5]==nil)? @"N/A" : _atmData.lobbyHrs[5] ;
    _ls.text = ([_atmData.lobbyHrs[6] isEqualToString:@""]|| _atmData.lobbyHrs[6]==nil)? @"N/A" : _atmData.lobbyHrs[6] ;
    _lsu.text = ([_atmData.lobbyHrs[0] isEqualToString:@""]|| _atmData.lobbyHrs[0]==nil)? @"N/A" : _atmData.lobbyHrs[0] ;
    
    
    _dm.text = ([_atmData.driveUpHrs[1] isEqualToString:@""] || _atmData.driveUpHrs[1] == nil)? @"N/A" : _atmData.driveUpHrs[1] ;
    _dt.text = ([_atmData.driveUpHrs[2] isEqualToString:@""]||_atmData.driveUpHrs[2] == nil)? @"N/A" : _atmData.driveUpHrs[2] ;
    _dw.text = ([_atmData.driveUpHrs[3] isEqualToString:@""]|| _atmData.driveUpHrs[3] == nil)? @"N/A" : _atmData.driveUpHrs[3] ;
    _dth.text = ([_atmData.driveUpHrs[4] isEqualToString:@""]|| _atmData.driveUpHrs[4] == nil)? @"N/A" : _atmData.driveUpHrs[4] ;
    _df.text = ([_atmData.driveUpHrs[5] isEqualToString:@""]|| _atmData.driveUpHrs[5] == nil)? @"N/A" : _atmData.driveUpHrs[5] ;
    _ds.text = ([_atmData.driveUpHrs[6] isEqualToString:@""]|| _atmData.driveUpHrs[6] == nil)? @"N/A" : _atmData.driveUpHrs[6] ;
    _dsu.text = ([_atmData.driveUpHrs[0] isEqualToString:@""]|| _atmData.driveUpHrs[0] == nil)? @"N/A" : _atmData.driveUpHrs[0] ;
    
    
   // NSLog(@"%@ ", self.atmData.name);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
