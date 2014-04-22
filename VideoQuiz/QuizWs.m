//
//  QuitWs.m
//  VideoQuiz
//
//  Created by colman on 22.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "QuizWs.h"
#import <Objection-iOS/Objection.h>
//#import "LoginAlertDelegate.h"
#import "LoginViewController.h"

@implementation QuizWs

//#import "KeychainItemWrapper.h"


//@implementation InspectionWs

objection_register_singleton(QuizWs)

DmUser *lastInspection;
//LoginAlertDelegate *loginAlertDelegate;

-(void) refreshList {
	
    //	[self performSelectorInBackground:@selector(refreshListInternal) withOb- (DmInspection *) loadById:(NSNumber *) id;
    //    - (void) remove: (DmUser *) inspection;ject:self];
	[self refreshListInternal];
}

- (void) clearUserData {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
    //	[defaults setObject:@"" forKey:IWUsernameKey];
}

- (void) refreshListInternal {
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:IWPasswordIdentifier accessGroup:nil];
	
    //	KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:IWPasswordIdentifier accessGroup:nil];
    //	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //
    //	NSString *user = [defaults objectForKey:IWUsernameKey];
    //	NSString *pass = [keychain objectForKey:(__bridge id)kSecValueData];
    //
    //
    //	NSMutableArray *ids = (NSMutableArray *) [super doJsonRequest: @"/services/inspections/list"
    //														  options:NSJSONReadingAllowFragments
    //														 withUser:user
    //													  andPassword:pass
    //																 :@selector(loginAlertRefreshList)];
    //
    //	if (ids == nil) {
    //		return;
    //	}
    //
    //	for (NSNumber *i in ids) {
    //		[self loadInspection:[i intValue] :user :pass :@selector(loginAlertRefreshList)];
    //	}
    //
    //	[[NSNotificationCenter defaultCenter] postNotificationName:@"ListLoadedNotification" object:self];
}

- (void) loginAlertRefreshList {
	[self loginAlert:@selector(refreshListInternal)];
}

- (void) loginAlert :(SEL) aSelector {
    //	loginAlertDelegate = [[LoginAlertDelegate alloc] initWithSelector:aSelector onService:self];
    //	UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Anmeldung erforderlich!"
    //													 message:@"Bitte geben Sie ihren Benutzername und ihr Passwort ein."
    //													delegate:loginAlertDelegate
    //										   cancelButtonTitle:@"Abbrechen"
    //										   otherButtonTitles:@"Anmelden",nil];
    //
    //	alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    //	UITextField *username = [alert textFieldAtIndex:0];
    //	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //	NSString *user = [defaults objectForKey:IWUsernameKey];
    //	if (user != nil) {
    //		username.text = user;
    //	}
    //	username.placeholder = @"Benutzername";
    //	UITextField *password = [alert textFieldAtIndex:1];
    //	password.placeholder = @"Passwort";
    //
    //	[alert show];
}

- (void) loadInspection:(int ) inspectionId :(NSString *) user :(NSString *) pass :(SEL)aSelector{
    //	NSDictionary *dict = [super doJsonRequest: [NSString stringWithFormat:@"/services/inspections/get/%i", inspectionId] options:NSJSONReadingMutableContainers withUser:user andPassword:pass :aSelector];
    //
    //	if (dict == nil) {
    //		return;
    //	}
    //
    //	[self setupJsonData:dict];
}

-(void) setupJsonData:(NSDictionary *) dict {
	
    //	NSNumber *identifier = dict[@"id"];
    //	if (identifier == nil) {
    //		return;
    //	}
    //
    //	NSManagedObjectContext *context = [[PersistManager instance] managedObjectContext];
    //
    //	DmInspection *inspection = [[InspectionDao instance] loadById:identifier];
    //	if (inspection == nil) {
    //		inspection = [NSEntityDescription insertNewObjectForEntityForName:@"Inspection" inManagedObjectContext:context];
    //	}
    //
    //	inspection.identifier = identifier;
    //
    //	DmContact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    //	DmContact *clientContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    //	BOOL new = NO;
    //	if (inspection.address == nil) {
    //		inspection.address = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:context];
    //		new = YES;
    //	}
    //	if (inspection.addressChanged == nil) {
    //		inspection.addressChanged = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:context];
    //		new = YES;
    //	}
    //
    //	BOOL changed = [inspection changedAddress];
    //
    //	[self fillAddress:dict :inspection.address];
    //	if (new || !changed) {
    //		[self fillAddress:dict :inspection.addressChanged];
    //	}
    //
    //	inspection.contact = contact;
    //
    //	id obj = [dict objectForKey:@"contact"];
    //	if (obj == [NSNull null]) {
    //		contact.name = @"";
    //		contact.phone = @"";
    //	} else {
    //		contact.name  = [self nullSafeString:dict[@"contact"][@"name"]];
    //		contact.phone = [self nullSafeString:dict[@"contact"][@"phone"]];
    //	}
    //
    //    //    photoQuantity
    //    id quantity = [dict objectForKey:@"photoQuantity"];
    //    NSNumber *photoQuantity = (NSNumber *) quantity;
    //    inspection.photoQuantity = [photoQuantity intValue];
    //
    //	inspection.clientContact = clientContact;
    //	inspection.type = dict[@"type"];
    //
    //	DmFirmData *firmData = [NSEntityDescription insertNewObjectForEntityForName:@"FirmData" inManagedObjectContext:context];
    //	firmData.refId =  dict[@"refId"];
    //	firmData.client = dict[@"client"];
    //	firmData.clientRefId = dict[@"clientRefId"];
    //	firmData.appointment = dict[@"appointment"];
    //	inspection.firmData = firmData;
    //
    //	NSMutableOrderedSet *categories = [NSMutableOrderedSet orderedSetWithOrderedSet:inspection.categories];
    //
    //	DmCategory *category;
    //	NSDictionary *cats = dict[@"categories"];
    //	for (NSDictionary *cat in cats) {
    //		category = [self addCategory:categories :cat[@"name"]];
    //		category.key = [self nullSafeString:cat[@"key"]];
    //		category.visibleOn = [self nullSafeString:cat[@"visible"]];
    //		NSMutableOrderedSet * attributes = [NSMutableOrderedSet orderedSetWithOrderedSet:category.attributes];
    //		for (NSDictionary *attribute in cat[@"attributes"]) {
    //			NSDictionary *attrib = attribute;
    //			[self addAttribute :attributes:attrib];
    //		}
    //		category.attributes = attributes;
    //	}
    //	inspection.categories = categories;
    //
    //
    //	[[PersistManager instance] save];
}

//- (void) fillAddress:(NSDictionary *)dict :(DmAddress *) address {
////	address.street = dict[@"address"][@"street"];
////    address.houseNumber = dict[@"address"][@"streetNumber"];
////	address.postalCode = dict[@"address"][@"postalCode"];
////	address.location = dict[@"address"][@"location"];
//}


- (NSString *) nullSafeString: (NSString *) value {
	NSString *num = value;
	if (num == (id)[NSNull null]) {
		return nil;
	}
	return num;
}

- (NSNumber *) nullSafe: (NSNumber *) value {
	NSNumber *num = value;
	if (num == (id)[NSNull null]) {
		return nil;
	}
	return num;
}

- (void) loginAlertResendResponse {
	[self loginAlert:@selector(resendResponse)];
}

- (void) resendResponse {
	
}

//- (void) sendResponse:(DmInspection *) inspection {
//
//	lastInspection = inspection;
//
//	NSMutableURLRequest *request = [self createRequest:@"/services/inspections/add-result" withUser:@"user1" andPassword:@"subito"];
//	[request setHTTPMethod:@"POST"];
//
//	NSError *error = nil;
//	NSMutableDictionary *mapData = [[NSMutableDictionary alloc] init];
//	NSMutableArray *results = [[NSMutableArray alloc] init];
//
//	[mapData setObject:inspection.identifier forKey:@"id"];
//	[mapData setObject:results forKey:@"results"];
//
//    DmGPSData *gpsData = inspection.gpsData;
//    NSMutableDictionary *gpsDictionary = [[NSMutableDictionary alloc] init];
//    [gpsDictionary setObject:[NSNumber numberWithFloat:gpsData.lon] forKey:@"longitude"];
//    [gpsDictionary setObject:[NSNumber numberWithFloat:gpsData.horizontalAccuracy] forKey:@"longitudeAccuracy"];
//    [gpsDictionary setObject:[NSNumber numberWithFloat:gpsData.lat] forKey:@"latitude"];
//    [gpsDictionary setObject:[NSNumber numberWithFloat:gpsData.verticalAccuracy] forKey:@"latitudeAccuracy"];
//    [gpsDictionary setObject:[NSNumber numberWithFloat:gpsData.altitude] forKey:@"altitude"];
//    [gpsDictionary setObject:@"Geographic coordinate system" forKey:@"coordinateSystemName"];
//    [mapData setObject:gpsDictionary forKey:@"gpsData"];
//
//
//	for (DmCategory *cat in inspection.categories) {
//		NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
//		for (DmImage *image in cat.images) {
//			NSMutableDictionary *resultMap = [[NSMutableDictionary alloc] init];
//			[resultMap setObject:cat.name forKey:@"category"];
//			[resultMap setObject:image.text==nil?@"":image.text forKey:@"value"];
//			[resultMap setObject:image.tickBox?@"true":@"false" forKey:@"selected"];
//			if (image.data != nil) {
//				[resultMap setObject:[image.data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] forKey:@"image"];
//			}
//			[results addObject:resultMap];
//		}
//		for (DmAttribute *attr in cat.attributes) {
//			NSMutableDictionary *resultMap = [[NSMutableDictionary alloc] init];
//			[attributes setObject:[self valueOf:attr] forKey:attr.desc];
//			[resultMap setObject:cat.name forKey:@"category"];
//			[resultMap setObject:attr.desc forKey:@"attribute"];
//			[resultMap setObject:[self valueOf:attr] forKey:@"value"];
//			if ([attr.type isEqualToString:@"IMAGE"]) {
//				if (attr.pflichtfoto.data != nil) {
//					[resultMap setObject:[attr.pflichtfoto.data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] forKey:@"image"];
//					[resultMap setObject:attr.pflichtfoto.text==nil?@"":attr.pflichtfoto.text forKey:@"value"];
//				}
//				[resultMap setObject:@"true" forKey:@"selected"];
//			}
//			[results addObject:resultMap];
//		}
//	}
//
//	NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//	if ([super hasForError:error:@selector(loginAlertResendResponse)]) {
//		return;
//	}
//
//	[request setHTTPBody:jsonData];
//	[request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//
//	NSHTTPURLResponse *response = nil;
//	[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//	if ([super hasForError:error:@selector(loginAlertResendResponse)]) {
//		return;
//	}
//	
//	lastInspection = nil;
//	if (response.statusCode != 200) {
//		NSLog(@"HTTP-Request %@ returned : %ld",request.URL, (long)response.statusCode);
//	}
//}



@end
