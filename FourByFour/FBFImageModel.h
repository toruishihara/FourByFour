//
//  FBFImageModel.h
//  FourByFour
//
//  This class is Model part of MVC pattern.
//  This class keeps one whole image and distributes part images to tiles
//

#import <UIKit/UIKit.h>

@interface FBFImageModel : NSObject{
    UIImage* _image;            // Whole image
    int     _width, _height;    // for easy calculation
}

-(id)initWithImageName:(NSString*)name withRect:(CGRect)rect;  // name : resource file name

// get part of image, x:0,1,2 or 3      y:0,1,2 or 3 
-(UIImage*)getPartImageWithX:(int)x Y:(int)y;

@end
