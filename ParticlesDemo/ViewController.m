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

@property (nonatomic, strong) LWWeatherBackgroundView *weatherBackgroundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.weatherBackgroundView = [[LWWeatherBackgroundView alloc] initWithFrame:self.view.bounds];
    //也可以之后再设置frame
//    self.weatherBackgroundView = [[LWWeatherBackgroundView alloc] init];
//    self.weatherBackgroundView.frame = CGRectMake(0, 20, self.view.bounds.size.width, 500);
    
    [self.weatherBackgroundView setWeatherCellModel:WeatherCellModeRain];
    [self.view addSubview:self.weatherBackgroundView];
    [self.view sendSubviewToBack:self.weatherBackgroundView];
}

- (IBAction)segmentValueDidChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.weatherBackgroundView setWeatherCellModel:WeatherCellModeRain];
            break;
        case 1:
            [self.weatherBackgroundView setWeatherCellModel:WeatherCellModeSnow];
            break;
        default:
            break;
    }
}
@end
