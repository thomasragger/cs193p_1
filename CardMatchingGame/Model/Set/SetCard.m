//
//  SetCard.m
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "SetCard.h"

#define SETGAME_MAX_VARIATION 3;

NSString* const SHADING_FILLED         = @"SetCard.SHADING_FILLED";
NSString* const SHADING_OUTLINE        = @"SetCard.SHADING_OUTLINE";
NSString* const SHADING_TRANSPARENT    = @"SetCard.SHADING_TRANSPARENT";

@implementation SetCard
- (int)match:(NSArray *)otherCards{
    int score=0;

    return score;
}

- (NSString *) contents{
    NSString* cardContents=@"";

    for (NSUInteger i=1; i<=self.count; i++) {
        cardContents=[cardContents stringByAppendingString:self.symbol];
    }
        
    return cardContents;
}


- (void)setColor:(UIColor*)color{
    if([[SetCard validColors] containsObject:color]){
        _color=color;
    }
}

- (void)setShading:(NSString*)shading{
    if([[SetCard validShadings] containsObject:shading]){
        _shading=shading;
    }
}


- (void)setSymbol:(NSString *)symbol{
    if([[SetCard validSymbols] containsObject:symbol]){
        _symbol=symbol;
    }
}

+ (NSArray*)validColors{
    static NSArray *colors = nil;
    if(!colors)colors=@[[UIColor redColor],[UIColor blueColor], [UIColor greenColor]];
    return colors;
}

+ (NSArray*)validShadings{
    static NSArray *shadings = nil;
    if(!shadings)shadings=@[SHADING_FILLED,SHADING_OUTLINE,SHADING_TRANSPARENT];
    return shadings;
}

+ (NSArray *)validSymbols{
    static NSArray *symbols = nil;
    if(!symbols)symbols=@[@"▲",@"●",@"■"];
    return symbols;
}

+ (NSUInteger)maxVariationCount{
    return SETGAME_MAX_VARIATION;
}


@end
