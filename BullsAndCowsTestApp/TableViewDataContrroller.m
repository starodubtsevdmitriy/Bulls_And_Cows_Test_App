//
//  TableViewDataContrroller.m
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewDataContrroller.h"


@implementation TableViewDataContrroller

@synthesize listOfStatistic;

- (id)init {
    if (self = [super init]){
        NSMutableArray *localList = [[NSMutableArray alloc] init]; //Instantiate list
        self.listOfStatistic = localList;
        [localList release];
    }
    return self;}

- (void)cleaneList {
    [listOfStatistic removeAllObjects];
}

- (unsigned)countOfList {
    return [listOfStatistic count];
}
- (void)addData:(NSString*)data {
   // [listOfStatistic addObject:data];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
