//
//  Card.h
//  CardMatchingGame
//
//  Created by Thomas Ragger on 2/13/13.
//  Copyright (c) 2013 Thomas Ragger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong,nonatomic) NSString* contents;
@property(nonatomic, getter=isFaceUp) BOOL faceUp;
@property(nonatomic, getter=isUnplayable) BOOL unPlayable;

- (int)match:(NSArray*)otherCards;

@end
