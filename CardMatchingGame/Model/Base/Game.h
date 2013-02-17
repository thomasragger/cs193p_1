//
//  Game.h
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface Game : NSObject
-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck*)deck;
-(NSString*)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(BOOL)reset;

@property(nonatomic,readonly) int score;
@property(nonatomic) NSUInteger minMatchCount;

@end


