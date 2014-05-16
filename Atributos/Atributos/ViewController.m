//
//  ViewController.m
//  Atributos
//
//  Created by iMac 9 on 20/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *body;
@property (strong, nonatomic) IBOutlet UILabel *headline;
@property (strong, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (IBAction)changeColor:(UIButton *)sender {
    
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
        value:sender.backgroundColor
        range:self.body.selectedRange];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usepreferredFonts];
    
   [[NSNotificationCenter defaultCenter]
    addObserver:self
    selector:@selector(usepreferredFonts)
    name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void) usepreferredFonts {
    [self preferredFonts];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void) preferredFonts {
    self.body.font=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font=[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


- (IBAction)reborde:(UIButton *)sender {
    
    [self.body.textStorage addAttributes:
     @{ NSStrokeWidthAttributeName: @-3,
       NSStrokeColorAttributeName: [UIColor blackColor]}
       range:self.body.selectedRange];
}

- (IBAction)quitarReborde:(UIButton *)sender {
    [self.body.textStorage removeAttribute: NSStrokeWidthAttributeName range:self.body.selectedRange];
    
    [self.body.textStorage removeAttribute:NSStrokeColorAttributeName range:self.body.selectedRange];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title=[[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title addAttributes:@{
                          NSStrokeColorAttributeName: @3,
                          NSStrokeWidthAttributeName: self.outlineButton.tintColor}range:NSMakeRange(0, title.length)];
    //[self.outlineButton setAttributedTitle:title forState:(UIControlState)];
}

@end
