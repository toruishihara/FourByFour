//
//  FBFViewController.m
//  FourByFour
//
//  This controller keeps model instance and tiles instances
//

#import "FBFConstants.h"
#import "FBFViewController.h"

@interface FBFViewController ()

@end

@implementation FBFViewController

@synthesize puzzleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _model = [[FBFImageModel alloc]initWithImageName:kImageName withRect:[puzzleView bounds]];

    // size of one tile.
    int tileSize = [puzzleView bounds].size.width/kColumns;
    
    // last index of tiles. Became the blank tile
    int lastIdx = kColumns*kColumns-1; 
    
    // create 16 tiles on 4x4 case 
    for (int i = lastIdx; i >= 0; --i) {
        CGRect rect = CGRectMake((int)(i%kColumns)*tileSize, (int)(i/kColumns)*tileSize, tileSize, tileSize);
        _tiles[i] = [[FBFTileView alloc]initWithFrame:rect];
        
        // last piece is white
        if (i == lastIdx) {
            // blank tile
            [_tiles[i] setIsBlank:YES];
            [_tiles[i] setBackgroundColor:[UIColor clearColor]];
        } else {
            // regular image tile
            [_tiles[i] setImage:[_model getPartImageWithX:i%kColumns Y:i/kColumns]];
            [_tiles[i] setBlankTile:_tiles[lastIdx]];
        }
        [puzzleView addSubview:_tiles[i]];
    }
    // push the blank tile on most back
    [puzzleView sendSubviewToBack:_tiles[lastIdx]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_model release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
