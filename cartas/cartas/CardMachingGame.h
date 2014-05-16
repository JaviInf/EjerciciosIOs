//
//  CardMachingGame.h
//  cartas
//
//  Created by iMac 9 on 17/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMachingGame : NSObject
//designed initializer
-(instancetype) initWithCardCount: (NSUInteger) count usingDeck:(Deck *) deck;
-(Card *)cardAtIndex: (NSInteger) index;
-(void) chooseCardAtIndex :(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic,strong) NSString *mensaje;


@end
