//
//  BullsAndCowsViewController.m
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BullsAndCowsViewController.h"

@interface BullsAndCowsViewController()

@property (nonatomic) BOOL userAlredyWinGame;
@property (nonatomic) BOOL buttonGoAlredyPressedOneTime;

@end

@implementation BullsAndCowsViewController
@synthesize userNumber =_userNumber;
@synthesize dataController = _dataController;
@synthesize countOfBulls;
@synthesize countOfCows;
@synthesize userCurrentNumber = _userCurrentNumber;
@synthesize userAlredyWinGame = _userAlredyWinGame;
@synthesize buttonGoAlredyPressedOneTime = _buttonGoAlredyPressedOneTime;
@synthesize tableDataContrrolle = _tableDataContrrolle;
@synthesize temp = _temp;//need to delete...
@synthesize countOfAttempt;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

+ (BOOL) stringContainsSameCharacters:(NSString *) userString {
    for (int position = 0; position <= 2 ; position++) { 
        NSString *element = [userString substringWithRange:NSMakeRange(position, 1)];
        for (int secPos = position + 1; secPos <= 3; secPos ++) {
             NSString *secElement = [userString substringWithRange:NSMakeRange(secPos, 1)];
            if ([element isEqualToString: secElement]) {
                return YES;
                break;
            }
            
        }
    }
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataController = [[BullsAndCowsDataController alloc] init];
    self.tableDataContrrolle = [[TableViewDataContrroller alloc]init];
    [self.userNumber setDelegate:self];
    [self.tableDataContrrolle addData:@"Statistic:"];
    self.userAlredyWinGame = NO;
    self.buttonGoAlredyPressedOneTime = NO;
    countOfAttempt = 0;
    self.title = @"TEXT";
}
- (IBAction)buttonGoPressed:(id)sender {
    NSCharacterSet *alphaSet = [NSCharacterSet decimalDigitCharacterSet]; //check for leters contain
    BOOL valid = [[self.userNumber.text stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
    if (self.userNumber.text.length == 4) {
        if (valid == NO) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                                message:@"The string must contain numbers only " delegate:self 
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [alertView release];

        }
        else if ([[self class] stringContainsSameCharacters:self.userNumber.text] == YES ) {//check for seme numbers contain
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                                message:@"String contains same characters" delegate:self 
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
        }
        else {                                                                           //all check are ok!!!
            if (countOfAttempt == 0 && self.userAlredyWinGame == NO) {
                self.dataController.rarandomArray = [BullsAndCowsDataController randomNumberGenerate];                    //add random array
                self.dataController.userNumberArray = [BullsAndCowsDataController fromStringToArray:self.userNumber.text];//add user array
                self.buttonGoAlredyPressedOneTime = YES;
                self.userAlredyWinGame = [BullsAndCowsDataController userNumber:self.dataController.userNumberArray isEqualToRandomNumber:self.dataController.rarandomArray];                                       //alredy win check
                if (self.userAlredyWinGame == YES) {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"!YOU WIN!"
                                                                        message:@"Congratulations!\n You guessed the number!" delegate:self 
                                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertView show];
                    [alertView release];
                    self.userAlredyWinGame = NO;
                    //[self.dataController.userNumberArray removeLastObject];
                    //[self.dataController.rarandomArray removeAllObjects];
                }
                else {
                    countOfBulls = [NSString stringWithFormat:@"Numbers of bulss: %d",[BullsAndCowsDataController bullsCounter:self.dataController.userNumberArray inArrays:self.dataController.rarandomArray]];
                    countOfCows = [NSString stringWithFormat:@"Numbers of Cows: %d",[BullsAndCowsDataController cowsCounter:self.dataController.userNumberArray inArrays:self.dataController.rarandomArray]];
                    NSString *tempString = [BullsAndCowsDataController formationOfTheStringsFromCowsCounter:countOfCows bullsCounter:countOfBulls numberOfAttempt:countOfAttempt];
                    [self.dataController addDataToTableArray:tempString];
                    [self.tableDataContrrolle addData:countOfBulls];
                    [self.tableDataContrrolle addData:countOfCows];
                    self.userCurrentNumber.text = [BullsAndCowsDataController fromArrayToString:self.dataController.userNumberArray];
                    //[self.dataController.userNumberArray removeLastObject];
                    countOfAttempt += 1;
                }
            }
            else if (countOfAttempt > 0 && self.userAlredyWinGame == NO) {//All except the first attempt
                self.dataController.userNumberArray = [BullsAndCowsDataController fromStringToArray:self.userNumber.text];//add user array
                countOfAttempt += 1; 
                self.userAlredyWinGame = [BullsAndCowsDataController userNumber:self.dataController.userNumberArray isEqualToRandomNumber:self.dataController.rarandomArray];//alredy win check
                if (self.userAlredyWinGame == YES) {
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"!YOU WIN!"
                                                                        message:@"Congratulations!\n You guessed the number!" delegate:self 
                                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertView show];
                    [alertView release];
                    countOfAttempt = 0;
                    self.userAlredyWinGame = NO;
                    //[self.dataController.userNumberArray removeLastObject];
                    //[self.dataController.rarandomArray removeAllObjects];
                }
                else {
                    countOfBulls = [NSString stringWithFormat:@"Bulss: %d",[BullsAndCowsDataController bullsCounter:self.dataController.userNumberArray inArrays:self.dataController.rarandomArray]];
                    countOfCows = [NSString stringWithFormat:@"Cows: %d",[BullsAndCowsDataController cowsCounter:self.dataController.userNumberArray inArrays:self.dataController.rarandomArray]];
                    self.userCurrentNumber.text = [BullsAndCowsDataController fromArrayToString:self.dataController.userNumberArray];
                    //[self.dataController.userNumberArray removeLastObject];
                }
            }
            self.userNumber.text = @"";
            [statList reloadData];
        }
    }
    else {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error!!"
                                                            message:@"Number should have 4 digits" delegate:self 
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}

- (void)viewDidUnload
{
    [statList release];
    statList = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    
    // allow backspace
    if (range.length > 0 && [string length] == 0) {
        return YES;
    }
    
    // do not allow . at the beggining
    if (range.location == 0 && [string isEqualToString:@"."]) {
        return NO;
    }
    
    if ([textField.text length] + [string length] - range.length <= 4) {
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        textField.text = newValue;
    }
    
    // return NO because we're manually setting the value
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return countOfAttempt;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    cell.text = self.dataController.tableArray;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)dealloc {
    [statList release];
    [super dealloc];
}
@end
