//
//  SetCard.h
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/17/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

extern NSString* const SHADING_FILLED;
extern NSString* const SHADING_OUTLINE;
extern NSString* const SHADING_TRANSPARENT;

@property (nonatomic) UIColor* color;
@property (nonatomic) NSString* symbol;
@property (nonatomic) NSString* shading;
@property (nonatomic) NSUInteger count;

+ (NSArray *)validSymbols;
+ (NSArray *)validColors;
+ (NSArray *)validShadings;

//variation in symbol/shading/number/color usually 3, forms 81 cards
+ (NSUInteger)maxVariationCount;
@end
