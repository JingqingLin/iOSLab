//
//  TableViewController.m
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "TableViewController.h"
#import "Model/Student.h"
#import "ViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *students;
@property (strong, nonatomic) Student *student;
@property (strong, nonatomic) NSString *path;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItemButton;

@end

@implementation TableViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchBar resignFirstResponder];
}

- (IBAction)refreshData:(UIRefreshControl *)sender {
    [self.refreshControl beginRefreshing];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}


- (void)writeToFile:(NSMutableArray *)sts filepath:(NSString*)path{
    NSData *data;
    NSMutableArray *ds=[[NSMutableArray alloc] init];
    for (Student *s in sts) {
        data = [NSKeyedArchiver archivedDataWithRootObject:s];
        [ds addObject:data];
    }
    [ds writeToFile:path atomically:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addInfo"]) {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students = self.students;
            vc.indexPath = nil;
            vc.path = self.path;
        }
    }
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students = self.students;
            vc.indexPath = indexpath ;
            vc.path = self.path;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"students.plist"];
    NSMutableArray *dataArray =[NSMutableArray arrayWithContentsOfFile:self.path];
    self.students=[[NSMutableArray alloc]init];
    for(NSData *s in dataArray)
    {
        [self.students addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

//小节数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
#warning Incomplete implementation, return the number of sections
    return 1;
}

//表单元数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
#warning Incomplete implementation, return the number of rows
    return [_students count];
}

//插入表单元
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    self.student = self.students[indexPath.row];
    cell.textLabel.text = self.student.name;
    cell.detailTextLabel.text = self.student.number;
    return cell;
}


/*
 Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

//删除表单元
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.students removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self writeToFile:self.students filepath:self.path];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modifyView"];
    vc.students= self.students;
    vc.indexPath = indexPath;
    vc.path = self.path;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchInName:(NSString *)searchString{
    NSMutableArray *temp = [[NSMutableArray alloc]init];
    for(Student *s in _students)
    {
        if ([s.name containsString:searchString])
            [temp addObject:s];
    }
    [self.students removeAllObjects];
    for(Student *stu in temp){
        [self.students addObject:stu];
    }
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [_addItemButton setEnabled:NO];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"students.plist"];
    NSMutableArray *dataArray =[NSMutableArray arrayWithContentsOfFile:self.path];
    self.students=[[NSMutableArray alloc]init];
    for(NSData *s in dataArray)
    {
        [self.students addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
    [self.tableView reloadData];
    [self searchInName:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchInName:searchBar.text];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_addItemButton setEnabled:YES];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"students.plist"];
    NSMutableArray *dataArray =[NSMutableArray arrayWithContentsOfFile:self.path];
    self.students=[[NSMutableArray alloc]init];
    for(NSData *s in dataArray)
    {
        [self.students addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
    [self.tableView reloadData];
    [searchBar resignFirstResponder];
}
/*
 Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
 Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
     Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
