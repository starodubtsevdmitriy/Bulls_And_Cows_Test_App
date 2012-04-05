//
//  BullsAndCowsViewController.h
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BullsAndCowsDataController.h"

@class BullsAndCowsDataController;
@class UItablView;



@interface BullsAndCowsViewController : UIViewController <UITextFieldDelegate> {
    BullsAndCowsDataController *dataController;
    IBOutlet UITableView *statList;
}

@property (nonatomic, strong) BullsAndCowsDataController *dataController;
@property (nonatomic, strong) IBOutlet UITextField *userNumber;
@property (nonatomic, strong, readwrite) NSString *countOfCows;
@property (nonatomic, strong, readwrite) NSString *countOfBulls;
@property (nonatomic, strong) IBOutlet UINavigationBar* navigationBar;
@property (nonatomic) int countOfAttempt;

- (IBAction)buttonGoPressed:(id)sender;
+ (BOOL) stringContainsSameCharacters:(NSString *) userString;

@end

@interface YourViewController : UIViewController <UIAlertViewDelegate> 
@end



