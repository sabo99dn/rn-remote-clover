//
//  RCTCloverNetModule.m
//  MangoPayment
//
//  Created by MacBook on 13/04/2022.
//

#import "RCTCloverNetModule.h"
#import <React/RCTLog.h>
#import <React/RCTBridgeModule.h>
#import "React/RCTEventEmitter.h"

#import <React/RCTRootView.h>

//@interface RCT_EXTERN_MODULE(CloverNetModule, RCTEventEmitter)
//RCT_EXTERN_METHOD(listenerON1:(NSString *)name callback:(RCTResponseSenderBlock)callback)
//RCT_EXTERN_METHOD(initializePaymentConnector: (NSString *)ipInput)
//@end
@interface RCT_EXTERN_MODULE(CloverNetModule, RCTEventEmitter)
RCT_EXTERN_METHOD(listenerON1:(NSString *)name callback:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(initializePaymentConnector: (NSString *)ipInput)
@end



