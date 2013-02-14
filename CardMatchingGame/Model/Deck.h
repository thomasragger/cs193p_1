//
//  Deck.h
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/13/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *) card atTop:(BOOL) atTop;
- (Card *)drawRandomCard;
- (void)reset;
@end
