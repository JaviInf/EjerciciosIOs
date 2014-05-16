//
//  PlayingCardDeck.m
//  cartas
//
//  Created by iMac 9 on 17/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];//OJO!!!!
            }
        }
    }
    return self;
}
@end

