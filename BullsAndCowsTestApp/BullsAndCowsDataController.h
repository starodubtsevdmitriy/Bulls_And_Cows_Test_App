//
//  BullsAndCowsDataController.h
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 28.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BullsAndCowsDataController : NSObject 

- (void) removeAllObjectFromStatisticTable;
- (void) addDataToTableArray:(NSString *) data;
- (id)objectInListAtIndex:(unsigned)theIndex;
+ (NSArray *) randomNumberGenerate;
+ (NSString *) fromArrayToString:(int*) array;
+ (NSArray *) fromStringToArray:(NSString *) string;
+   (BOOL) userNumber:(NSMutableArray *) userArray 
isEqualToRandomNumber:(NSMutableArray *) randomArray;
+ (int) cowsCounter:(NSMutableArray *) userArray 
           inArrays:(NSMutableArray *) randomArray;
+ (int) bullsCounter:(NSMutableArray *) userArray 
            inArrays:(NSMutableArray *) randomArray;
+ (NSString *) formationOfTheStringsFromCowsCounter:(NSString *) cowsCounter 
                                       bullsCounter:(NSString *) bullsCounter
                                         userNumber:(NSString *) userNumber
                                    numberOfAttempt:(int) numberOfAttempt;

@property (nonatomic, copy, readwrite) NSMutableArray *userNumberArray;
@property (nonatomic, copy, readwrite) NSMutableArray *randomArray;
@property (nonatomic, copy, readwrite) NSMutableArray *tableArray;

@end
