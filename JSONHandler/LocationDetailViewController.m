//
//  LocationDetailViewController.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "MapAnnotation.h"

@interface LocationDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UIButton *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *website;
@property (weak, nonatomic) IBOutlet UIButton *address;

@property NSString *googleURL;




@end

@implementation LocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set title
    self.placeLabel.text = self.location.organization;
    self.placeLabel.numberOfLines = 3;
    self.addressLabel.text = self.location.address;
    self.addressLabel.numberOfLines = 3;
    
    NSString *prefix = @"https://www.google.com/maps/place/";
    NSString *addressURL = self.addressLabel.text;
    
    
    //only append prefix if the address is provided
    if ([addressURL length] == 0){
        self.googleURL = @"";
    }
    else {
        //parse the address to form the url suitable for google maps
        NSString *aString = addressURL;
        NSArray *array = [aString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *combinedAddress = [array componentsJoinedByString:@"+"];
        NSString *url = [NSString stringWithFormat: @"%@%@", prefix, combinedAddress];
        self.googleURL = url;
    }
    // set texts...
    [self.phoneLabel setTitle:self.location.phone forState:UIControlStateNormal];
    
    
    //only show "open in web" button when there is URL provided
    NSLog(@"%@",self.location.website);
    if ([self.location.website length] < 6){
        NSLog(@"%@%lu",@"the length of URL",(unsigned long)[self.location.website length]);
        [self.website setTitle:@""];
    }
    
    
    //only show address logo when there is actually address provided
    if ([self.location.address length] <  2){
        [self.address setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Call listing"])
    {
        //convert the given phone number into the format that can be called using "URLwithString" function. http://stackoverflow.com/questions/12296809/ios-phone-number-dialing-not-working
        
        NSString *strm = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)(self.location.phone), NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
        NSString *strMob = [[NSString alloc] initWithFormat:@"tel://%@",strm];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strMob]];
        
        
    }
    else if([title isEqualToString:@"Go"])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.googleURL]];
        
    }
    
    else if([title isEqualToString:@"Call CSS"])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:9096219900"]];
    }
    else if([title isEqualToString:@"Call IV"])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:8002518191"]];
    }
    else if([title isEqualToString:@"Call PV"])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:9098659500"]];
    }
}
- (IBAction)openInWeb:(UIBarButtonItem *)sender {
    NSString *websiteURL = [[NSString alloc] initWithFormat:@"https://%@",self.location.website];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:websiteURL]];
}


- (IBAction)callPhone:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Call"
                                                       message:@"Do you want to call this listing?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Call listing",nil];
    [theAlert show];
}
- (IBAction)getDirections:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Directions"
                                                       message:@"Do you want to get directions?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Go",nil];
    [theAlert show];
}
- (IBAction)callCSS:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Call"
                                                       message:@"Do you want to call CSS?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Call CSS",nil];
    [theAlert show];
}
- (IBAction)callInnerValley:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Inner Valley"
                                                       message:@"Do you want to call Inner Valley?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Call IV",nil];
    [theAlert show];
}
- (IBAction)callPomonaValley:(id)sender {
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Pomona Valley"
                                                       message:@"Do you want to call Pomona Valley?"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Call PV",nil];
    [theAlert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


