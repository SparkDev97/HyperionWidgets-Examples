#import "ExampleHyperionWidget.h"

@implementation ExampleHyperionWidget
    -(void)setup
    {
        self.contentView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
        self.contentView.backgroundColor = [UIColor redColor];
    }
@end