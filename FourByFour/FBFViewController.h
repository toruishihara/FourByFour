//
//  FBFViewController.h
//  FourByFour
//
//  This controller keeps model instance and tiles instances
//

#import <UIKit/UIKit.h>
#import "FBFConstants.h"
#import "FBFTileView.h"
#import "FBFImageModel.h"

@interface FBFViewController : UIViewController{
    IBOutlet UIView *puzzleView;  // one view which has 16 tileView.

    FBFTileView  *_tiles[kColumns*kColumns];
    FBFImageModel *_model;
}
@property (nonatomic, retain) UIView *puzzleView;

@end