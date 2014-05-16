//
//  PlayingCard.m
//  cartas
//
//  Created by iMac 9 on 17/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards{
    int score=0;
    if([otherCards count]==1){
        PlayingCard *otherCard=[otherCards firstObject];
        if(otherCard.rank==self.rank){
            if(
               ([otherCard isRed] && [self isRed]) ||
               ([otherCard isBlack] && [self isBlack])
            )
            score=16;
        }
//        else if([otherCard.suit isEqualToString:self.suit]){
//            score=1;
//        }
    }
    return score;
}

-(BOOL) isRed{
    return([self.suit isEqualToString:@"♥"]|| [self.suit isEqualToString:@"♦"]);
}
-(BOOL) isBlack{
    return([self.suit isEqualToString:@"♠"] || [self.suit isEqualToString:@"♣"]);
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+(NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits]containsObject:suit])
        _suit = suit;
        
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    //return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return @[@"?",@"A",@"J",@"Q",@"K"];

}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    } }

@end
