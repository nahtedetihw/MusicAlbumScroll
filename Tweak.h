#import <Cephei/HBPreferences.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>

@interface UICollectionView (Private)
@property (nonatomic, retain) UICollectionViewLayout * UICollectionViewLayout;
@end

@interface UIImageView (Private)
@end

@interface UIView (FindUIViewController)
@property (nonatomic, assign, getter=isPlaying) BOOL playing;
- (UIViewController *) firstAvailableViewController;
- (id) traverseResponderChainForViewController;
@end

@interface UIButton (Private)
@property (nonatomic, assign, getter=isPlaying) BOOL playing;
@end

@interface UIScrollView (Private)
@end

@interface UICollectionViewCell (Private)
@end

@interface CALayer (Private)
@property (nonatomic, assign) BOOL continuousCorners;
@end

@interface UICollectionViewLayout (Private)
@property (nonatomic,assign) NSInteger scrollDirection;
@property (nonatomic, assign) BOOL _headerFollowsSectionMargins;
@property(nonatomic) UIEdgeInsets sectionInset;
@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGSize itemSize;
@end

@interface _TtCC16MusicApplication9AlbumCell : UICollectionViewCell
@end

@interface _TtCC16MusicApplication27VerticalStackViewController10ScrollView : UIScrollView
@end

@interface SPTNowPlayingPlayButtonV2 : UIButton
@property (nonatomic, assign, getter=isPlaying) BOOL playing;
@property (nonatomic, strong) UIColor *fillColor;
@end

@interface SPTNowPlayingNextTrackButton : UIButton
@property (nonatomic, strong) UIColor *iconColor;
@end

@interface SPTNowPlayingPreviousTrackButton : UIButton
@property (nonatomic, strong) UIColor *iconColor;
@end

@interface SPTNowPlayingPlayPauseButtonViewController : UIViewController
-(void)updatePlayPauseButton;
@end
