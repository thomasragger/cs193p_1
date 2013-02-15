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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeModeControl;
@property (strong,nonatomic) CardMatchingGame *game;
@end

@implementation CardMatchingViewController

-(void)setFlipCount:(int)flipCount{
    _flipCount=flipCount;
    self.flipsLabel.text=[NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

-(CardMatchingGame *)game{
    if(!_game)_game=[[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

-(void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons=cardButtons;
    [self updateUI];
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
        cardButton.clipsToBounds=YES;
        if(!cardButton.selected ){[cardButton setBackgroundImage:cardBackImage forState:UIControlStateNormal];
        }else{
            [cardButton setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}

- (IBAction)dealCards:(UIButton *)sender {
    self.flipCount=0;
    self.resultsLabel.text=@"";
    self.changeModeControl.enabled=true;
    [self.game reset];
    [self updateUI];
}

- (IBAction)changeMode:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.game.minMatchCount=2;
        break;
        case 1:
            self.game.minMatchCount=3;
        break;
        default:
        break;
    }
    
}

- (IBAction)flipCard:(UIButton *)sender {
    self.changeModeControl.enabled=false;
    self.resultsLabel.text=[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

@end
