//
//  TJLSorter.m
//  TJLSorting
//
//  Created by Terry Lewis II on 9/9/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import "TJLSorter.h"

@implementation TJLSorter

-(NSArray *)bubbleSort:(NSArray *)array {
    id temp;
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    for(NSUInteger i = 0; i < array.count; i++) {
        for(NSUInteger j = 0; j < array.count - i - 1; j++) {
            if([arr[j] compare:arr[j + 1]] != NSOrderedAscending) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    return arr;
}

-(NSArray*)quickSort:(NSArray*)array {
    NSInteger numberOfElements = array.count;
    if(numberOfElements <= 1) return array;
    
    NSMutableArray* lessArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* moreArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    
    id pivotValue = [array objectAtIndex:arc4random_uniform((u_int32_t)numberOfElements)];
    for (id value in array) {
        if([value floatValue] < [pivotValue floatValue]){
            [lessArray addObject:value];
        } else if([value floatValue] > [pivotValue floatValue]){
            [moreArray addObject:value];
        }
    }
    
    NSMutableArray* sortedArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort:moreArray]];
    return [NSArray arrayWithArray:sortedArray];
}

-(NSArray *)insetionSort:(NSArray *)array {
    NSMutableArray *sorting = [NSMutableArray arrayWithArray:array];
    NSInteger i;
    for(NSInteger j = 1; j< sorting.count; j++) {
        id key = [sorting objectAtIndex:j];
        i = j - 1;
        while (i >= 0 && [[sorting objectAtIndex:i] compare:key] != NSOrderedAscending) {
            [sorting replaceObjectAtIndex:i + 1 withObject:[sorting objectAtIndex:i]];
            i = i - 1;
        }
        [sorting replaceObjectAtIndex:i + 1 withObject:key];
    }
    return  [NSArray arrayWithArray:sorting];
}

-(NSArray *)mergeSort:(NSArray *)array {
    if (array.count <= 1) return array;
    
    NSUInteger middle = array.count / 2;
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, (array.count - middle));
    NSArray *rightArr = [array subarrayWithRange:right];
    NSArray *leftArr = [array subarrayWithRange:left];
    return [self mergeLeft:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
}

-(NSArray *)mergeLeft:(NSArray *)leftArray andRight:(NSArray *)rightArray {
    NSMutableArray *result = [NSMutableArray new];
    NSInteger right = 0;
    NSInteger left = 0;
    
    while (left < leftArray.count && right < rightArray.count) {
        if ([[leftArray objectAtIndex:left] compare:[rightArray objectAtIndex:right]] != NSOrderedDescending) {
            [result addObject:[leftArray objectAtIndex:left++]];
        }
        else {
            [result addObject:[rightArray objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, (leftArray.count - left));
    NSRange rightRange = NSMakeRange(right, (rightArray.count - right));
    NSArray *newRight = [rightArray subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArray subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}

@end
