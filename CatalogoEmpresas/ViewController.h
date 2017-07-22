//
//  ViewController.h
//  CatalogoEmpresas
//
//  Created by Neuclair J. Angele Junior on 02/07/14.
//  Copyright (c) 2014 Nucleos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *catalogo;
}
@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *quantidadeField;
@property (weak, nonatomic) IBOutlet UILabel *avisoSucessoLabel;
- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;

@end
