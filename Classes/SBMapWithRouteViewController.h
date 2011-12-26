//
//  SBMapWithRouteViewController.h
//  SBMapWithRoute
//
//  Created by Surya Kant on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBMapWithRouteViewController : UIViewController <UITextFieldDelegate>{

	UITextField			*mSourceCity;		//TextField for the Source city
	UITextField			*mDestinationCity1;	//TextField for the Destination city1
	UIButton			*mLoadDirection;	//Button for moving in next controller ie. GoogleMapController
	UISegmentedControl	*mTravelMode;		//SegmentController for the option of the travelling mode
	NSMutableArray *DestinationCityArray;
}
@property (nonatomic, retain) IBOutlet UITextField *sourceCity;
@property (nonatomic, retain) IBOutlet UITextField *destinationCity1;
@property (nonatomic, retain) IBOutlet UIButton *loadDirection;
@property (nonatomic, retain) IBOutlet UISegmentedControl *travelMode;
@property (nonatomic, retain) NSMutableArray *DestinationCityArray;

#pragma mark ButtonAction

-(IBAction)showGoogleMap:(id)sender;		//Action for moving in next controller ie. GoogleMapController

@end

