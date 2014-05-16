//
//  PrincipalViewController.m
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "PrincipalViewController.h"
#import "Modelo.h"
#import "FotoViewCell.h"
#import "DetallesViewController.h"

@interface PrincipalViewController ()
@property (strong, nonatomic) Modelo *modelo;
@end

@implementation PrincipalViewController

#pragma mark Inicializacion

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modelo=[Modelo sharedInstance];
}

#pragma mark <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return [self.modelo.fotos count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // obtengo celda
    UICollectionViewCell *celdaFoto = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CeldaFoto" forIndexPath:indexPath];
    if ([celdaFoto isKindOfClass:[FotoViewCell class]]) {
        FotoViewCell *fotoViewCell = (FotoViewCell *)celdaFoto;
        Foto *foto = [self.modelo fotoAtIndex:indexPath.row];
            [fotoViewCell.fotoView descargaFoto:foto completion:^(UIImage *image) {
            NSArray *visibleIndexPaths = [self.collectionView indexPathsForVisibleItems];
            if ([visibleIndexPaths containsObject:indexPath]) {
                fotoViewCell.fotoView.imageView.image = image;
            }
        }];
    }
    return celdaFoto;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detalles"]) {
        if([segue.destinationViewController isKindOfClass:[DetallesViewController class]]){
            UICollectionViewCell *celda=sender;
            NSIndexPath *indexPath=[self.collectionView indexPathForCell:celda];
            DetallesViewController *detallesViewController= segue.destinationViewController;
            Foto *foto=[self.modelo fotoAtIndex:indexPath.row];
            detallesViewController.foto=foto;
            detallesViewController.indiceActual=indexPath.row;
        }
    }
}
#pragma mark <UICollectionViewDelegate>

@end
