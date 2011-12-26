//
//  SBMapWithRouteViewController.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBMapWithRouteViewController.h"
#import "SBGoogleMap.h"

@interface SBMapWithRouteViewController(Private)
-(void)releaseAllViews;
-(void)customInitialization;
@end

@implementation SBMapWithRouteViewController(Private)
-(void)releaseAllViews
{
	//Release All views that are retained by this class.. Both Views retained from nib and views added programatically
	//eg:
	//self.mMyTextField = nil
	self.sourceCity			= nil;
	self.destinationCity1	= nil;
	self.loadDirection		= nil;
	self.travelMode			= nil;
}

-(void)customInitialization
{
	// do the initialization of class variables here..
}

@end

@implementation SBMapWithRouteViewController

@synthesize sourceCity		= mSourceCity;
@synthesize destinationCity1 = mDestinationCity1;
@synthesize loadDirection	= mLoadDirection;
@synthesize travelMode		= mTravelMode;
@synthesize DestinationCityArray;

//Invoked when the class is instantiated in XIB
-(id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if( self)
	{
		[self customInitialization];
	}
	return self;
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		[self customInitialization];
	}
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Home";
	mTravelMode.selectedSegmentIndex = 0;    // AS App will launch, Index 0 of segmented control will be selected
	
}

#pragma mark ButtonAction

-(IBAction)showGoogleMap:(id)sender
{
	[mSourceCity resignFirstResponder];
	[mDestinationCity1 resignFirstResponder];
	
	SBGoogleMap *_Controller	= [[SBGoogleMap alloc]initWithNibName:@"SBGoogleMap" bundle:nil];
	
	_Controller.startPoint		= mSourceCity.text;
	self.DestinationCityArray = [[NSMutableArray alloc]init];
	if (mDestinationCity1.text != NULL ) {
		[DestinationCityArray addObject:mDestinationCity1.text];
		
	}
	
	_Controller.destination = DestinationCityArray;
	if (mTravelMode.selectedSegmentIndex == 0) {
		_Controller.travelMode	= UICGTravelModeDriving;
	} else {
	
		_Controller.travelMode	= UICGTravelModeWalking;
	}
	[self.navigationController pushViewController:_Controller animated:YES];
	[_Controller release];
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
	//self.destinationCity1.text = nil;
//	self.destinationCity2.text = nil;
//	self.sourceCity.text = nil;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[self releaseAllViews];
}


#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if ( textField == mSourceCity) {
		[mSourceCity resignFirstResponder];
		[mDestinationCity1 becomeFirstResponder];
	}
	if ( textField == mDestinationCity1) {
		[mDestinationCity1 resignFirstResponder];
	}
	return YES;
}

- (void)dealloc {
	[self releaseAllViews];
    [super dealloc];
}

@end
