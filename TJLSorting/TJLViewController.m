//
//  TJLViewController.m
//  TJLSorting
//
//  Created by Terry Lewis II on 9/9/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import "TJLViewController.h"
#import "TJLSortingController.h"
#import "TJLAppDelegate.h"
@interface TJLViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *datasource;
@property(nonatomic) NSUInteger elements;
@end

@implementation TJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.datasource = @[@"Bubble sort", @"Insertion sort", @"Merge sort", @"Foundation sort"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Number of Elements" message:@"How many elements do you want to sort?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
	
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.textLabel.text = self.datasource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:self.datasource[indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TJLSortingController *sorting = segue.destinationViewController;
    sorting.unsortedArray = [TJLAppDelegate sharedUnsortedArrayWithElements:self.elements];
    sorting.algorithmName = sender;
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UITextField *textField = [alertView textFieldAtIndex:0];
    self.elements = textField.text.integerValue;
}
@end
