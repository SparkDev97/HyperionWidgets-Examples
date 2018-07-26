@protocol HyperionWidget <NSObject>

@required
-(void)setup;
-(UIView*)contentView;

@optional
-(void)updateTime:(NSDate*)time;
-(void)updateWeather:(NSDictionary*)info;
-(void)updateMusic:(NSDictionary*)info;
-(void)updateBattery:(NSDictionary*)info;
-(void)didAppear;
-(void)didHide;

@end