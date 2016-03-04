//
//  LWWeatherBackgroundView.h
//  ParticlesDemo
//
//  Created by ClassWizard on 16/3/4.
//  Copyright © 2016年 ClassWizard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WeatherCellMode) {
    WeatherCellModeSnow,
    WeatherCellModeRain
};

@interface LWWeatherBackgroundView : UIView

@property (nonatomic, assign) WeatherCellMode weatherCellModel;

@end
