//
//  ViewController.m
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"



@interface ViewController (){
    AppDelegate *_appDelegate; //定義
    NSArray *_ary;

}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _firstTableView.dataSource = self;
    _firstTableView.delegate = self;
    
    self.title = @"リスト";
    
    _ary = @[@"車",@"時計"];
    NSLog(@"title = %@",_ary);
    
    

    
//    
//    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
//    NSBundle *bundle = [NSBundle mainBundle];
//    //読み込むプロパティリストのファイルパスを指定
//    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
//    //プロパティリストの中身データを取得
//    NSDictionary *_dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
//    NSArray *cars = [_dic objectForKey:@"cars"];
//    NSArray *watches = [_dic objectForKey:@"watches"];
    
    //取得できた配列データをメンバ変数に代入
//    self.cars = cars;
//    self.watches = watches;
    
    //プロパティリストの中身データを取得
    
//NSLog(@"dic = %@",_dic);
//    NSArray *cars = [dic objectForKey:@"cars"];
//    
//    NSLog(@"cars = %@",cars);
//    NSLog(@"cars[0] = %@",cars[0]);
//    NSLog(@"cars[0][3] = %@",cars[0][3]);
//
//    
//    
//    
//    NSArray *watches = [dic objectForKey:@"watches"];
////    NSLog(@"watchs = %@",watches);
//    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _ary.count;
    
}
    


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //cellForRowAtIndexPathセルの中身を決める
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _ary[indexPath.row];
    //indexPath.section;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"indexPath.row = %ld",(long)indexPath.row);
    NSLog(@"indexPath.row =%d",(int)indexPath.row);
    //タップしたcellとリンクする配列の中身（名前）を取得
    NSLog(@"リストの中身 = %@", _ary[indexPath.row]);
    _appDelegate.list = _ary[indexPath.row]; //AppDelegateクラスのlistプロパティーに_ary配列のindexPath.rowで指定した名前を代入
    NSLog(@"appDelegate.list = %@",_appDelegate.list);
    
    
    //遷移した先にデータを送るには？
    //AppDelegate
    NSLog(@"appDelegate.iPath 1 = %d",_appDelegate.iPath);//初期値の0が入っている
    _appDelegate.iPath = (int)indexPath.row;
    NSLog(@"appDelegate.iPath 2 = %d", _appDelegate.iPath);//選択したセルのidexPath.rowが入る
    NSLog(@"indexPath= %d",indexPath.row);
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
