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

@interface RGSNotesViewController()
@property (nonatomic, strong) RGSNotebook *notebook;

@end

@implementation RGSNotesViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook: (RGSNotebook* ) notebook{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController style:aStyle]) {
        _notebook = notebook;
    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *itm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewNote:)];
    
    self.navigationItem.rightBarButtonItem = itm;
}

-(void) addNewNote:(id) sender{
    [RGSNote noteWithName:@"Nueva Nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source

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
}
@end
