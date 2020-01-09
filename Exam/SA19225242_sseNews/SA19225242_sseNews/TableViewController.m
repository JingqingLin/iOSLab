//
//  TableViewController.m
//  SA19225242_sseNews
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "Model/News.h"

@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *newsArray;
@property (strong, nonatomic) News *news;
@property (strong, nonatomic) NSString *path;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItemButton;
//是否弹出过登录框
@property (nonatomic) BOOL isLogined;
@property (nonatomic) BOOL isAdmin;
@end

@implementation TableViewController

- (void)writeToFile:(NSMutableArray *)n filepath:(NSString*)path{
    NSData *data;
    NSMutableArray *ds=[[NSMutableArray alloc] init];
    for (News *s in n) {
        data = [NSKeyedArchiver archivedDataWithRootObject:s];
        [ds addObject:data];
    }
    [ds writeToFile:path atomically:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addNews"]) {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.newsArray = _newsArray;
            vc.indexPath = nil;
            vc.path = self.path;
        }
    }
    if ([segue.identifier isEqualToString:@"showNews"])
    {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.newsArray = _newsArray;
            vc.indexPath = indexpath ;
            vc.path = self.path;
        }
    }
}

- (void)judgeIdentity:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    
    if (alertController)
    {
        NSString *userName = alertController.textFields.firstObject.text;
        UIAlertAction *loginAction = alertController.actions.lastObject;
        if ([userName isEqualToString:@"user"]) {
            [_addItemButton setEnabled:NO];
            _isAdmin = NO;
            loginAction.enabled = YES;
        }
        else if ([userName isEqualToString:@"admin"]) {
            [_addItemButton setEnabled:YES];
            _isAdmin = YES;
            loginAction.enabled = YES;
        }
        else
            loginAction.enabled = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    if (_isLogined == NO) {
        //创建UIAlertController
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录" message:@"请输入用户名和密码" preferredStyle:UIAlertControllerStyleAlert];
        //添加文本框
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"用户名";
            // 添加响应事件
            [textField addTarget:self action:@selector(judgeIdentity:) forControlEvents:UIControlEventEditingChanged];
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"密码";
            textField.secureTextEntry = YES;
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Cancel Action");
        }];
        
        UIAlertAction *loginAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *userName = alertController.textFields.firstObject;
            UITextField *password = alertController.textFields.lastObject;
            // 输出用户名 密码到控制台
            NSLog(@"Username is %@, password is %@", userName.text,password.text);
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:loginAction];
        cancelAction.enabled = NO;
        loginAction.enabled = NO;
        [self presentViewController:alertController animated:YES completion:nil];
        _isLogined = YES;
    }
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"newsArray.plist"];
    NSMutableArray *dataArray =[NSMutableArray arrayWithContentsOfFile:self.path];
    _newsArray = [[NSMutableArray alloc]init];
    for(NSData *s in dataArray)
    {
        [_newsArray addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [_newsArray count];
}

//插入表单元
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    _news = _newsArray[indexPath.row];
    cell.textLabel.text = _news.title;
    cell.detailTextLabel.text = _news.date;
    return cell;
}

//删除表单元
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete && _isAdmin == YES) {
        [_newsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self writeToFile:_newsArray filepath:self.path];
    }
}

//右边信息按钮
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    if (_isAdmin == YES) {
        ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modifyView"];
        vc.newsArray = _newsArray;
        vc.indexPath = indexPath;
        vc.path = self.path;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"readView"];
        vc.newsArray = _newsArray;
        vc.indexPath = indexPath;
        vc.path = self.path;
        [self.navigationController pushViewController:vc animated:YES];
    }
   
}

@end
