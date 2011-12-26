//
//  UICGRoutes.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 27/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICGRoutes.h"


@implementation UICGRoutes
@synthesize mRoutes;
- (id) init
{
	self = [super init];
	if (self != nil) {
		self.mRoutes = [[NSMutableArray alloc]init];
	}
	return self;
}
- (void)dealloc {
	[mRoutes release]; mRoutes = nil;
	[super dealloc];
}

@end
