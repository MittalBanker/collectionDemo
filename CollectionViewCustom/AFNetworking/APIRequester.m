//
//  APIRequester.m
//  iMustiBollywood
//
//  Created by Kevin B. Adesara on 18/04/14.
//  Copyright (c) 2014 iMusti. All rights reserved.
//

#import "APIRequester.h"

@implementation APIRequester

-(id)init
{
    if(self = [super init])
    {
        manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = TIME_INTERVAL;
    }
    return self;
}

-(void)post:(NSString*)api parameter:(NSDictionary*)para successBlock:(APISuccessBlock)successBlock failureBlock:(APIFailureBlock)failureBlock
{
    NSString *baseAPIURL =  API_URL_DEMO;
    NSString *apiURL = [NSString stringWithFormat:@"%@%@", baseAPIURL, api];
    if(DEBUG_MODE)
    NSLog(@"Request: %@", para);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[manager POST:apiURL
	   parameters:para
		  success:^(AFHTTPRequestOperation *operation, id responseObject) {
              //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:para
              //                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
              //                                                         error:nil];
              //     NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
              //  
              //NSLog(jsonString);
              if(DEBUG_MODE)
			  NSLog(@"Response: %@", responseObject);
              NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                 options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                   error:nil];
              
              if (! jsonData) {
                  //NSLog(@"Got an error: %@", error);
              } else {
                 // NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                 //  NSLog(jsonString);
              }
              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
              if(successBlock)
                  successBlock(responseObject);
		  }
		  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if(DEBUG_MODE)
			  NSLog(@"Error: %@", error);
              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
              if(failureBlock)
                  failureBlock(error);
		  }];
}

-(void)cancelAllRequest
{
    [manager.operationQueue cancelAllOperations];
}


@end
