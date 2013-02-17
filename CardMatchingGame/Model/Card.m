//
//  Card.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/13/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score=0;
    
    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    
    return score;
}

-(NSString*)flipCardAtIndex:(NSUInteger)index{
    //abstract class
    return nil;
}

@end
