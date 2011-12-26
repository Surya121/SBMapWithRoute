//
//  City.h
//  SBMapWithRoute
//
//  Created by Surya Kant on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface City : NSObject {
	NSString*	mCityName;
	NSString*	mCityDescription;
}
@property (nonatomic, retain) NSString* mCityName;
@property (nonatomic, retain) NSString* mCityDescription;

@end
