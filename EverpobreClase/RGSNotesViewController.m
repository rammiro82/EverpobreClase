//
//  RGSNotesViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 21/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNotesViewController.h"
#import "RGSNote.h"
#import "RGSPhoto.h"
#import "RGSNotebook.h"
#import "RGSNoteViewController.h"
#import "RGSNoteCellView.h"

static NSString *cellId = @"noteCellId";

@interface RGSNotesViewController()

@end

@implementation RGSNotesViewController

#pragma mark - XIB registration
-(void) registerNib{
    UINib *nib = [UINib nibWithNibName:@"RGSNoteCollectionViewCell"
                                bundle:nil];
    
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:cellId];
}

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                layout:(UICollectionViewLayout*) layout
                              notebook: (RGSNotebook* ) notebook{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController layout:layout]) {
        _notebook = notebook;
    }
    
    return self;

}


#pragma mark - View LifeCycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self registerNib];
    
    self.title = @"Notas";
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95
                                                            alpha:1];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *itm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNote:)];
    self.navigationItem.rightBarButtonItem = itm;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source
-(UICollectionViewCell *) collectionView:(UICollectionView *) collectionView
                  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    // obtener el objeto
    RGSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // obtener una celda
    RGSNoteCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                      forIndexPath:indexPath];

    // configurar la celda
    [cell observeNote:note];
    
    // devolver la celda
    return cell;
}

#pragma mark - Delegate
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // obtener la nota
    RGSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear el controlador
    RGSNoteViewController *noteVC = [[RGSNoteViewController alloc] initWithModel:note];
    
    // hacer push
    [self.navigationController pushViewController:noteVC
                                         animated:YES];
}



#pragma mark - Utils
-(void) addNewNote:(id) sender{
    RGSNoteViewController *newNoteVC = [[RGSNoteViewController alloc] initForNewNoteInNotebook:self.notebook];
    
    [self.navigationController pushViewController:newNoteVC
                                         animated:YES];
    
/*    [RGSNote noteWithName:@"Nueva Nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
*/
 
}
/*
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"NoteCell";
    
    // obtener la nota
    RGSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellID];
    }
    
    // sincronizar nota y celda
    cell.imageView.image = note.photo.image;
    cell.textLabel.text = note.name;
    cell.detailTextLabel.text = note.text;
    
    // Devolverla
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // obrener la nota
    RGSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear el controlador
    RGSNoteViewController *nVC = [[RGSNoteViewController alloc] initWithModel:note];
    
    // hacer el push
    [self.navigationController pushViewController:nVC animated:YES];
}*/

@end
