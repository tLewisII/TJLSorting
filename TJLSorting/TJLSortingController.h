//
//  TJLSortingController.h
//  TJLSorting
//
//  Created by Terry Lewis II on 9/9/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJLSortingController : UIViewController
@property(strong,nonatomic) NSString *algorithmName;
@property(nonatomic) SEL selector;
@property(strong,nonatomic) NSArray *unsortedArray;
@end
