//
//  WsBase.m
//  ios-prototype-gui-01
//
//  Created by Gerrit Götsch on 25.10.13.
//  Copyright (c) 2013 SUBITO AG. All rights reserved.
//

#import "WsBase.h"
#import <Objection-iOS/Objection.h>

@implementation WsBase

+ (NSString *) baseUrl {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *baseUrl = [defaults stringForKey:@"webservice-url"];
	if (baseUrl != nil) {
		return baseUrl;
	}
	return @"https://asptest.subito.de/immo-inspect";
}

- (void) doRequest:(NSString *) urlPath {
	NSURL *url = [NSURL URLWithString:[[WsBase baseUrl] stringByAppendingString:urlPath]];
	NSLog(@"%@",url);
	NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
	[NSURLConnection connectionWithRequest:req delegate:self];
}

- (NSMutableURLRequest *) createRequest:(NSString *) urlString {
	return [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[[WsBase baseUrl] stringByAppendingString:urlString]]];
}

- (NSMutableURLRequest *) createRequest:(NSString *) urlString withUser:(NSString *) user andPassword:(NSString *) password {
	NSURL *url = [NSURL URLWithString:[[WsBase baseUrl] stringByAppendingString:urlString]];
	NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
	
	NSString *basicAuthCredentials = [NSString stringWithFormat:@"%@:%@", user, password];
	NSString *authValue = [NSString stringWithFormat:@"Basic %@", [WsBase base64EncodedStringFromString:basicAuthCredentials]];
	
	[req setValue:authValue forHTTPHeaderField:@"Authorization"];
	return req;
}

- (NSDictionary *) doJsonRequest:(NSString *) urlString options:(NSJSONReadingOptions) opt withUser:(NSString *) user andPassword:(NSString *) password :(SEL)aSelector{
	
	NSMutableURLRequest *request = [self createRequest:urlString withUser:user andPassword:password];
	NSError *error = nil;
	NSHTTPURLResponse *response = nil;
	[request setTimeoutInterval:5];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	if ([self hasForError:error:aSelector]) {
		return nil;
	}
	
	if (response.statusCode != 200) {
		NSLog(@"HTTP-Request %@ returned : %ld",request.URL, (long)response.statusCode);
		return nil;
	}
	
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:opt error:&error];
	if ([self hasForError:error:aSelector]) {
		NSString *content = [ NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding];
		NSLog(@"%@",content);
		return nil;
	}
	return dict;
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (BOOL) hasForError:(NSError *) error :(SEL)aSelector {
	if (error == nil) {
		return false;
	}
	if (error.code == kCFURLErrorUserCancelledAuthentication) {
		[self performSelector:aSelector];		
	} else if (error.code == kCFURLErrorCannotConnectToHost) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Verbindung zum Server fehlgeschlagen!"
														message:@"Bitte überprüfen Sie ihre Einstellungen."
													   delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
	} else {
		NSLog(@"%@",error);
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler!"
														message:error.localizedDescription
													   delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
	}
	return true;
}

+ (NSString *) base64EncodedStringFromString:(NSString *) string {
	NSData *data = [NSData dataWithBytes:[string UTF8String] length:[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
	NSUInteger length = [data length];
	NSMutableData *mutableData = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
	
	uint8_t *input = (uint8_t *)[data bytes];
	uint8_t *output = (uint8_t *)[mutableData mutableBytes];
	
	for (NSUInteger i = 0; i < length; i += 3) {
		NSUInteger value = 0;
		for (NSUInteger j = i; j < (i + 3); j++) {
			value <<= 8;
			if (j < length) {
				value |= (0xFF & input[j]);
			}
		}
		
		static uint8_t const kAFBase64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
		
		NSUInteger idx = (i / 3) * 4;
		output[idx + 0] = kAFBase64EncodingTable[(value >> 18) & 0x3F];
		output[idx + 1] = kAFBase64EncodingTable[(value >> 12) & 0x3F];
		output[idx + 2] = (i + 1) < length ? kAFBase64EncodingTable[(value >> 6)  & 0x3F] : '=';
		output[idx + 3] = (i + 2) < length ? kAFBase64EncodingTable[(value >> 0)  & 0x3F] : '=';
	}
	
	return [[NSString alloc] initWithData:mutableData encoding:NSASCIIStringEncoding];
}

@end
