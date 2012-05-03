//
//  FBFImageModel.m
//  FourByFour
//
//  This class is Model part of MVC pattern.
//  This class keeps one whole image and distributes part images to tiles
//

#import "FBFConstants.h"
#import "FBFImageModel.h"

@implementation FBFImageModel

-(id)initWithImageName:(NSString*)name withRect:(CGRect)rect
{
    _image = [[UIImage imageNamed:name] retain];
    
    _width = rect.size.width;
    _height = rect.size.height;
    
    return self;
}

- (void)dealloc
{
    [_image release];
    [super dealloc];
}

// get part of image, x:0,1,2 or 3      y:0,1,2 or 3 
-(UIImage*)getPartImageWithX:(int)x Y:(int)y
{
    int tileSize = _width/kColumns;
    CGRect rect = CGRectMake(x*tileSize, y*tileSize, tileSize, tileSize);
    CGImageRef imageRef = CGImageCreateWithImageInRect([_image CGImage], rect);
    UIImage *ret = [UIImage imageWithCGImage:imageRef];
    return ret;
}

@end
