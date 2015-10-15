//
//  ViewController.m
//  IWeather
//
//  Created by Hoang Ngoc Tung on 22/09/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *oC;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    float f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    
    
    
    
    
}




- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoFileIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoFileIndex]];
    
    f = [self getTemperature];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", f];
    
    [self.temperature setTitle:string forState:UIControlStateNormal];
}
    
- (float) getTemperature {
    return 16 + arc4random_uniform(15) + (float)arc4random() / INT32_MAX;
}

- (IBAction)oCoF:(id)sender {
    if ([self.oC.text isEqualToString:@"C"])
    {
        self.oC.text = @"F";
        float y = [self changleTemperatureF];
        NSString* string2 =[NSString stringWithFormat:@"%2.1f", y];
        [self.temperature setTitle:string2 forState:UIControlStateNormal];
    }
    
    else
    {
        self.oC.text = @"C";
        NSString* string3 = [NSString stringWithFormat:@"%2.1f", f];
        
        [self.temperature setTitle:string3 forState:UIControlStateNormal];
        
    }
    
    // Change temperature value
    
    
    

}

- (float) changleTemperatureF {
    float x = f * 1.8 + 32;
    return x;
}




@end
