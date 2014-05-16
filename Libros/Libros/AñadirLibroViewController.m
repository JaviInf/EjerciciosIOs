//
//  AñadirLibroViewController.m
//  Libros
//
//  Created by iMac 9 on 19/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "AñadirLibroViewController.h"
#import "LibrosViewController.h"

@interface An_adirLibroViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titulo;
@property (strong, nonatomic) IBOutlet UITextField *autor;
@property (strong, nonatomic) IBOutlet UITextField *prestadoA;
@property (strong, nonatomic) IBOutlet UITextField *fecha;
@property (strong, nonatomic) IBOutlet UIImageView *imagen;

@property (strong,nonatomic) IBOutlet UIImagePickerController* imagePickerController;
@property (strong, nonatomic) IBOutlet UITextField *isbn;

@property (weak, nonatomic) IBOutlet UIDatePicker *fechaPicker;
@property (weak, nonatomic) IBOutlet UIView *fechaView;
@property (strong,nonatomic) NSDateFormatter * ddMMyyyy;
@property (strong, nonatomic) Modelo *modelo;
@end

@implementation An_adirLibroViewController

#pragma mark - Inicializaciones
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ddMMyyyy = [[NSDateFormatter alloc] init];
    [self.ddMMyyyy setDateFormat:@"dd/MM/yyyy"];

	// Do any additional setup after loading the view.
    self.titulo.text=self.libro.titulo;
    self.autor.text=self.libro.autor.nombre;
    self.prestadoA.text=(NSString*)self.libro.prestado_a;
    self.fecha.text=[self.ddMMyyyy stringFromDate:self.libro.fecha_de_prestamo];
    self.imagen.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:self.libro.portada]];
    
    
    self.fecha.inputView=self.fechaView;
    self.navigationItem.leftItemsSupplementBackButton=YES;

    }
//esconder teclado
-(IBAction) textFieldDoneEditing : (id) sender{

}

#pragma mark - Fecha

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([textField isEqual:self.fecha] && ![self.fecha.text isEqualToString:@""]) {
        self.fechaPicker.date=[self.ddMMyyyy dateFromString:self.fecha.text];
    }
    return YES;
}

- (IBAction)fechaCancelarTap:(id)sender {
    [self.fecha endEditing:YES];
}
- (IBAction)fechaAceptarTap:(id)sender {
    self.fecha.text = [self.ddMMyyyy stringFromDate:self.fechaPicker.date];
    [self.fecha endEditing:YES];
   
}




#pragma mark - Camara
- (IBAction)sacarFoto:(UIBarButtonItem *)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
    } else {
        [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    }

}
- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    if([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.sourceType = sourceType;
        self.imagePickerController.delegate = self;
       // [self guardarEnCache:self.imagen.image];
        
        [self presentViewController:self.imagePickerController animated:YES completion:^{}];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
       self.imagen.image = image;
    [self dismissViewControllerAnimated:YES completion:^{}];
    
    
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    // EXAMPLE: do something useful with the barcode data
    self.isbn.text = symbol.data;

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark obtener isbn

- (IBAction)obtenerISBN:(UIBarButtonItem *)sender {
    NSLog(@"Obtener isbn");
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    // present and release the controller
    [self presentModalViewController:reader animated:YES];
}

#pragma mark guardar
- (IBAction)guardarCambios:(UIButton *)sender {
    
    self.libro.titulo=self.titulo.text;
    self.libro.autor.nombre=self.autor.text;
//    self.libro.prestado_a=self.prestadoA.text;
    self.libro.fecha_de_prestamo=[self.ddMMyyyy dateFromString:self.fecha.text];
   
     }



@end
