//
//  ThirdViewController.m
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController (){
AppDelegate *_appDelegate;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDelegate = [[UIApplication sharedApplication]delegate];
    
    //self.title = _appDelegate.secondList;
    NSLog(@"%@",_appDelegate.secondList);
    
    //self.logoImage.image = [UIImage imageNamed:_appDelegate.secondListImage];
    

    
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
