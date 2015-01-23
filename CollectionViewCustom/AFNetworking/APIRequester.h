//
//  APIRequester.h
//  iMustiBollywood
//
//  Created by Kevin B. Adesara on 18/04/14.
//  Copyright (c) 2014 iMusti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^APISuccessBlock)(id response);
typedef void(^APIFailureBlock)(NSError* error);

@interface APIRequester : NSObject
{
    AFHTTPRequestOperationManager *manager;
    NSDictionary *_ref_data;
}

-(void)cancelAllRequest;

-(void)syncWithUserId:(NSString*)userid
       serverDateTime:(NSString*)lastSyncDate
               offset:(NSString*)offset
                limit:(NSString*)limit
              success:(APISuccessBlock)successBlock
              failure:(APIFailureBlock)failureBlock;

@end
