//
//  TableViewDataContrroller.h
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewDataContrroller : NSObject {
    NSMutableArray *listOfStatistic;
}

- (unsigned)countOfList; //returns number of elements in list
- (void)addData:(NSString*)data;//adds data to the list
- (void) cleaneList;

@property (nonatomic, copy, readwrite) NSMutableArray *listOfStatistic;

@end
