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

extern const int RESULT_MATCH;
extern const int RESULT_MISMATCH;
extern const int RESULT_FLIP;

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck*)deck;
-(NSString*)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(BOOL)reset;

@property(nonatomic,readonly) int score;
@property(nonatomic) NSUInteger minMatchCount;

@end
