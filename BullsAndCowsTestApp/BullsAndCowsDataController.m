//
//  BullsAndCowsDataController.m
//  BullsAndCowsTestApp
//
//  Created by Dmitriy Starodubtsev on 28.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BullsAndCowsDataController.h"

@implementation BullsAndCowsDataController

@synthesize userNumberArray;
@synthesize rarandomArray;
@synthesize tableArray;

- (id)init {
    if (self = [super init]){
        NSMutableArray *localuserNumberArray = [[NSMutableArray alloc] init]; //Instantiate userNumberArray
        self.userNumberArray = localuserNumberArray;
        NSMutableArray *localRandomArray = [[NSMutableArray alloc] init]; //Instantiate randomArray
        self.rarandomArray = localRandomArray;
        NSMutableArray *localTableArray = [[NSMutableArray alloc]init];//Instantiate tableArray
        self.tableArray = localTableArray;
    }
    return self;
}

+ (NSString *) formationOfTheStringsFromCowsCounter:(NSString *) cowsCounter 
                                       bullsCounter:(NSString *) bullsCounter 
                                    numberOfAttempt:(int) numberOfAttempt {
    NSString *tempString1 = [bullsCounter stringByAppendingString:cowsCounter];
    NSString *tempString2 = [NSString stringWithFormat:@"Attempt:%hu", numberOfAttempt];
    NSString *tempString3 = [tempString2 stringByAppendingString:tempString1];
    
    return tempString3;
}

+   (BOOL) userNumber:(NSMutableArray *) userArray 
isEqualToRandomNumber:(NSMutableArray *) randomArray {
    if ([userArray isEqual:randomArray]) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (int) cowsCounter:(NSMutableArray *) userArray 
          inArrays:(NSMutableArray *) randomArray {
    int cowsCounter = 0;
    for (int position = 0; position <= 3; position ++) {
        if ([randomArray containsObject:[userArray objectAtIndex:position]] && [[userArray objectAtIndex:position] isEqual:[randomArray objectAtIndex:position]] == NO) {
            cowsCounter ++;
        }
    }
    return cowsCounter;
}

+ (int) bullsCounter:(NSMutableArray *) userArray 
            inArrays:(NSMutableArray *) randomArray {
    int bullsCounter = 0;
    for (int position = 0; position <= 3; position ++) {
        if ([[userArray objectAtIndex:position] isEqual:[randomArray objectAtIndex:position]]) {
            bullsCounter ++;
        }
    }
    return bullsCounter;
}


+ (NSMutableArray *) randomNumberGenerate {
    NSMutableArray *randomArray = [[NSMutableArray alloc]init ];
    for (int position = 0; position <= 3; position++) {
        int randomNumber = (arc4random() % 9) + 0;
        NSString *elementOfRandonNumber = [NSString stringWithFormat:@"%hu",randomNumber];
        if (position == 0) {
            [randomArray addObject:elementOfRandonNumber]; 
        }
        else if ([randomArray containsObject:elementOfRandonNumber] == NO) {
            [randomArray addObject:elementOfRandonNumber];
        }
        else {
            position = position - 1;
        }
    }
    return randomArray;
}

- (void) addDataToTableArray:(NSString *) data {
    self.tableArray = [[NSMutableArray alloc]initWithCapacity:100];
    [tableArray addObject:data];
}

+ (NSString *) fromArrayToString:(NSMutableArray*) array {
    NSString * result = [[NSString alloc]init];
    result = [[array valueForKey:@"description"] componentsJoinedByString:@""];
    return result;
}
            
+ (NSMutableArray *) fromStringToArray:(NSString *) string {
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int position = 0; position <= 3; position++) {
        NSString *element = [string substringWithRange:NSMakeRange(position, 1)];
        [array addObject:element];
    }
    
    return array;
}

@end
