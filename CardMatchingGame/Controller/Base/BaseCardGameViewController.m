//
//  BaseCardGameViewController.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "BaseCardGameViewController.h"

@interface BaseCardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (strong,nonatomic) Game *game;
@end

@implementation BaseCardGameViewController


-(Game *)game{
    return _game;
}

-(void)setFlipCount:(int)flipCount{
    _flipCount=flipCount;
    self.flipsLabel.text=[NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

-(void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons=cardButtons;
    [self updateUI];
}

- (void)updateUI{
    //abstract
}

- (IBAction)dealCards:(UIButton *)sender {
    self.flipCount=0;
    self.resultsLabel.text=@"";
    [self.game reset];
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    self.resultsLabel.text=[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

@end
