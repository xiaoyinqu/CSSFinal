//
//  Location.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _organization= [jsonDictionary objectForKey:@"Organization"];
        _category = [jsonDictionary objectForKey:@"Category"];
        _address = [jsonDictionary objectForKey:@"Address"];
        _phone = [jsonDictionary objectForKey:@"phone"];
        _website= [jsonDictionary objectForKey:@"Website"];
        _isSponsor = [jsonDictionary objectForKey:@"IsSponsor"];
        
    }
    
    return self;
}

@end
