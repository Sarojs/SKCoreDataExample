//
//  ViewController.m
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 12/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import "ViewController.h"
#import "SKCoreDataStack.h"
#import "Employee.h"
#import "Department.h"

@interface ViewController ()
@property(nonatomic,retain) IBOutlet UITableView *tableView;
@property(nonatomic,retain) SKCoreDataStack *stack;
@property(nonatomic,retain) NSFetchedResultsController *resultController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.stack = [[SKCoreDataStack alloc] init];
    
    // Insert some rows in database
    if ([[_resultController fetchedObjects] count]==0) {
        [self insertDummyRowsIfRequired];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self performRefreshFromDatabase];
    
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [[_resultController fetchedObjects] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cells"];
    Employee *employee = [[_resultController fetchedObjects] objectAtIndex:indexPath.row];
    cell.imageView.image = employee.photo;
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%@)",employee.name, employee.employeeID];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"In Department %@ (%@)",[(Department*)employee.department departmentName], [(Department*)employee.department departmentID]];
    return cell;
}

- (void) performRefreshFromDatabase{
    self.resultController = [_stack frcWithEntityNamed:@"Employee" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"name,employeeID" andSectionNameKeyPath:nil];
    NSError *error;
    [self.resultController performFetch:&error];
    NSAssert(error==nil, [error localizedDescription]);
}

- (void)insertDummyRowsIfRequired{
    
    // 1

    Department *dept1 = [[Department alloc] init];
    dept1.departmentID = @"001";
    dept1.departmentName = @"Accounts";
    
    Employee *emp1 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"
                                                   inManagedObjectContext:[_stack managedObjectContext]];
    emp1.name = @"Peter";
    emp1.employeeID = @"111";
    emp1.photo = [UIImage imageNamed:@"1.png"];
    emp1.department = dept1;
    
    // 2
    
    Department *dept2 = [[Department alloc] init];
    dept2.departmentID = @"002";
    dept2.departmentName = @"Finance";
    
    Employee *emp2 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"
                                                   inManagedObjectContext:[_stack managedObjectContext]];
    emp2.name = @"Tony";
    emp2.employeeID = @"222";
    emp2.photo = [UIImage imageNamed:@"2.png"];
    emp2.department = dept2;
    
    // 3
    
    Department *dept3 = [[Department alloc] init];
    dept3.departmentID = @"003";
    dept3.departmentName = @"Logistics";
    
    Employee *emp3 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"
                                                   inManagedObjectContext:[_stack managedObjectContext]];
    emp3.name = @"Steve";
    emp3.employeeID = @"333";
    emp3.photo = [UIImage imageNamed:@"3.png"];
    emp3.department = dept3;
    
    // 4
    
    Department *dept4 = [[Department alloc] init];
    dept4.departmentID = @"004";
    dept4.departmentName = @"Immigration";
    
    Employee *emp4 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"
                                                   inManagedObjectContext:[_stack managedObjectContext]];
    emp4.name = @"Billi";
    emp4.employeeID = @"444";
    emp4.photo = [UIImage imageNamed:@"4.png"];
    emp4.department = dept4;
    
    // 5
    
    Department *dept5 = [[Department alloc] init];
    dept5.departmentID = @"005";
    dept5.departmentName = @"Human Resource";
    
    Employee *emp5 = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"
                                                   inManagedObjectContext:[_stack managedObjectContext]];
    emp5.name = @"Bruce";
    emp5.employeeID = @"555";
    emp5.photo = [UIImage imageNamed:@"5.png"];
    emp5.department = dept5;
    
    NSError *error;
    if([[_stack managedObjectContext] save:&error]){
    }else{
        NSLog(@"Error in saving: %@", error);
    }
}

@end
