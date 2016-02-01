// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGSMapSnapshot.h instead.

@import CoreData;

extern const struct RGSMapSnapshotAttributes {
	__unsafe_unretained NSString *snapshotData;
} RGSMapSnapshotAttributes;

extern const struct RGSMapSnapshotRelationships {
	__unsafe_unretained NSString *location;
} RGSMapSnapshotRelationships;

@class RGSLocation;

@interface RGSMapSnapshotID : NSManagedObjectID {}
@end

@interface _RGSMapSnapshot : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RGSMapSnapshotID* objectID;

@property (nonatomic, strong) NSData* snapshotData;

//- (BOOL)validateSnapshotData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) RGSLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@end

@interface _RGSMapSnapshot (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveSnapshotData;
- (void)setPrimitiveSnapshotData:(NSData*)value;

- (RGSLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(RGSLocation*)value;

@end
