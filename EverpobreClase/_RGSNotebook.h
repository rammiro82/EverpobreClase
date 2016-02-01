// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSNotebook.h instead.

@import CoreData;
#import "RGSNamedEntity.h"

extern const struct RGSNotebookRelationships {
	__unsafe_unretained NSString *notes;
} RGSNotebookRelationships;

@class RGSNote;

@interface RGSNotebookID : RGSNamedEntityID {}
@end

@interface _RGSNotebook : RGSNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSNotebookID* objectID;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _RGSNotebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(RGSNote*)value_;
- (void)removeNotesObject:(RGSNote*)value_;

@end

@interface _RGSNotebook (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
