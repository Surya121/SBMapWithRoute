//
//  City.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "City.h"


@implementation City

@synthesize mCityName;
@synthesize mCityDescription;

-(id) init
{
	self = [super init];
	if (self != nil) {
		self.mCityName = @"";
		self.mCityDescription = @"";
	}
	return self;
}
- (void) dealloc
{
	[mCityName release];
	[mCityDescription release];
	[super dealloc];
}


@end