//
//  Game.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "Game.h"

@interface Game()
@property(nonatomic) NSUInteger cardCount;
@property(nonatomic) Deck* deck;
@property(strong,nonatomic) NSMutableArray *cards;
@property(nonatomic) int score;
@end


@implementation Game

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        self.deck=deck;
        self.cardCount=cardCount;
        if(![self reset])self=nil;
    }
    
    return self;
}

- (NSMutableArray*) cards{
    if(!_cards)_cards=[[NSMutableArray alloc]init];
    return _cards;
}


- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

- (BOOL)reset{
    BOOL success=YES;
    [self.deck reset];
    self.score=0;
    
    for (int i=0; i<self.cardCount; i++) {
        Card *card = [self.deck drawRandomCard];
        if(!card){
            success=NO;
        }else{
            self.cards[i] = card;
        }
    }
    
    return success;
}

- (NSUInteger)minMatchCount{
    if(!_minMatchCount)_minMatchCount=2;
    return _minMatchCount;
}

-(NSString*)flipCardAtIndex:(NSUInteger)index{
    //abstract
    return nil;
}


@end
