# ParticlesDemo
---
![icon](http://git.oschina.net/uploads/85/122285_ClassWizard.jpg)
##Overview
A Demo for CAEmitterLayer and CAEmitterCell

一个关于CAEmitterLayer和CAEmitterCell的Demo

##Usage
---


```
#import "LWWeatherBackgroundView.h"

```
```
//1.init the LWWeatherBackgroundView

	self.weatherBackgroundView = [[LWWeatherBackgroundView alloc] initWithFrame:self.view.bounds];
    //Or you can set the frame later
//    self.weatherBackgroundView = [[LWWeatherBackgroundView alloc] init];
//    self.weatherBackgroundView.frame = CGRectMake(0, 20, self.view.bounds.size.width, 500);
    
//2.set/change the weatherModel

    [self.weatherBackgroundView setWeatherCellModel:WeatherCellModeRain];
    [self.view addSubview:self.weatherBackgroundView];
    
//3.send the LWWeatherBackgroundView to back 

    [self.view sendSubviewToBack:self.weatherBackgroundView];
```