//
//  CardMatchingGame.h
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/14/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "Deck.h"
#import <Foundation/Foundation.h>

@interface CardMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck*)deck;
-(NSString*)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly) int score;
          
@end
