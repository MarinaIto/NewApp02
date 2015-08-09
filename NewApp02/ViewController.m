//
//  ViewController.m
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "ViewController.h"
//typedef NS_ENUM(NSUInteger, Class){
//    cars = 0,
//    watches,
//};

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
    
    NSLog(@"dic = %@",dic);
    NSArray *cars = [dic objectForKey:@"cars"];
    
    NSLog(@"cars = %@",cars);
    NSLog(@"cars[0] = %@",cars[0]);
    NSLog(@"cars[0][3] = %@",cars[0][3]);

    
    
    
    NSArray *watches = [dic objectForKey:@"watches"];
//    NSLog(@"watchs = %@",watches);
    
    //取得できた配列データをメンバ変数に代入
    self.cars = cars;
    self.watches = watches;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//        return 2;
    return _cars.count;
    
}
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
    {
        // セクションタイトルの文字列変数を宣言
        NSString *title;
        
        // 表示しているセクションのタイトルを
        switch (section) {
            case 0:
                title = @"その他";
                break;
            case 1:
                title = @"イギリス車";
                break;
            case 2:
                title = @"ドイツ車";
                break;
            case 3:
                title = @"イタリア車";
                break;
            case 4:
                title = @"日本車";
                break;
                
            default:
                break;
        }
        return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //データの数によって行数が増える。
    NSInteger rows;
//    switch (section) {
//            case cars:
//            rows = [self.cars count];
//            break;
//        case watches:
//            rows = [self.watches count];
//            break;
//        default:
//            break;
//    }
    switch (section) {
        case 0:
            rows = [_cars[0] count];
            break;
        case 1:
            rows = [_cars[1] count];
            break;
        case 2:
            rows = [_cars[2] count];
            break;
        case 3:
            rows = [_cars[3] count];
            break;
        case 4:
            rows = [_cars[4] count];
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
//    switch (indexPath.section) {
//              case 0:
//            itemName = self.cars[indexPath.row];
//              case watches:
//            itemName = self.watches[indexPath.row];
//            break;
//        default:
//            break;
//    }
    
    switch (indexPath.section) {
        case 0:
            itemName = self.cars[0][indexPath.row];
            break;
        case 1:
            itemName = self.cars[1][indexPath.row];
            break;
        case 2:
            itemName = self.cars[2][indexPath.row];
            break;
        case 3:
            itemName = self.cars[3][indexPath.row];
            break;
        case 4:
            itemName = self.cars[4][indexPath.row];
            break;


//
//        case watches:
//            itemName = self.watches[indexPath.row];
//            break;
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
