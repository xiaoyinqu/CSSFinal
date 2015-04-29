//
//  LocationsViewController.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "LocationsViewController.h"
#import "LocationDetailViewController.h"
#import "Location.h"
#import "JSONLoader.h"
#import "organizationTableViewCell.h"

@implementation LocationsViewController {
    NSArray *_locations;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"database" withExtension:@"json"];
    
    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _locations = [jsonLoader locationsFromJSONFile:url withKey:_category];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
}

// Just before showing the LocationDetailViewController, set the selected Location object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LocationDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.location = [_locations objectAtIndex:indexPath.row];
}



#pragma mark - Table View Controller Methods

- (organizationTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    organizationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"organizationCell"];
    
    Location *location = [_locations objectAtIndex:indexPath.row];

    
    cell.organizationLabel.text = location.organization;
    cell.organizationLabel.numberOfLines = 2;
    
    
    // the sponsor organization has a different color in its table cell
    if ([location.isSponsor isEqualToString:@"1"]){
        
        cell.backgroundColor = [UIColor colorWithRed:(186.0/255.0) green:(255.0/255.0) blue:(196.0/255.0) alpha:1.0];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_locations count];
}

@end
