//
//  PlayingCard.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/13/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards{
    int score=0;
    BOOL mismatch=NO;
    
    for (PlayingCard* otherCard in otherCards) {
        if([otherCard.suit isEqualToString:self.suit]){
            score+=1;
        }else if(otherCard.rank==self.rank){
            score+=4;
        }else{
            mismatch=YES;
        }
    }
    
    if(mismatch)score=0;
    
    return score;
}

- (NSString *) contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;

+ (NSArray *)validSuits{
    static NSArray *validSuits = nil;
    if(!validSuits)validSuits=@[@"♥",@"♦",@"♠",@"♣"];
    return validSuits;
}

- (void) setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit :@"?";
}

+ (NSArray*)rankStrings{
    static NSArray *rankStrings = nil;
    if(!rankStrings)rankStrings=@[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return rankStrings;
}

+ (NSUInteger)maxRank{
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank=rank;
    }
}

@end

