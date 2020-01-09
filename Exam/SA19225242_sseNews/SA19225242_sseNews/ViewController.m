//
//  ViewController.m
//  SA19225242_sseNews
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "Model/News.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SA19225242_txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *SA19225242_txtDate;
@property (weak, nonatomic) IBOutlet UITextView *SA19225242_txtContent;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_SA19225242_txtTitle resignFirstResponder];
    [_SA19225242_txtDate resignFirstResponder];
    [_SA19225242_txtContent resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _SA19225242_txtTitle || textField == _SA19225242_txtDate || textField == _SA19225242_txtContent){
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)dataSave:(UIButton *)sender {
    TableViewController *tc = [[TableViewController alloc]init];
    News *news = [[News alloc]init];
    news.title = _SA19225242_txtTitle.text;
    news.date = _SA19225242_txtDate.text;
    news.content = _SA19225242_txtContent.text;
    
    if (_indexPath == nil) {
        [_newsArray addObject:news];
        [tc writeToFile:_newsArray filepath:_path];
    }
    else {
        //修改数据
        _newsArray[_indexPath.row] = news;
        //数据写入，writeToFile 必须为 public
        [tc writeToFile:_newsArray filepath:_path];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)dataClear:(UIButton *)sender {
    _SA19225242_txtContent.text = @"";
}

-(void) viewWillAppear:(BOOL)animated{
    if (self.indexPath != nil) {
        News *news = _newsArray[self.indexPath.row];
        _SA19225242_txtTitle.text = news.title;
        _SA19225242_txtDate.text = news.date;
        _SA19225242_txtContent.text = news.content;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
