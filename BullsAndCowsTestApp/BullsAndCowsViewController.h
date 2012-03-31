//
//  BullsAndCowsViewController.h
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BullsAndCowsDataController.h"
#import "TableViewDataContrroller.h"

@class BullsAndCowsDataController;
@class TableViewDataContrroller;
@class UItablView;



@interface BullsAndCowsViewController : UIViewController <UITextFieldDelegate> {
    BullsAndCowsDataController *dataController;
    IBOutlet UITableView *statList;
    TableViewDataContrroller *tableDataContrrolle;
}

@property (nonatomic, strong) BullsAndCowsDataController *dataController;
@property (nonatomic, strong) IBOutlet UITextField *userNumber;
@property (nonatomic, strong, readwrite) NSString *countOfCows;
@property (nonatomic, strong, readwrite) NSString *countOfBulls;
@property (nonatomic, strong) IBOutlet UILabel *userCurrentNumber;
@property (nonatomic, strong) IBOutlet UILabel * temp;
@property (nonatomic, strong) TableViewDataContrroller *tableDataContrrolle;
@property (nonatomic) int countOfAttempt;

- (IBAction)buttonGoPressed:(id)sender;
+ (BOOL) stringContainsSameCharacters:(NSString *) userString;

@end

@interface YourViewController : UIViewController <UIAlertViewDelegate> 
@end



