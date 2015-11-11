//
//  MainViewController.m
//  Sure
//
//  Created by Akoo on 15/11/5.
//  Copyright (c) 2015年 Akoo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSInteger segmentIndex;
    NSInteger fileNameNumber; //32bit system 最大为 2147483648
    NSString *fileNaneNumberString;
    NSArray *documentPaths;  //沙盒路径；
    NSString *documentFolder;//沙盒的document文件夹
    NSMutableString *contentString;

}

@property (weak, nonatomic) IBOutlet UITextField *recordMoneyTextFiled;
@property (weak, nonatomic) IBOutlet UITextView *markTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *mouthlyTotalCost;
@property (weak, nonatomic) IBOutlet UILabel *mouthlytotalIncome;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentButton;
@property (weak, nonatomic) IBOutlet UILabel *recordMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyUnit;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _moneyUnit.text = @"元";
    fileNameNumber = 0;
    segmentIndex = _segmentButton.selectedSegmentIndex;
    _markTextField.layer.borderWidth = 1;
    _markTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _markTextField.layer.cornerRadius = 3;
    NSString *fileNamePath = [NSString stringWithFormat:@"%@/fileName.txt",documentFolder];
    NSURL *pathUrl = [NSURL URLWithString:fileNamePath];
    NSString *strr = [NSString stringWithContentsOfURL:pathUrl encoding:NSUTF8StringEncoding error:nil];
    fileNameNumber = [strr integerValue];
    
    fileNaneNumberString = [[NSString alloc] init];
    contentString = [[NSMutableString alloc] init];
    
    documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentFolder = [documentPaths objectAtIndex:0];
    
    NSString *filePath = [NSString stringWithFormat:@"%@//%ld.txt",documentPaths,fileNameNumber];
    NSString *str = @"hello";
    [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"fileNameNumber:%@",filePath);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressSaveButton:(id)sender {
    [self saveFileNameNuberToFile];
    [self saveContenstringToFile];
    
}

-(void)saveFileNameNuberToFile{
    
    fileNameNumber ++;
    
    //保存更新文件的名字
    fileNaneNumberString = [NSString stringWithFormat:@"%ld",fileNameNumber];
    NSString *filePath = [NSString stringWithFormat:@"%@/fileName.txt",documentFolder];
    [fileNaneNumberString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
-(void)saveContenstringToFile{
    contentString = [_recordMoneyTextFiled.text mutableCopy];
    //保存内容
    NSString *contentFilePath = [NSString stringWithFormat:@"%@//%ld.txt",documentFolder,fileNameNumber];
    NSLog(@"fileNameNumber:%@",contentFilePath);
    [contentString writeToFile:contentFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


- (IBAction)segmentBtnAction:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    NSLog(@"selectedSegmentIndex:%ld",index);
    segmentIndex = index;
    if (index == 1) {
        _recordMoneyLabel.text = @"收入:";
        _recordMoneyTextFiled.placeholder = @"进账金额";
    }else{
        _recordMoneyLabel.text = @"支出:";
        _recordMoneyTextFiled.placeholder = @"请输入支出金额";
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
