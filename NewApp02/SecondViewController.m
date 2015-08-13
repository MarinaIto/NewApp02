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
//    NSArray *_allAry;
//    NSArray *_myary;
//    NSDictionary *_japan;
//    NSDictionary *_germany;
//    NSDictionary *_italy;
//    NSDictionary *_unitedKigdom;
//    NSDictionary *_unitedStatue;
//    NSDictionary *_others;
    
    NSDictionary *_testDict;
    NSDictionary *_carsDict;
    NSMutableArray *_carsKeyAry;
    NSArray *_nCarsAry;
    NSDictionary  *_nCarsDict;
    NSDictionary *_watchDict;
    NSArray *_watchKeyAry;
    
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
    //NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    NSString *testPath = [bundle pathForResource:@"test" ofType:@"plist"];

    //プロパティリストの中身データを取得
    //_allAry = [NSArray arrayWithContentsOfFile:path];
    _testDict = [NSDictionary dictionaryWithContentsOfFile:testPath];
    NSLog(@"_textDict = %@", _testDict);
    
    _carsDict = _testDict[@"自動車"];
    //NSLog(@"carsDict = %@", _carsDict);
    
    
    
    NSArray *carsKeyAryFake =[_carsDict allKeys];
    NSLog(@"fake =%@", carsKeyAryFake);
    
    _carsKeyAry =[carsKeyAryFake mutableCopy];
    
    //_carsKeyAry = [NSMutableArray arrayWithArray:carsKeyAryFake];
    
//    _carsKeyAry = carsKeyAryFake[4];
//    NSLog(@"carsKeyAry =%@", _carsKeyAry);
    
    [_carsKeyAry exchangeObjectAtIndex:0
                 withObjectAtIndex:4];
    [_carsKeyAry exchangeObjectAtIndex:1
                     withObjectAtIndex:5];
    [_carsKeyAry exchangeObjectAtIndex:1
                     withObjectAtIndex:4];

    
//    _carsKeyAry = [_carsKeyAry arrayByAddingObject:carsKeyAryFake[3]];
//    _carsKeyAry = [_carsKeyAry arrayByAddingObject:carsKeyAryFake[0]];
//    _carsKeyAry = [_carsKeyAry arrayByAddingObject:carsKeyAryFake[5]];
//    _carsKeyAry = [_carsKeyAry arrayByAddingObject:carsKeyAryFake[2]];
//    _carsKeyAry = [_carsKeyAry arrayByAddingObject:carsKeyAryFake[1]];
    
    NSLog(@"carKeyAry =%@", _carsKeyAry);
    
    // 配列の中身(日本語文字)を見るコツ
    //for (int i  = 0; i < _carsKeyAry.count; i++) {
     //   NSLog(@"carsKeyAry : %i = %@",i,_carsKeyAry[i]);
    //}
    
  
    
    NSDictionary *nCarsDcit0 = _carsDict[_carsKeyAry[0]];
    NSLog(@"nCarsDict = %@",nCarsDcit0);
    
    NSDictionary *nCarsDcit1 = _carsDict[_carsKeyAry[1]];
    NSLog(@"nCarsDict2 = %@",nCarsDcit1);
    
    NSDictionary *nCarsDcit2 = _carsDict[_carsKeyAry[2]];
    NSLog(@"nCarsDict = %@",nCarsDcit2);
    
    NSDictionary *nCarsDcit3 = _carsDict[_carsKeyAry[3]];
    NSLog(@"nCarsDict = %@",nCarsDcit3);
    
    NSDictionary *nCarsDcit4 = _carsDict[_carsKeyAry[4]];
    NSLog(@"nCarsDict = %@",nCarsDcit4);
    
    NSDictionary *nCarsDcit5 = _carsDict[_carsKeyAry[5]];
    NSLog(@"nCarsDict = %@",nCarsDcit5);

    
    
    //NSArray  *test = _allAry[0];
    // NSLog(@"testの中身　=%@", test);
    //配列の中身を反対にする
    //_myary = [[test reverseObjectEnumerator] allObjects];
    // NSLog(@"反対バージョン =%@", _myary);
    // NSLog(@"韓国 =%@", [_myary[5] objectForKey:@"name"]);
    //NSArray *japan = _myary[0][@"New item"][@"name"];
    // NSLog(@"japanキー =%@", japan);
    
//    NSArray *japanName = japan
//    NSLog(@"japan = %@" ,japanName);
//    _japan = _myary[0];
//    _germany = _myary[1];
//    _italy = _myary[2];
//    _unitedKigdom = _myary[3];
//    _unitedStatue = _myary[4];
//    _others = _myary[5];
//  NSLog(@"japan　=%@" ,japan);
//  NSLog(@"japanキー =%@", [japan objectForKey:@"name"]);
//  NSLog(@"myaryのカウント =%lu", (unsigned long)[_myary count]);
    
        
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // セクション数を設定
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        i = [_carsKeyAry count];
    } else if (_appDelegate.iPath == 1){
        i = 1;
    }

    return i;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 各セクションにおける行数(rows)を設定
    
    
    
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        NSDictionary *newCarsDict = _carsDict[_carsKeyAry[section]];
        NSLog(@"newCarsDict = %@",newCarsDict);
        NSArray *newCarsKeyAry = [newCarsDict allKeys];
        NSLog(@"newCarsKeyAry %@", newCarsKeyAry);
        i = [newCarsKeyAry count];
    } else if (_appDelegate.iPath == 1){
      i = [_testDict[@"時計"] count];
            }
    
     return i;

}
        
//        
//        switch (section) {
//            case 0:
//                i =  (int)[_myary[0] count];
//                break;
//            case 1:
//                i =  (int)[_myary[1] count];
//                break;
//            case 2:
//                i =  (int)[_myary[2] count];
//                break;
//            case 3:
//                i =  (int)[_myary[3] count];
//                break;
//            case 4:
//                i =  (int)[_myary[4] count];
//                break;
//            case 5:
//                i =  (int)[_myary[5] count];
//                break;
//            default:
//                break;
//        }
//        
//    } else if (_appDelegate.iPath == 1){
//        i = [_allAry[1] count];
//    }
//    return i;

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    NSLog(@"carskeyAry = %@",_carsKeyAry);
    NSLog(@"carsKeyAryのsection =%@" ,_carsKeyAry[section]);
    
    
    // 表示しているセクションのタイトルをplistに登録しているものと合致させる

    if (_appDelegate.iPath == 0) {
        title = _carsKeyAry[section];
        
    } else if (_appDelegate.iPath == 1){
        
        title = @"時計ブランド";
        }
    return title;
}
        
        
//      
//        switch (section) {
//            case 0:
//                 title = @"Japan";
//                break;
//            case 1:
//                 title = @"Germany";
//                break;
//            case 2:
//                title = @"Italy";
//                break;
//            case 3:
//                title = @"US";
//                break;
//            case 4:
//                title = @"UK";
//                break;
//            case 5:
//                title = @"others";
//                break;
//            default:
//                break;
//        }
//        
//    } else if (_appDelegate.iPath == 1){
//     title = @"時計ブランド";
//    }
//    return title;
    
   //行に表示するデータを表示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

   
    // numberOfRowsInSectionで設定した各セクションのrows分だけindexPath.rowがループする
    
    if (_appDelegate.iPath == 0) {
        _nCarsDict  = _carsDict[_carsKeyAry[indexPath.section]];
        
        NSLog(@"nCarsDict = %@",_nCarsDict);
        _nCarsAry = [_nCarsDict allKeys];
        NSLog(@"nCarsAry = %@",_nCarsAry);
        NSString *carTitle = _nCarsDict[_nCarsAry[indexPath.row]][@"名前"];
        NSLog(@"cartitle = %@", carTitle);

        cell.textLabel.text = carTitle;
    } else if (_appDelegate.iPath == 1){
        _watchDict =  _testDict[@"時計"];
        NSLog(@"watchDict = %@",_watchDict);
        _watchKeyAry = [_watchDict allKeys];
        NSString　*watchTitle = _watchKeyAry[indexPath.section];
        

        cell.textLabel.text = watchTitle;
    }
    
    return cell;

}

        
//
//        switch (indexPath.section) {
//            case 0:
//                cell.textLabel.text = [_myary[0] objectForKey:@"name"][indexPath];
//                break;
//            case 1:
//                cell.textLabel.text = [_myary[1] objectForKey:@"name"][indexPath];
//                break;
//            case 2:
//                cell.textLabel.text = [_myary[2] objectForKey:@"name"][indexPath];
//                break;
//            case 3:
//                cell.textLabel.text = [_myary[3] objectForKey:@"name"][indexPath];
//                break;
//            case 4:
//                cell.textLabel.text = [_myary[4] objectForKey:@"name"][indexPath];
//                break;
//            case 5:
//                cell.textLabel.text = [_myary[5] objectForKey:@"name"][indexPath];
//                break;
//            default:
//                break;
//        }
//        
//        } else if (_appDelegate.iPath == 1){
//            cell.textLabel.text = [_allAry[1] objectForKey:@"name"][indexPath];
//    }
//
//    return cell;
 


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"セルがタップされた");
    NSLog(@"indexPath.row =%d",_nCarsDict[_nCarsAry[indexPath.row]][@"名前"]);
    
    
    if (_appDelegate.iPath == 0) {
        
        _appDelegate.secondList = _nCarsDict[_nCarsAry[indexPath.row]][@"名前"];
        
    } else if (_appDelegate.iPath == 1){
        
         _appDelegate.secondList = _watchKeyAry[indexPath.section];
    }


    
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
