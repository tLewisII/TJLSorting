//
//  TJLSortingController.m
//  TJLSorting
//
//  Created by Terry Lewis II on 9/9/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import "TJLSortingController.h"
#import "TJLSorter.h"
@interface TJLSortingController()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSDate *date;


@end
@implementation TJLSortingController

-(void)viewDidLoad {
    self.tableView.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.unsortedArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SORTINGCELL" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.unsortedArray[indexPath.row]];
    return cell;
}
- (IBAction)sort:(UIBarButtonItem *)sender {
    NSTimeInterval runTime = 0.0;
    TJLSorter *sorter = [[TJLSorter alloc]init];
    if([self.algorithmName isEqualToString:@"Bubble sort"]) {
        self.date = [NSDate date];
        self.unsortedArray = [sorter bubbleSort:self.unsortedArray];
        runTime += [self.date timeIntervalSinceNow];
        [self.tableView reloadData];
        [self showAlertViewWithTime:runTime];
    }
    
    else if([self.algorithmName isEqualToString:@"Insertion sort"]) {
        self.date = [NSDate date];
        self.unsortedArray = [sorter insetionSort:self.unsortedArray];
        runTime += [self.date timeIntervalSinceNow];
        [self.tableView reloadData];
        [self showAlertViewWithTime:runTime];
    }
    
    else if([self.algorithmName isEqualToString:@"Quick sort"]) {
        self.date = [NSDate date];
        self.unsortedArray = [sorter quickSort:self.unsortedArray];
        runTime += [self.date timeIntervalSinceNow];
        [self.tableView reloadData];
        [self showAlertViewWithTime:runTime];
    }
    
    else if([self.algorithmName isEqualToString:@"Foundation sort"]) {
        self.date = [NSDate date];
        self.unsortedArray = [self.unsortedArray sortedArrayUsingSelector:@selector(compare:)];
        runTime += [self.date timeIntervalSinceNow];
        [self.tableView reloadData];
        [self showAlertViewWithTime:runTime];
    }
    
    else if([self.algorithmName isEqualToString:@"Merge sort"]) {
        self.date = [NSDate date];
        self.unsortedArray = [self.unsortedArray sortedArrayUsingSelector:@selector(compare:)];
        runTime += [self.date timeIntervalSinceNow];
        [self.tableView reloadData];
        [self showAlertViewWithTime:runTime];
    }
}

-(void)showAlertViewWithTime:(NSTimeInterval)time {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Run Time" message:[NSString stringWithFormat:@"It took %f%@%lu%@%@",ABS(time),@" Seconds to sort ", (unsigned long)self.unsortedArray.count, @" items using ", self.algorithmName] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertView show];
}
@end
