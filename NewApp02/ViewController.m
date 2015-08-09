//
//  ViewController.m
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "ViewController.h"
typedef NS_ENUM(NSUInteger, Class){
    cars = 0,
    watches,
};

@interface ViewController ()
@property(nonatomic) NSArray *cars;
@property(nonatomic) NSArray *watches;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _firstTableView.dataSource = self;
    _firstTableView.delegate = self;
    
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    //プロパティリストの中身データを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSArray *cars = [dic objectForKey:@"cars"];
    NSArray *watches = [dic objectForKey:@"watches"];
    
    //取得できた配列データをメンバ変数に代入
//    self.cars = cars;
    self.watches = watches;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 2;
}
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
    {
        // セクションタイトルの文字列変数を宣言
        NSString *title;
        
        // 表示しているセクションのタイトルを
        switch (section) {
            case watches:
                title = @"時計";
                break;
            default:
                break;
        }
        return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //データの数によって行数が増える。
    NSInteger rows;
    switch (section) {
        case watches:
            rows = [self.watches count];
            break;
        default:
            break;
    }
    return rows;
    
}
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //cellForRowAtIndexPathセルの中身を決める
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSString *itemName;
    switch (indexPath.section) {
              case watches:
            itemName = self.watches[indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.text = itemName;
    return cell;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
