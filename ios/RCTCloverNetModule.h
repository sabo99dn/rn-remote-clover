//
//  RCTCloverNetModule.h
//  MangoPayment
//
//  Created by MacBook on 13/04/2022.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import "RCTCloverNetModule.h" 
NS_ASSUME_NONNULL_BEGIN


@interface PublicBridgeHelper: NSObject
  -(RCTBridge*)getBridge;
@end

@interface RCTCloverNetModule : RCTEventEmitter<RCTBridgeModule>

@end

NS_ASSUME_NONNULL_END
