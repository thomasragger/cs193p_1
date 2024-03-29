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
    @property(nonatomic) NSUInteger minMatchCount;
    @property(nonatomic) int score;
@end

@implementation CardMatchingGame

#define MATCH_BONUS 4
#define FLIP_COST 1
#define MISMATCH_PENALTY 2

- (NSMutableArray*) cards{
    if(!_cards)_cards=[[NSMutableArray alloc]init];
    return _cards;
}


-(NSString*)flipCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *checkForMatch=[[NSMutableArray alloc] init];
    NSString *resultCopy=@"";
    
    //if card is active
    if(!card.isUnplayable){
        //if card is now being flipped over, check for matches, else just move on
        if(!card.isFaceUp){
            
            //check all cards
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    //if any other card is faceup, check for match
                    //check for minimum cards we want to have flipped over befor doing anything
                    [checkForMatch addObject:otherCard];
                    
                    //-1 accounts for my current card
                    if(checkForMatch.count==self.minMatchCount-1){
                        //we are ready to check our matches
                        int matchScore = [card match:checkForMatch];
                        int finalScore=matchScore*MATCH_BONUS;
                        
                        if(matchScore){
                            for (Card* match in checkForMatch) {
                                match.unPlayable=YES;
                            }
                            
                            resultCopy=[NSString stringWithFormat:@"Matched %@ & %@ for %d points",card.contents, [[checkForMatch valueForKey:@"contents"] componentsJoinedByString:@"&"], finalScore];
                            
                            card.unPlayable=YES;
                            self.score+=finalScore;
                            
                        }else{
                            for (Card* match in checkForMatch) {
                                match.faceUp=NO;
                            }
 
                            self.score-=MISMATCH_PENALTY*checkForMatch.count;
                            
                            resultCopy=[NSString stringWithFormat:@"%@&%@ don't match! Penalty: %d!",card.contents, [[checkForMatch valueForKey:@"contents"] componentsJoinedByString:@"&"], MISMATCH_PENALTY];
                        }
                        break;
                    }
                }else{
                    resultCopy=[NSString stringWithFormat:@"Flipped up %@!",card.contents];
                }
            }
            self.score-=FLIP_COST;
        }
        //end checking for matches
        card.faceUp=!card.isFaceUp;
    }
    
    return resultCopy;
}

@end
