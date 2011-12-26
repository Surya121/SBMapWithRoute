//
//  SBRouteAnnotation.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 21/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "SBRouteAnnotation.h"

@implementation SBRouteAnnotation

@synthesize coordinate = coordinate;
@synthesize title = mTitle;
@synthesize annotationType = annotationType;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)inTitle annotationType:(SBRouteAnnotationType)type {
	self = [super init];
	if (self != nil) {
		coordinate = coord;
		mTitle = [inTitle retain];
		annotationType = type;
	}
	return self;
}

- (void)dealloc {
	[mTitle release];	
	[super dealloc];
}

@end
