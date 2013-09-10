//
//  TJLSorter.h
//  TJLSorting
//
//  Created by Terry Lewis II on 9/9/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJLSorter : NSObject
-(NSArray *)quickSort:(NSArray *)array; //needs work to handle duplicates
-(NSArray *)bubbleSort:(NSArray *)array;
-(NSArray *)insetionSort:(NSArray *)array;
-(NSArray *)mergeSort:(NSArray *)array;
@end
