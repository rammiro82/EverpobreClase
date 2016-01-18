//
//  RGSNotebookViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 18/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNotebookViewController.h"
#import "RGSNotebook.h"

@interface RGSNotebookViewController ()

@end

@implementation RGSNotebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Everpobre";
    
    // creamos botón de barra de +
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewNotebook:)];
    
    // lo añadimos
    self.navigationItem.rightBarButtonItem = btn;
}

-(void) addNewNotebook:(id) sender{
    [RGSNotebook notebookWithName:@"New Notebook" context:self.fetchedResultsController.managedObjectContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"NotebookCell";
    
    // averiguar qué libreta es
    RGSNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        // creamos la celda
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    // sincronizar libreta --> celda
    cell.textLabel.text = nb.name;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:nb.modificationDate];
    
    // devolvemos la celda
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
