//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by Neuclair J. Angele Junior on 02/07/14.
//  Copyright (c) 2014 Nucleos. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avisoSucessoLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementadorAlterado:(id)sender {
    UIStepper *incrementador = (UIStepper *)sender;
    self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
}

- (void) salvaEmpresa:(Empresa *) novaEmpresa {
    if (!catalogo) {
        catalogo = [[NSMutableArray alloc] init];
    }
    
    [catalogo addObject:novaEmpresa];
}

- (void) mostraCatalogo {
    NSLog(@"******* Listando todas empresas *******");
    
    for (Empresa *empresa in catalogo) {
        NSLog(@"A empresa %@ tem %d funcionários", empresa.nome, empresa.quantidadeFuncionarios);
    }
}

- (IBAction)salvar:(id)sender {
    Empresa *e = [[Empresa alloc] init];
    e.nome = self.nomeField.text;
    e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    
    //NSLog(@"Empresa criada. Nome=%@, funcionários=%d", e.nome, e.quantidadeFuncionarios);
    
    [self salvaEmpresa:e];
    [self mostraCatalogo];
    
    [self.nomeField resignFirstResponder];
    
    self.avisoSucessoLabel.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLabel.hidden = NO;
        self.avisoSucessoLabel.alpha = 1;
    } completion:^(BOOL finalizado){
        [UIView animateWithDuration:1 delay:2 options:0 animations:^{
            self.avisoSucessoLabel.alpha = 0;
        } completion:^(BOOL finalizado) {
            self.avisoSucessoLabel.hidden = YES;
        }];
    }];
}
@end
