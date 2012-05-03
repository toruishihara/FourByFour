//
//  FBFTileView.m
//  FourByFour
//
//  UIView for each tiles. On 4x4 case, 16 instance will be created.
//  This view keeps pat of image and handle touch event.
//  On tile movement, this view will relocate by itself.
//

#import "FBFTileView.h"
#import "FBFConstants.h"

@implementation FBFTileView

@synthesize image;
@synthesize isBlank;
@synthesize blankTile;

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isBlank = NO;
        _width = frame.size.width;
        _height = frame.size.height;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [image drawAtPoint:CGPointZero];
}

#pragma mark - UIResponder

// On begining of touch, keep touch start point
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
		CGPoint pt = [touch locationInView:self];
        NSLog(@"start x=%f y=%f", pt.x, pt.y);
        _touchStartPos = pt;
		break;
	}
    _startRect = [self frame];
    
    // by positioning relation with blnak tile, find can move direction.
    _canUp = _canDown = _canLeft = _canRight = NO;
    if ([blankTile frame].origin.y == [self frame].origin.y) {
        if ([blankTile frame].origin.x + _width == [self frame].origin.x) {
            _canLeft = YES;
        }
        if ([blankTile frame].origin.x - _width == [self frame].origin.x) {
            _canRight = YES;
        }
    }
    if ([blankTile frame].origin.x == [self frame].origin.x) {
        if ([blankTile frame].origin.y + _height == [self frame].origin.y) {
            _canUp = YES;
        }
        if ([blankTile frame].origin.y - _height == [self frame].origin.y) {
            _canDown = YES;
        }
    }
}

// On touch moving, drag the tile
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = {0,0}; // touch point
    CGRect rect = [self frame]; // new moved position
    
    // pickup one touch event
    for (UITouch *touch in touches){
		pt = [touch locationInView:self];
        NSLog(@"move x=%f y=%f", pt.x, pt.y);
		break;
	}
    
    if (pt.y > _touchStartPos.y && _canDown) {
        rect.origin.y = _startRect.origin.y - _touchStartPos.y + pt.y;
        [self setFrame:rect];
    }
    if (pt.y < _touchStartPos.y && _canUp) {
        rect.origin.y = _startRect.origin.y - _touchStartPos.y + pt.y;
        [self setFrame:rect];
    }
    if (pt.x < _touchStartPos.x && _canLeft) {
        rect.origin.x = _startRect.origin.x - _touchStartPos.x + pt.x;
        [self setFrame:rect];
    }
    if (pt.x > _touchStartPos.x && _canRight) {
        rect.origin.x = _startRect.origin.x - _touchStartPos.x + pt.x;
        [self setFrame:rect];
    }
}

// On touch end, decide to swap tiles by threshold
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGRect rect = [self frame];
    CGPoint pt = {0,0};
    BOOL    moved = NO;
    int threshold = kMoveThreshold*_width;
    
    for (UITouch *touch in touches){
		pt = [touch locationInView:self];
        NSLog(@"end x=%f y=%f", pt.x, pt.y);
		break;
	}
    
    if ((pt.y - _touchStartPos.y) > threshold && _canDown) {
        rect.origin.y = _startRect.origin.y + _height;
        moved = YES;
    }
    if ((pt.y - _touchStartPos.y) < -1*threshold && _canUp) {
        rect.origin.y = _startRect.origin.y - _height;
        moved = YES;
    }
    if ((pt.x - _touchStartPos.x) < -1*threshold && _canLeft) {
        rect.origin.x = _startRect.origin.x - _width;
        moved = YES;
    }
    if ((pt.x - _touchStartPos.x) > threshold && _canRight) {
        rect.origin.x = _startRect.origin.x + _width;
        moved = YES;
    }
    if (moved) {
        // swap with blank tile
        [self setFrame:rect];
        [blankTile setFrame:_startRect];
    } else {
        // back to start position
        [self setFrame:_startRect];
    }
}
@end
