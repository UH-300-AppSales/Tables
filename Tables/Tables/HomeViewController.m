//
//  HomeViewController.m
//  Tables
//
//  Created by UH300- App Sales on 11/3/15.
//  Copyright © 2015 UH300- App Sales. All rights reserved.
//

#import "HomeViewController.h"
#import "Person.h"
#import "DetailsViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *rollCallTableView;
@property NSMutableArray *personsArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Home";
    
    //Make sure the array is initialized
    self.personsArray = [NSMutableArray array];
    
    
    //Load up some students into our array
    Person *cassidy = [[Person alloc] init];
    cassidy.firstName = @"Cassidy";
    cassidy.lastName = @"Elliott";
    cassidy.age = 19;
    
    Person *courtney = [[Person alloc] init];
    courtney.firstName = @"Courtney";
    courtney.lastName = @"Wood";
    courtney.age = 19;
    
    //Add person(s) to the array
    [self.personsArray addObject:cassidy];
    [self.personsArray addObject:courtney];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.personsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Create
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TableViewCellSubtitle"];
    
    //Fetch the person from the array
    Person *person = self.personsArray[indexPath.row];
    
    //Fill the first name and last name
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    
    //Set the age
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", person.age];
    
    return cell;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewController *detailsVC = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
    
    //Pass to details VC
    Person *person = self.personsArray[indexPath.row];
    [detailsVC setPersonName:person];
    
    //Show details view
    [self.navigationController pushViewController:detailsVC animated:YES];
}

@end
