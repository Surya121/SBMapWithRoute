//
//  UICGCheckPoint.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICGCheckPoint.h"


@implementation UICGCheckPoint

@synthesize dictionaryRepresentation;
@synthesize step;
@synthesize summaryHtml;
@synthesize wayPoints;
@synthesize mPlaceTitle;

+ (UICGCheckPoint *)CheckPointWithDictionaryRepresentation:(NSDictionary *)dictionary {
	UICGCheckPoint *CheckPoint = [[UICGCheckPoint alloc] initWithDictionaryRepresentation:dictionary];
	return [CheckPoint autorelease];
}

- (id)initWithDictionaryRepresentation:(NSDictionary *)dictionary {
	self = [super init];
	if (self != nil) {
		dictionaryRepresentation = [dictionary retain];	
		NSDictionary *routeDic = [dictionaryRepresentation objectForKey:@"k"];
		step = [routeDic objectForKey:@"Steps"];
		self.wayPoints = [NSMutableArray arrayWithCapacity:[step count]];
		NSMutableArray* wayPointsHTML = [NSMutableArray arrayWithCapacity:[step count]];
		for (int i=0 ; i<[step count]; i++) {
			NSArray *coordinateArray = [[[step objectAtIndex:i] objectForKey:@"Point"] objectForKey:@"coordinates"];
			
			CLLocationDegrees latitude  = [[coordinateArray objectAtIndex:1] doubleValue];
			CLLocationDegrees longitude = [[coordinateArray objectAtIndex:0] doubleValue];
			CLLocation *location = [[[CLLocation alloc] initWithLatitude:latitude longitude:longitude] autorelease];
			[self.wayPoints addObject:location];
			
			NSString *mDescriptionHTML = [[step objectAtIndex:i] objectForKey:@"descriptionHtml"];
			[wayPointsHTML addObject:mDescriptionHTML];
		}



	if (!mPlaceTitle ) {
		self.mPlaceTitle=[[NSMutableArray alloc] initWithCapacity:[wayPointsHTML count]];
		//NSMutableArray *mArr = [[NSMutableArray alloc]initWithCapacity:[wayPointsHTML count]]; 
		for (int index=0 ; index<[step count]; index++)	
		{
			//NSString *mPlaceString = [[[NSString alloc]init]autorelease];
			summaryHtml = [wayPointsHTML objectAtIndex:index];
			//mPlaceString = [wayPointsHTML objectAtIndex:index];
			summaryHtml = [summaryHtml stringByReplacingOccurrencesOfString:@"\\r\\" withString:@""];
			//mPlaceString = [mPlaceString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
			NSRange r;
			while ((r = [summaryHtml rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
			{
				summaryHtml = [summaryHtml stringByReplacingCharactersInRange:r withString:@""];
			}
			//while ((r = [mPlaceString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
//			{
//				mPlaceString = [mPlaceString stringByReplacingCharactersInRange:r withString:@""];	
//			}
//			NSLog(@"summaryHtml%@",summaryHtml);
//			NSLog(@"mPlaceString%@",mPlaceString);
			[self.mPlaceTitle addObject:summaryHtml];
			//[mArr addObject:mPlaceString];
			//NSLog(@"%@",summaryHtml);
		}
		//NSLog(@" wayPointsHTML %@",wayPointsHTML);
		[mPlaceTitle release];
	}
	}
	
	return self;
}

- (void)dealloc {
	//[routeArray release];
	[dictionaryRepresentation release];
	[wayPoints release];
	[super dealloc];
}

@end
