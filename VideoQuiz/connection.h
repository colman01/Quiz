//
//  Connection.h
//  Daft
//
//  Created by Colman Marcus-Quinn on 06.04.14.
//  Copyright (c) 2014 SUBITO. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Connection : NSObject

@property NSNumber *expectedMax;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UISwitch *propertySwitch;

- (void) downloadImage:(NSString *) urlString;

@end
