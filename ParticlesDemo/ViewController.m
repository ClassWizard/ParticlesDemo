//
//  ViewController.m
//  ParticlesDemo
//
//  Created by ClassWizard on 16/3/4.
//  Copyright © 2016年 ClassWizard. All rights reserved.
//

#import "ViewController.h"
#import "LWWeatherBackgroundView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    LWWeatherBackgroundView *weatherBackgroundView = [[LWWeatherBackgroundView alloc] initWithFrame:self.view.bounds];
    [weatherBackgroundView setWeatherCellModel:WeatherCellModeRain];
    [self.view addSubview:weatherBackgroundView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
