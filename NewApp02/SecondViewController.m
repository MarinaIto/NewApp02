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
    AppDelegate *_appDeligate; //初期化
    NSDictionary *_dic;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _secondTableView.dataSource = self;
    _secondTableView.delegate = self;
    _appDeligate = [[UIApplication sharedApplication] delegate];//初期化
    
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    //プロパティリストの中身データを取得
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];


    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // セクション数を設定
    NSInteger i;
    if (_appDeligate.iPath == 0) {
        i = [_dic[@"cars"] count];
        
    } else if (_appDeligate.iPath == 1){
        i = 1;
    }
    NSLog(@"watches = %i" ,[_dic[@"watches"] count]);
    return i;

}



    
    

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 各セクションにおける行数(rows)を設定
    
    NSInteger i;
    if (_appDeligate.iPath == 0) {
        int i = 0;
        switch (section) {
            case 0:
                i =  (int)[_dic[@"cars"][0] count];
                break;
            case 1:
                i =  (int)[_dic[@"cars"][1] count];
                break;
            case 2:
                i =  (int)[_dic[@"cars"][2] count];
                break;
            case 3:
                i =  (int)[_dic[@"cars"][3] count];
                break;
            case 4:
                i =  (int)[_dic[@"cars"][4] count];
                break;
            case 5:
                i =  (int)[_dic[@"cars"][5] count];
            default:
                break;
        }
        
    } else if (_appDeligate.iPath == 1){
        i = [_dic[@"watches"] count];
    }
    return i;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    
    // 表示しているセクションのタイトルをplistに登録しているものと合致させる

    if (_appDeligate.iPath == 0) {
      
        switch (section) {
            case 0:
                 title = @"その他";
                break;
            case 1:
                 title = @"イギリス車";
                break;
            case 2:
                title = @"アメリカ車";
                break;
            case 3:
                title = @"イタリア車";
                break;
            case 4:
                title = @"ドイツ車";
                break;
            case 5:
                title = @"日本車";
            default:
                break;
        }
        
    } else if (_appDeligate.iPath == 1){
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
    if (_appDeligate.iPath == 0) {

        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = _dic[@"cars"][0][indexPath.row];
                break;
            case 1:
                cell.textLabel.text = _dic[@"cars"][1][indexPath.row];
                break;
            case 2:
                cell.textLabel.text = _dic[@"cars"][2][indexPath.row];
                break;
            case 3:
                cell.textLabel.text = _dic[@"cars"][3][indexPath.row];
                break;
            case 4:
                cell.textLabel.text = _dic[@"cars"][4][indexPath.row];
                break;
            case 5:
                cell.textLabel.text = _dic[@"cars"][5][indexPath.row];
                break;
            default:
                break;
        }
        
        } else if (_appDeligate.iPath == 1){
            cell.textLabel.text = _dic[@"watches"][indexPath.row];
    }

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"セルがタップされた");
    
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *CellIdentifier = @"Cell2";
//    //cellForRowAtIndexPathセルの中身を決める
//    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"行=%ld", (long)indexPath.row];
//    //indexPath.section;
//    return cell;
//    
//}


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
