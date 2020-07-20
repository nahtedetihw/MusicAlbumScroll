#import "Tweak.h"

BOOL enabled;
HBPreferences *preferences;
static double horizontalSpacing;
static double verticalSpacing;
BOOL enableRoundedArtwork;

%hook UICollectionView

-(void)layoutSubviews {
    if (enabled) {
    %orig;

    UICollectionView *collectionview = (UICollectionView *)self;
    if([NSStringFromClass([((UICollectionView *)self).dataSource class]) isEqualToString:@"MusicApplication.LibraryRecentlyAddedViewController"]) {
    %orig;
    collectionview.collectionViewLayout.scrollDirection = 1;
    collectionview.collectionViewLayout.sectionInset = UIEdgeInsetsMake(0,-330,0,0);
    collectionview.collectionViewLayout.minimumLineSpacing = horizontalSpacing;
    collectionview.collectionViewLayout.minimumInteritemSpacing = verticalSpacing;
    collectionview.backgroundColor = [UIColor clearColor];
    collectionview.clipsToBounds = NO;
    UICollectionViewCell *cell = nil;
    [cell layoutIfNeeded];
    [cell layoutSubviews];
}
}
%orig;
}

%end

%hook _UIFlowLayoutInfo

- (BOOL)usesFloatingHeaderFooter {
if (enabled) {
    return YES;
}
return %orig;
}

%end

%hook UICollectionViewData

- (BOOL)isLayoutLocked {
if (enabled) {
    return YES;
}
return %orig;
}

%end

%hook MusicRecentlyAdded

- (void)layoutSubviews {
if (enabled) {
    UIView *titleview = (UIView *)self;
    if([NSStringFromClass([((UIView *)self) class]) isEqualToString:@"MusicApplication.TitleSectionHeaderView"]) {
    titleview.hidden = YES;
}
}
%orig;
}

%end

%hook UIImageView

-(void)layoutSubviews {
if (enabled && enableRoundedArtwork) {
%orig;

UIImageView *artworkview = (UIImageView *)self;
if([NSStringFromClass([((UIImageView *)self) class]) isEqualToString:@"MusicApplication.ArtworkComponentImageView"]) {
CALayer *mask = [CALayer layer];
mask.contents = (id)[[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/musicalbumscrollprefs.bundle/mask.png"] CGImage];
mask.frame = CGRectMake(0, 0, artworkview.frame.size.width, artworkview.frame.size.height);
artworkview.layer.mask = mask;
artworkview.layer.masksToBounds = YES;
}
}
%orig;
}
%end


%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.musicalbumscrollprefs"];
    [preferences registerBool:&enabled default:NO forKey:@"enabled"];
    [preferences registerDouble:&horizontalSpacing default:10 forKey:@"horizontalSpacing"];
    [preferences registerDouble:&verticalSpacing default:12 forKey:@"verticalSpacing"];
    [preferences registerBool:&enableRoundedArtwork default:NO forKey:@"enableRoundedArtwork"];
    %init(MusicRecentlyAdded = objc_getClass("MusicApplication.TitleSectionHeaderView"));

}
