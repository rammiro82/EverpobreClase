//
//  RGSNotebookViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 18/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNotebookViewController.h"
#import "RGSNotebook.h"
#import "RGSNote.h"
#import "RGSNotesViewController.h"
#import "RGSNotebookCellView.h"

@interface RGSNotebookViewController ()

@end

@implementation RGSNotebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // creamos botón de barra de +
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                            target:self
                                                                            action:@selector(addNewNotebook:)];
    
    // lo añadimos
    self.navigationItem.rightBarButtonItem = addBtn;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //registramos el nib
    UINib *cellNib = [UINib nibWithNibName:@"RGSNotebookCellView" bundle:nil];
    
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:[RGSNotebookCellView cellId]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource
-(void) addNewNotebook:(id) sender{
    [RGSNotebook notebookWithName:@"New Notebook" context:self.fetchedResultsController.managedObjectContext];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Averiguar de que libreta nos esta hablando
        RGSNotebook *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //Quitarla del modelo
        [self.fetchedResultsController.managedObjectContext deleteObject:del];
        
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // averiguar qué libreta es
    RGSNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear la celda
    RGSNotebookCellView *cell = [tableView dequeueReusableCellWithIdentifier:[RGSNotebookCellView cellId]];
    
    // sincronizar libreta --> celda
    cell.nameView.text = nb.name;
    cell.numberOfNotesView.text = [NSString stringWithFormat:@"%lu", (unsigned long)nb.notes.count];
    
    // devolvemos la celda
    return cell;
}


#pragma mark - TableView Delegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [RGSNotebookCellView cellHeight]; 
}

#pragma mark - Navigation
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // obtener la libreta
    RGSNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear el fecth request
    NSFetchRequest *r = [[NSFetchRequest alloc] initWithEntityName:[RGSNote entityName]];
    
    // Configurarlo con un predicado
    r.fetchBatchSize = 25;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RGSNamedEntityAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:RGSNamedEntityAttributes.modificationDate
                                                        ascending:NO]];
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    
    // Crear el fecht results
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                         managedObjectContext:nb.managedObjectContext
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:[[NSUUID new] UUIDString]];
    // layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(140, 150);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // Crear el controlador
    RGSNotesViewController *nVC = [RGSNotesViewController coreDataCollectionViewControllerWithFetchedResultsController:fc
                                                                                                                layout:layout];
    nVC.notebook = nb;
    
    // Pushearlo
    [self.navigationController pushViewController:nVC
                                         animated:YES];
}

@end
