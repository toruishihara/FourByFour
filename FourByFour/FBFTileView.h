//
//  FBFTileView.h
//  FourByFour
//
//  UIView for each tiles. On 4x4 case, 16 instance will be created.
//  This view keeps pat of image and handle touch event.
//  On tile movement, this view will relocate by itself.
//

#import <UIKit/UIKit.h>

@interface FBFTileView : UIView {
    CGPoint _touchStartPos;                     // touch start position
    CGRect  _startRect;                         // original position
    BOOL    _canUp,_canDown,_canLeft,_canRight; // can move direction
    int     _width, _height;                    // keep for easy calculation
};

@property (strong, nonatomic) UIImage *image;   // part of image 
@property (nonatomic) Boolean isBlank;          // blank or not
@property (strong, nonatomic) FBFTileView *blankTile;   // ref of blank tile

@end
