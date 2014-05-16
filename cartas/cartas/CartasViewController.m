//
//  CartasViewController.m
//  cartas
//
//  Created by iMac 9 on 17/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "CartasViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#import "CardMachingGame.h"


@interface CartasViewController ()
//@property (nonatomic) int flipCount;
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (strong, nonatomic) Deck *deck; // baraja
@property (strong, nonatomic) CardMachingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *informacion;
@end

@implementation CartasViewController

-(CardMachingGame *)game{
    if(!_game) _game=[[CardMachingGame alloc]initWithCardCount:[self.cardButton count] usingDeck:[self createDeck]];
    return _game;
}

//- (Deck *)deck
//{
//    if (!_deck) _deck = [self createDeck];
//    return _deck;
//}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}
- (IBAction)reinicia:(UIButton *)sender {
    self.game=nil;
    self.scoreLabel.text=0;
    [self updateUI];
    
    
}

//
//-(void) setFlipCount:(int)flipCount{
//    _flipCount=flipCount;
//    self.flipsLabel.text=[NSString stringWithFormat:@"Flips: %d",self.flipCount];
//    NSLog(@"El contador de flips changed to: %d", self.flipCount);
//}

- (IBAction)touchCardButton:(UIButton *)sender {
//    if([sender.currentTitle length]){
//        //UIImage *cardImage=[UIImage imageNamed:@"cardfront"];
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]forState:UIControlStateNormal];
//        [sender setTitle: @"" forState:UIControlStateNormal];
//    }
//    else{
//        Card *ramdonCard=[self.deck drawRandomCard];
//        if(ramdonCard){
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]forState:UIControlStateNormal];
//        [sender setTitle:ramdonCard.contents forState:UIControlStateNormal];
//        }
//    }
    int choosenButtonIndex=[self.cardButton indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButtonIndex];
    [self updateUI];
//    self.flipCount++;
    
   // NSLog(self.contador);

}
-(void) updateUI{
    
    
    for(UIButton *cardButton in self.cardButton){
        int cardButtonIndex=[self.cardButton indexOfObject:cardButton];
        Card *card=[self.game  cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backGroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;
        self.scoreLabel.text= [NSString stringWithFormat:@"Score : %d", self.game.score];
    }
    self.informacion.text=self.game.mensaje;
}
-(NSString *) titleForCard:(Card *) card{
    return card.isChosen ? card.contents: @"";
}

-(UIImage *)backGroundImageForCard:(Card *) card {
    return [UIImage imageNamed:card.isChosen ?  @"cardback": @"cardfront"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
