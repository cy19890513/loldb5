//
//  Cell2.m
//  CollectionView
//
//  Created by Yang Chen on 5/19/15.
//
//

#import "Cell2.h"
#import "CustomCellBackground.h"

@implementation Cell2



- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
    }
    return self;
}

@end
