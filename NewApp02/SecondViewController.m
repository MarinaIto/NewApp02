//
//  SecondViewController.m
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController (){
    AppDelegate *_appDelegate; //定義
    NSArray *_allAry;
    NSArray *_myary;
//    NSDictionary *_japan;
//    NSDictionary *_germany;
//    NSDictionary *_italy;
//    NSDictionary *_unitedKigdom;
//    NSDictionary *_unitedStatue;
//    NSDictionary *_others;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _secondTableView.dataSource = self;
    _secondTableView.delegate = self;
    _appDelegate = [[UIApplication sharedApplication] delegate];//初期化
    
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    //プロパティリストの中身データを取得
    _allAry = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"allAryの中身　=%@", _allAry);
    
    NSArray  *test = _allAry[0];
    NSLog(@"testの中身　=%@", test);
    
    

    //配列の中身を反対にする
    _myary = [[test reverseObjectEnumerator] allObjects];
    NSLog(@"反対バージョン =%@", _myary);
    NSLog(@"韓国 =%@", [_myary[5] objectForKey:@"name"]);
    NSArray *japan = [_myary[0] objectForKey:@"name"];
    NSLog(@"japanキー =%@", japan);
    
//    NSArray *japanName = japan
//    NSLog(@"japan = %@" ,japanName);
//
    
//    _japan = _myary[0];
//    _germany = _myary[1];
//    _italy = _myary[2];
//    _unitedKigdom = _myary[3];
//    _unitedStatue = _myary[4];
//    _others = _myary[5];
    
    //NSLog(@"japan　=%@" ,japan);
    
    //NSLog(@"japanキー =%@", [japan objectForKey:@"name"]);
    
    NSLog(@"myaryのカウント =%lu", (unsigned long)[_myary count]);
    
        
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // セクション数を設定
     NSLog(@"myaryのカウント =%lu", (unsigned long)_myary.count);
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        i = [_myary count];
        NSLog(@"myaryのカウント =%lu", (unsigned long)[_myary count]);
        
        
    } else if (_appDelegate.iPath == 1){
        i = 1;
    }
    NSLog(@"watches = %lu" ,(unsigned long)[_allAry[1] count]);
    return i;

}



    
    

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 各セクションにおける行数(rows)を設定
    
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        
        switch (section) {
            case 0:
                i =  (int)[_myary[0] count];
                break;
            case 1:
                i =  (int)[_myary[1] count];
                break;
            case 2:
                i =  (int)[_myary[2] count];
                break;
            case 3:
                i =  (int)[_myary[3] count];
                break;
            case 4:
                i =  (int)[_myary[4] count];
                break;
            case 5:
                i =  (int)[_myary[5] count];
                break;
            default:
                break;
        }
        
    } else if (_appDelegate.iPath == 1){
        i = [_allAry[1] count];
    }
    return i;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    
    // 表示しているセクションのタイトルをplistに登録しているものと合致させる

    if (_appDelegate.iPath == 0) {
      
        switch (section) {
            case 0:
                 title = @"Japan";
                break;
            case 1:
                 title = @"Germany";
                break;
            case 2:
                title = @"Italy";
                break;
            case 3:
                title = @"US";
                break;
            case 4:
                title = @"UK";
                break;
            case 5:
                title = @"others";
                break;
            default:
                break;
        }
        
    } else if (_appDelegate.iPath == 1){
     title = @"時計ブランド";
    }
    return title;

    }
//行に表示するデータを表示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // numberOfRowsInSectionで設定した各セクションのrows分だけindexPath.rowがループする
   
    
    
    if (_appDelegate.iPath == 0) {

        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = [_myary[0] objectForKey:@"name"][indexPath];
                break;
            case 1:
                cell.textLabel.text = [_myary[1] objectForKey:@"name"][indexPath];
                break;
            case 2:
                cell.textLabel.text = [_myary[2] objectForKey:@"name"][indexPath];
                break;
            case 3:
                cell.textLabel.text = [_myary[3] objectForKey:@"name"][indexPath];
                break;
            case 4:
                cell.textLabel.text = [_myary[4] objectForKey:@"name"][indexPath];
                break;
            case 5:
                cell.textLabel.text = [_myary[5] objectForKey:@"name"][indexPath];
                break;
            default:
                break;
        }
        
        } else if (_appDelegate.iPath == 1){
            cell.textLabel.text = [_allAry[1] objectForKey:@"name"][indexPath];
    }

    return cell;
    }



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"セルがタップされた");
    NSLog(@"indexPath.row =%d",(int)indexPath.row);
    
    if (_appDelegate.iPath == 0) {
        
        switch (indexPath.section) {
            case 0:
               _appDelegate.secondList = _myary[0][indexPath.row];
                break;
            case 1:
              _appDelegate.secondList = _myary[1][indexPath.row];
                break;
            case 2:
             _appDelegate.secondList = _myary[2][indexPath.row];
                break;
            case 3:
            _appDelegate.secondList = _myary[3][indexPath.row];
                break;
            case 4:
            _appDelegate.secondList = _myary[4][indexPath.row];
                break;
            case 5:
            _appDelegate.secondList =_myary[5][indexPath.row];
                break;
            default:
                break;
        
        }
    } else if (_appDelegate.iPath == 1){
        
         _appDelegate.secondList = _allAry[1][indexPath.row];
    }

    
    NSLog(@"appDelegate.list = %@",_appDelegate.secondList);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
