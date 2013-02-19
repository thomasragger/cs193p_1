//
//  CardMatchingViewController.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/13/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "CardMatchingViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardMatchingViewController ()
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardMatchingViewController

-(void)setCardButtons:(NSArray *)cardButtons{   
    _cardButtons=cardButtons;
    [self updateUI];
}

-(CardMatchingGame *)game{
    if(!_game)_game=[[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init] withMinimumMatchCount:2];
    return _game;
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        cardButton.enabled=!card.isUnplayable;
        cardButton.selected = card.isFaceUp;
        cardButton.alpha=card.isUnplayable ?0.3:1.0;
        
        
        UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];

        if(!cardButton.selected ){[cardButton setBackgroundImage:cardBackImage forState:UIControlStateNormal];
        }else{
            [cardButton setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}

@end
