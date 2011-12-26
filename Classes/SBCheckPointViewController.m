//
//  SBCheckPoints.m
//  SBMapWithRoute
//
//  Created by Surya Kant on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBCheckPointViewController.h"


@interface SBCheckPointViewController(Private)
-(void)releaseAllViews;
-(void)customInitialization;
@end

@implementation SBCheckPointViewController(Private)
-(void)releaseAllViews
{
    
    self.mTable =nil;
}

-(void)customInitialization
{

	self.mCheckPoints = [[NSMutableArray alloc]init];
}

@end



@implementation SBCheckPointViewController
@synthesize mTable;
@synthesize mCheckPoints;

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
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{

    return 1;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{

	return [mCheckPoints count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
	cell.textLabel.text = [NSString stringWithFormat:@"%@",[mCheckPoints objectAtIndex:indexPath.row]];
	cell.textLabel.numberOfLines = 3;
	cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
	return cell;	
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	return 55.0f;
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
	[self releaseAllViews];
}


- (void)dealloc {
    
	[mCheckPoints release];
	[self releaseAllViews];
    [super dealloc];
}


@end
