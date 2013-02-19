//
//  SetCardDeck.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init
{
    self = [super init];
    
    if(self){
        [self reset];
    }
    
    return self;
}

- (void)reset{
    [super reset];
    for (UIColor* color in [SetCard validColors]) {
        for (NSString* shading in [SetCard validShadings]) {
            for (NSString* symbol in [SetCard validSymbols]) {
                for (NSUInteger count=1; count<=[SetCard maxVariationCount]; count++) {
                    SetCard *card =[[SetCard alloc] init];
                    card.color=color;
                    card.shading=shading;
                    card.symbol=symbol;
                    card.count=count;
                                        
                    [self addCard:card atTop:YES];
                }
            }
        }
    }
}

@end
