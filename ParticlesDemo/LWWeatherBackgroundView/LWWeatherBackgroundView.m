//
//  LWWeatherBackgroundView.m
//  ParticlesDemo
//
//  Created by ClassWizard on 16/3/4.
//  Copyright © 2016年 ClassWizard. All rights reserved.
//

#import "LWWeatherBackgroundView.h"

@interface LWWeatherBackgroundView ()

@property (nonatomic, strong) CAEmitterLayer *rainEmitterLayer;
@property (nonatomic, strong) CAEmitterLayer *snowEmitterLayer;
@property (nonatomic, strong) CAEmitterCell  *snowCell;
@property (nonatomic, strong) CAEmitterCell  *rainCell;

@end

@implementation LWWeatherBackgroundView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setWeatherCellModel:(WeatherCellMode)weatherCellModel {
    _weatherCellModel = weatherCellModel;
    switch (_weatherCellModel) {
        case WeatherCellModeSnow: {
            [_rainEmitterLayer removeFromSuperlayer];
            [self.layer addSublayer:self.snowEmitterLayer];
        }
            break;
        case WeatherCellModeRain: {
            [_snowEmitterLayer removeFromSuperlayer];
            [self.layer addSublayer:self.rainEmitterLayer];
        }
            break;
        default:
            break;
    }
}

#pragma mark - lazy load
- (CAEmitterCell *)snowCell {
    if (!_snowCell) {
        _snowCell = [CAEmitterCell emitterCell];
        _snowCell.scale = 0.1;//粒子缩放
        _snowCell.scaleRange = 0.05;//粒子缩放范围
        _snowCell.birthRate = 5.f;//粒子生成率
        _snowCell.lifetime = 30.f;//粒子生命周期
        _snowCell.velocity = -15;//粒子初速度
        _snowCell.spin = 0.1f;//粒子自旋转速率
        _snowCell.yAcceleration = 1.f;//粒子y轴方向加速度
        _snowCell.emissionRange =  M_PI / 8;//发射角度范围
        _snowCell.color = [UIColor whiteColor].CGColor;//粒子颜色
        _snowCell.contents = (id)[self imagesNamedFromCustomBundle:@"ic_snow"].CGImage;//粒子图片
    }
    return _snowCell;
}

- (CAEmitterCell *)rainCell {
    if (!_rainCell) {
        _rainCell = [CAEmitterCell emitterCell];
        
        _rainCell.scale = 0.1;//粒子缩放
        _rainCell.scaleRange = 0.1;//粒子缩放范围
        _rainCell.birthRate = 50.f;//粒子生成率
        _rainCell.lifetime = 8.f;//粒子生命周期
        _rainCell.velocity = 100;//粒子初速度
        _rainCell.velocityRange = 10;
        _rainCell.emissionLongitude = M_PI_2;//速度方向 x-y
        //    _rainCell.emissionLatitude = M_PI_4;//速度方向 x-y-z
        _rainCell.spin = 0;//粒子自旋转速率
        _rainCell.yAcceleration = 4.f;//粒子y轴方向加速度
        _rainCell.emissionRange = 0;//发射角度范围
        //    _rainCell.color = [UIColor whiteColor].CGColor;//粒子颜色
        _rainCell.contents = (id)[self imagesNamedFromCustomBundle:@"ic_rain"].CGImage;//粒子图片
    }
    return _rainCell;
}

- (CAEmitterLayer *)rainEmitterLayer {
    if (!_rainEmitterLayer) {
        //粒子发射器
        _rainEmitterLayer = [CAEmitterLayer layer];
        _rainEmitterLayer.emitterSize = CGSizeMake(self.bounds.size.width, 0);//发射器大小
        _rainEmitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2, -20);//发射点
        _rainEmitterLayer.emitterMode = kCAEmitterLayerVolume;//发射模式(从发射器的哪里发射):点、轮廓、表面、体积
        _rainEmitterLayer.emitterShape = kCAEmitterLayerCuboid;//发射器形状:点、线、方形、立方体、园、球体
        //根据发射器形状确定一下参数是否必要：（点、大小、Z轴点、深度）
        _rainEmitterLayer.emitterDepth = 40.f;
        _rainEmitterLayer.emitterZPosition = 0;

        //粒子单元
        _rainEmitterLayer.emitterCells = @[self.rainCell];
    }
    return _rainEmitterLayer;
}

- (CAEmitterLayer *)snowEmitterLayer {
    if (!_snowEmitterLayer) {
        //粒子发射器
        _snowEmitterLayer = [CAEmitterLayer layer];
        _snowEmitterLayer.emitterSize = CGSizeMake(self.bounds.size.width, 0);//发射器大小
        _snowEmitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2, -20);//发射点
        _snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;//发射模式
        _snowEmitterLayer.emitterShape = kCAEmitterLayerLine;//发射器形状
        
        //粒子单元
        _snowEmitterLayer.emitterCells = @[self.snowCell];
    }
    return _snowEmitterLayer;
}

#pragma mark - tool
- (UIImage *)imagesNamedFromCustomBundle:(NSString *)name {
    NSString *main_images_dir_path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"weatherImg.bundle"];
    NSString *image_path = [main_images_dir_path stringByAppendingPathComponent:name];
    return [UIImage imageWithContentsOfFile:image_path];
}
@end
