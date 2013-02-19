//
//  SetGameViewController.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "SetGameViewController.h"
#import "CardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetGameViewController ()
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetGameViewController

-(void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons=cardButtons;
    [self updateUI];
}


-(CardMatchingGame *)game{
    if(!_game)_game=[[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetCardDeck alloc] init] withMinimumMatchCount:3];
    return _game;
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateNormal];
        cardButton.enabled=!card.isUnplayable;
        cardButton.selected = card.isFaceUp;
        cardButton.alpha=card.isUnplayable ?0.3:1.0;
       
        if(!cardButton.selected ){
            cardButton.alpha=.5;
        }else{
            cardButton.alpha=1;
        }
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}


@end
