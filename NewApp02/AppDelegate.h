//
//  AppDelegate.h
//  NewApp02
//
//  Created by Marina Ito on 2015/08/08.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    int iPath;
    NSString *list;
    
}

@property(nonatomic,strong) NSString *list;

@property(nonatomic,assign) int iPath;

@property (strong, nonatomic) UIWindow *window;



@end

