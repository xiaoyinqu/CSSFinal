//
//  Location.h
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *organization;
@property (readonly) NSString *category;
@property (readonly) NSString *address;
@property (readonly) NSString *phone;
@property (readonly) NSString *website;
@property (readonly) NSString *isSponsor;


@end
