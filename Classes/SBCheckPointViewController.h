//
//  SBCheckPoints.h
//  SBMapWithRoute
//
//  Created by Surya Kant on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SBCheckPointViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{

	IBOutlet UITableView *mTable;
	NSMutableArray *mCheckPoints;
}
@property (nonatomic,retain) UITableView *mTable;
@property (nonatomic,retain) NSMutableArray *mCheckPoints;

@end
