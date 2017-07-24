//
//  StatesTablleViewController.m
//  sc00-StatesAndFlags
//
//  Created by Entec Department on 11/2/16.
//  Copyright © 2016 COP2654. All rights reserved.
//

#import "StatesTablleViewController.h"
#import "States.h"
#import "StateTableViewCell.h"
#import "StateDetailViewController.h"

@interface StatesTablleViewController ()

@property (nonatomic, strong) NSDictionary *test;
@property (nonatomic, strong) NSArray *data;

@end

@implementation StatesTablleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"plist"];
    
    // grab the content of the plist and save it into the dictionary
    self.test = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // look at keys in the dictionary and sort them
    self.data = [[self.test allKeys]sortedArrayUsingSelector:@selector(compare:)];
    /*States *alabama = [[States alloc]init];
    alabama.name = @"Alabama";
    alabama.capital = @"Montgomery";
    alabama.motto = @"Audemus jura nostra defendere";
    alabama.flag = [UIImage imageNamed:@"Flags/alabama.png"];
    
    States *georgia = [[States alloc]init];
    georgia.name = @"Georgia";
    georgia.capital = @"Atlanta";
    georgia.motto = @"Wisdom, Justice, Moderation";
    georgia.flag = [UIImage imageNamed:@"Flags/georgia.png"];
    
    States *florida = [[States alloc]init];
    florida.name = @"Florida";
    florida.capital = @"Tallahassee";
    florida.motto = @"In God We Trust";
    florida.flag = [UIImage imageNamed:@"Flags/florida.png"];
     */
    
    // add the states to our array
    //self.usStates = [NSMutableArray arrayWithObjects:alabama, georgia, florida, nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.test count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *key = self.data[section];
    NSArray *keyValues = self.test[key];
    return  [keyValues count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"stateInfoCell";
    StateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // populate cells with data
    /*States *item = [self.usStates objectAtIndex:indexPath.row];
    cell.stateName.text = item.name;
    cell.stateMotto.text = item.motto;
    cell.flagImageView.image = item.flag;*/
    // Configure the cell...
    
    int  j = (int)indexPath.row;
    static int notrecurring = 0;
    
    if(notrecurring < 6){
       
    
    
        NSString *key = self.data[j];
        NSArray *keyValues = self.test[key];
    
    
    
    
    
    
    
    //assign this to the cell's text property
    int i= 0;
  
    
    for(; i < [keyValues count] ; i++){
        if(i == 0 ){
            cell.stateName.text = keyValues[i];
        }
        else if(i == 1 ){
            cell.stateMotto.text = keyValues[i];
        }
        else if(i == 2 ){
            cell.imageView.image = [UIImage imageNamed:keyValues[i]];
        }
    }
}

    
    notrecurring++;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"showDetail"]){
        StateDetailViewController *destinationViewController = [segue destinationViewController];
        
        // get the selection
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        NSString *key = self.data[myIndexPath.row];
        NSArray *keyValue = self.test[key];
        
        // Pass the selected object to the new view controller.
        destinationViewController.keyValues = keyValue;

    }
    
}


@end
