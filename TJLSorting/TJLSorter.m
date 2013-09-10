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

-(NSArray*)quickSort:(NSArray*)unsortedArray {
    NSInteger numberOfElements = unsortedArray.count;
    if(numberOfElements <= 1) return unsortedArray;
    
    NSMutableArray* lessArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* moreArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    
    id pivotValue = [unsortedArray objectAtIndex:arc4random_uniform((u_int32_t)numberOfElements)];
    for (id value in unsortedArray) {
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

-(NSArray *)insetionSort:(NSArray *)arr {
    NSMutableArray *array = [NSMutableArray arrayWithArray:arr];
    NSInteger i;
    for(NSInteger j = 1; j< array.count; j++) {
        id key = [array objectAtIndex:j];
        i  = j - 1;
        while (i >= 0 && [[array objectAtIndex:i] compare:key] != NSOrderedAscending) {
            [array replaceObjectAtIndex:i + 1 withObject:[array objectAtIndex:i]];
            i= i - 1;
        }
        [array replaceObjectAtIndex:i + 1 withObject:key];
    }
    return  [NSArray arrayWithArray:array];
}

-(NSArray *)mergeSort:(NSArray *)array {
    if (array.count < 2) return array;
    
    NSUInteger middle = array.count / 2;
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, (array.count - middle));
    NSArray *rightArr = [array subarrayWithRange:right];
    NSArray *leftArr = [array subarrayWithRange:left];
    return [self merge:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
}

-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr {
    NSMutableArray *result = [NSMutableArray new];
    NSInteger right = 0;
    NSInteger left = 0;
    
    while (left < leftArr.count && right < rightArr.count) {
        if ([[leftArr objectAtIndex:left] compare:[rightArr objectAtIndex:right]] != NSOrderedDescending){
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else {
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, (leftArr.count - left));
    NSRange rightRange = NSMakeRange(right, (rightArr.count - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}

@end
