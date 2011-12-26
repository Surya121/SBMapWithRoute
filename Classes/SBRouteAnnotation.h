//
//  SBRouteAnnotation.h
//  SBMapWithRoute
//
//  Created by Surya Kant on 21/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum SBRouteAnnotationType {
	SBRouteAnnotationTypeStart,
	SBRouteAnnotationTypeEnd,
	SBRouteAnnotationTypeWayPoint,
} SBRouteAnnotationType;

@interface SBRouteAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *mTitle;
	SBRouteAnnotationType annotationType;
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) SBRouteAnnotationType annotationType;

#pragma mark -
#pragma mark Instance Methods

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)inTitle  annotationType:(SBRouteAnnotationType)type;

@end
