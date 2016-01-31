//
//  RGSNoteViewController.m
//  EverpobreClase
//
//  Created by Ramiro García Salazar on 21/1/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSNoteViewController.h"
#import "RGSNote.h"
#import "RGSPhotoViewController.h"
#import <MapKit/MapKit.h>

@interface RGSNoteViewController ()
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UITextField *nameView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomToolBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) RGSNote *model;

@property (nonatomic) CGRect oldFrame;
@property (nonatomic) double animationDuration;
@property (nonatomic) BOOL isKeyBoardVisible;

@end

@implementation RGSNoteViewController

#pragma mark - Initialization
-(id) initWithModel:(RGSNote*) model{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}

#pragma mark - Life cycle

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronizamos modelo -> vistas
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.nameView.text = self.model.name;
    self.textView.text = self.model.text;
    
    self.oldFrame = self.textView.frame;
    
    // alta en notificaciones del teclado
    [self startObservingKeyboard];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
    // sincronizamos vistas -> modelo
    self.model.name = self.nameView.text;
    self.model.text = self.textView.text;
    
    // baja en notificaciones del teclado
    [self stopObservingKeyboard];
}

#pragma mark - Notifications
-(void) startObservingKeyboard{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(keyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(keyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
}


-(void)stopObservingKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc removeObserver:self];
}

-(void) keyboardWillAppear:(NSNotification *)note{
    
    if (!self.isKeyBoardVisible) {
        
        self.isKeyBoardVisible = YES;
        
        NSDictionary *info = note.userInfo;
        
        self.animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        CGRect oldFrame = self.textView.frame;
        
        CGRect kbdFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]
                           CGRectValue];
        CGRect newFrame = CGRectMake(oldFrame.origin.x,
                                     oldFrame.origin.y,
                                     oldFrame.size.width,
                                     oldFrame.size.height - kbdFrame.size.height + self.bottomToolBar.bounds.size.height);
        
        [UIView animateWithDuration:self.animationDuration
                         animations:^{
                             self.textView.frame = newFrame;
                         }];
        
    }
    
    
    
}

-(void) keyboardWillDisappear:(NSNotification *)note{
    
    NSDictionary *info = note.userInfo;
    
    CGRect oldFrame = self.textView.frame;
    CGRect kbdFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]
                       CGRectValue];
    
    CGRect newFrame = CGRectMake(oldFrame.origin.x,
                                 oldFrame.origin.y,
                                 oldFrame.size.width,
                                 oldFrame.size.height + kbdFrame.size.height - self.bottomToolBar.bounds.size.height);
    
    
    [UIView animateWithDuration:self.animationDuration
                     animations:^{
                         self.textView.frame = newFrame;
                     }];
    
    self.isKeyBoardVisible = false;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
- (IBAction)displayPhoto:(id)sender {
    RGSPhotoViewController *pVC = [[RGSPhotoViewController alloc] initWithModel:self.model];
    
    [self.navigationController pushViewController:pVC animated:YES];
}

-(IBAction)removeKeyboard:(id)sender{
    [self.view endEditing:YES];
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
