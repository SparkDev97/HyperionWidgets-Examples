#import "ExampleHyperionWidget.h"

@interface ExampleHyperionWidget()
{
    UILabel* timeLabel;
    UILabel* musicLabel;
    UIImageView* artworkImageView;
}
@end

@implementation ExampleHyperionWidget
    -(void)setup
    {
        self.contentView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 300, 100)];
        self.contentView.backgroundColor = [UIColor darkGrayColor];
        self.contentView.layer.cornerRadius = 10.0f;

        timeLabel = [[UILabel alloc] initWithFrame: CGRectMake(self.contentView.frame.size.width - 10 - 60, 10, 60, 20)];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview: timeLabel];

        artworkImageView = [[UIImageView alloc] initWithFrame: CGRectMake(15, 0, 70, 70)];
        artworkImageView.center = CGPointMake(artworkImageView.center.x, self.contentView.center.y);
        artworkImageView.backgroundColor = [UIColor whiteColor];
        artworkImageView.layer.cornerRadius = 5.0f;
        artworkImageView.clipsToBounds = TRUE;
        [self.contentView addSubview: artworkImageView];

        musicLabel = [[UILabel alloc] initWithFrame: CGRectMake(artworkImageView.frame.size.width + 25, 0, 
                                                                self.contentView.frame.size.width - 25 - artworkImageView.frame.size.width, 
                                                                self.contentView.frame.size.height)];
        musicLabel.textAlignment = NSTextAlignmentLeft;
        musicLabel.textColor = [UIColor whiteColor];
        musicLabel.numberOfLines = 0;
        [self.contentView addSubview: musicLabel];

    }

    -(void)updateTime:(NSDate*)time
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"hh:mm a";
        NSString *timeStr = [dateFormatter stringFromDate:time];

        [timeLabel setText: timeStr];
    }

    -(void)updateMusic:(NSDictionary*)info
    {
        BOOL isPlaying      = [[info objectForKey: @"IsPlaying"] boolValue];

        if(!isPlaying)
        {
            [musicLabel setHidden: TRUE];
            [artworkImageView setHidden: TRUE];
            return;
        }

        NSDictionary* metadata = [info objectForKey:@"Information"];

        NSString *title     = [metadata objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"];//[[NSString alloc] initWithString:[info objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"]];
        NSString *artist    = [metadata objectForKey:@"kMRMediaRemoteNowPlayingInfoArtist"];
        NSString *album     = [metadata objectForKey:@"kMRMediaRemoteNowPlayingInfoAlbum"];
        NSData* artworkData = [metadata objectForKey:@"kMRMediaRemoteNowPlayingInfoArtworkData"];
        UIImage* artwork    = [UIImage imageWithData:artworkData];

        [musicLabel setText: [NSString stringWithFormat:@"%@\n%@\n%@", title, artist, album]];
        [artworkImageView setImage: artwork];
        
        [musicLabel setHidden: FALSE];
        [artworkImageView setHidden: FALSE];
    }

    -(void)layoutForPreview
    {
        [musicLabel setHidden: FALSE];
        [artworkImageView setHidden: FALSE];
    }
@end