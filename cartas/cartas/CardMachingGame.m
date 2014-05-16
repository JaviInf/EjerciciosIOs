//
//  CardMachingGame.m
//  cartas
//
//  Created by iMac 9 on 17/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "CardMachingGame.h"

@interface CardMachingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
//@property (nonatomic,strong) NSString *mensaje;

@end
@implementation CardMachingGame
-(NSMutableArray *)cards{
    if(!_cards) _cards=[[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self=[super init];// super designed initializer
    if (self){
        for( int i=0; i	<count; i++){
            Card *card=[deck drawRandomCard];
            if(card){
            [self.cards addObject:card];
            }
            else{
                self=nil;
                break;
            }
        }
        
    }
    return self;
}
-(Card *) cardAtIndex:(NSInteger)index{
    return (index<[self.cards count]) ?  self.cards[index]:nil;
}
static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS=4;
static const int COST_TO_CHOOSE=1;

-(void) chooseCardAtIndex:(NSUInteger)index{
    Card* card=[self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen=NO;
        }
        else{
            for(Card *otherCar in self.cards){
                if(otherCar.isChosen && !otherCar.isMatched){
                    int machScore=[card match:@[otherCar]];
                    if (machScore){
                        NSInteger puntos= machScore * MATCH_BONUS;
                        self.mensaje=[NSString stringWithFormat:@"%@ y %@ bien!! %d puntos", card.contents, otherCar.contents, puntos];
                        self.score+=machScore;
                        otherCar.matched=YES;
                        card.matched=YES;
                    }
                    else {
                        NSInteger puntos=-MISMATCH_PENALTY;
                        self.mensaje=[NSString stringWithFormat:@"%@ y %@ mal!! %d puntos", card.contents, otherCar.contents, puntos];
                        self.score-=MISMATCH_PENALTY;
                        otherCar.chosen=NO;
                    }
                    break;// can only choose 2 card for now
                }
            }
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
        }
        
    }
}
@end
