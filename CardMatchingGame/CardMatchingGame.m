//
//  CardMatchingGame.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/14/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(strong,nonatomic) NSMutableArray *cards;
@property(nonatomic) int score;
@property(nonatomic) Deck* deck;
@property(nonatomic) NSUInteger cardCount;
@end

@implementation CardMatchingGame

- (NSMutableArray*) cards{
    if(!_cards)_cards=[[NSMutableArray alloc]init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        self.deck=deck;
        self.cardCount=cardCount;
        if(![self reset])self=nil;
    }
    
    return self;
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

#define MATCH_BONUS 4
#define FLIP_COST 1
#define MISMATCH_PENALTY 2

-(NSString*)flipCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    NSString *resultCopy=@"";
    
    if(!card.isUnplayable){
        if(!card.isFaceUp){
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    int matchScore = [card match:@[otherCard]];
                    int finalScore=matchScore*MATCH_BONUS;
                    if(matchScore){
                        otherCard.unPlayable=YES;
                        card.unPlayable=YES;
                        self.score+=finalScore;
                        resultCopy=[NSString stringWithFormat:@"Matched %@ & %@ for %d points",card.contents, otherCard.contents, finalScore];
                    }else{
                        otherCard.faceUp=NO;
                        self.score-=MISMATCH_PENALTY;
                        resultCopy=[NSString stringWithFormat:@"%@ & %@ don't match! Penalty: %d!",card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    break;
                }else{
                    resultCopy=[NSString stringWithFormat:@"Flipped up %@!",card.contents];
                }
            }
            self.score-=FLIP_COST;
        }
        card.faceUp=!card.isFaceUp;

    }
    
    return resultCopy;
}

@end
