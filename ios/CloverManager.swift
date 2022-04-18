//
//  CloverManager.swift
//  MangoPayment
//
//  Created by MacBook on 13/04/2022.
//

import Foundation
import React
import UIKit
import CloverConnector

@objc(CloverNetModule)
class CloverManager: RCTEventEmitter, UIAlertViewDelegate,PairingDeviceConfiguration, ICloverConnectorListener {
  
  weak var viewController:UIViewController?
  fileprivate var lastDeviceEvent:CloverDeviceEvent?
  public var preAuthExpectedResponseId:String?
  
  public var cloverConnector:ICloverConnector?
  public var cloverConnectorListener:CloverConnectorListener?
  fileprivate var token:String?
  
  func onDeviceReady(_ merchantInfo: MerchantInfo) {
    print("------------------------------------------------------------------Ready")
       self.sendEvent(withName: "onDeviceReady", body: ["onDeviceReady": "Ready"])
  }
  
  func onSaleResponse(_ response: SaleResponse) {
    
  }
  
  func onAuthResponse(_ authResponse: AuthResponse) {
    
  }
  
  func onPreAuthResponse(_ preAuthResponse: PreAuthResponse) {
    
  }
  
  func onCapturePreAuthResponse(_ capturePreAuthResponse: CapturePreAuthResponse) {
    
  }
  
  func onIncrementPreAuthResponse(_ incrementPreAuthResponse: IncrementPreauthResponse) {
    
  }
  
  func onTipAdjustAuthResponse(_ tipAdjustAuthResponse: TipAdjustAuthResponse) {
    
  }
  
  func onVoidPaymentResponse(_ voidPaymentResponse: VoidPaymentResponse) {
    
  }
  
  func onRefundPaymentResponse(_ refundPaymentResponse: RefundPaymentResponse) {
    
  }
  
  func onVoidPaymentRefundResponse(_ response: VoidPaymentRefundResponse) {
    
  }
  
  func onManualRefundResponse(_ manualRefundResponse: ManualRefundResponse) {
    
  }
  
  func onCloseoutResponse(_ closeoutResponse: CloseoutResponse) {
    
  }
  
  func onVerifySignatureRequest(_ signatureVerifyRequest: VerifySignatureRequest) {
    
  }
  
  func onVaultCardResponse(_ vaultCardResponse: VaultCardResponse) {
    
  }
  
  func onDeviceActivityStart(_ deviceEvent: CloverDeviceEvent) {
    
  }
  
  func onDeviceActivityEnd(_ deviceEvent: CloverDeviceEvent) {
    
  }
  
  func onDeviceError(_ deviceErrorEvent: CloverDeviceErrorEvent) {
    
  }
  
  func onDeviceConnected() {
    
  }
  
  func onDeviceDisconnected() {
    
  }
  
  func onConfirmPaymentRequest(_ request: ConfirmPaymentRequest) {
    
  }
  
  func onTipAdded(_ message: TipAddedMessage) {
    
  }
  
  func onPrintManualRefundReceipt(_ printManualRefundReceiptMessage: PrintManualRefundReceiptMessage) {
    
  }
  
  func onPrintManualRefundDeclineReceipt(_ printManualRefundDeclineReceiptMessage: PrintManualRefundDeclineReceiptMessage) {
    
  }
  
  func onPrintPaymentReceipt(_ printPaymentReceiptMessage: PrintPaymentReceiptMessage) {
    
  }
  
  func onPrintPaymentDeclineReceipt(_ printPaymentDeclineReceiptMessage: PrintPaymentDeclineReceiptMessage) {
    
  }
  
  func onPrintPaymentMerchantCopyReceipt(_ printPaymentMerchantCopyReceiptMessage: PrintPaymentMerchantCopyReceiptMessage) {
    
  }
  
  func onPrintRefundPaymentReceipt(_ printRefundPaymentReceiptMessage: PrintRefundPaymentReceiptMessage) {
    
  }
  
  func onRetrievePrintersResponse(_ retrievePrintersResponse: RetrievePrintersResponse) {
    
  }
  
  func onPrintJobStatusResponse(_ printJobStatusResponse: PrintJobStatusResponse) {
    
  }
  
  func onRetrievePendingPaymentsResponse(_ retrievePendingPaymentResponse: RetrievePendingPaymentsResponse) {
    
  }
  
  func onReadCardDataResponse(_ readCardDataResponse: ReadCardDataResponse) {
    
  }
  
  func onCustomActivityResponse(_ customActivityResponse: CustomActivityResponse) {
    
  }
  
  func onResetDeviceResponse(_ response: ResetDeviceResponse) {
    
  }
  
  func onCustomerProvidedDataEvent(_ event: CustomerProvidedDataEvent) {
    
  }
  
  func onMessageFromActivity(_ response: MessageFromActivity) {
    
  }
  
  func onRetrievePaymentResponse(_ response: RetrievePaymentResponse) {
    
  }
  
  func onRetrieveDeviceStatusResponse(_ response: RetrieveDeviceStatusResponse) {
    
  }
  
  func onInvalidStateTransitionResponse(_ response: InvalidStateTransitionResponse) {
    
  }
  
  func onDisplayReceiptOptionsResponse(_ response: DisplayReceiptOptionsResponse) {
    
  }
  
//  @objc(onDeviceReady:)
//  func onDeviceReady(_ merchantInfo: MerchantInfo) {
//    self.cloverConnectorListener?.onDeviceReady(merchantInfo)
//    print("------------------------------------------------------------------Ready")
//        self.sendEvent(withName: "onDeviceReady", body: ["onDeviceReady": "Ready"])
//  }
  
  
  override init(){
    super.init()
  }
  
  var hasListener: Bool = false

    override func startObserving() {
      hasListener = true
    }

    override func stopObserving() {
      hasListener = false
    }
  

  
//  @objc(onDeviceRe:)
//  func onDeviceRe(_ merchantInfo: MerchantInfo) {
//    self.cloverConnectorListener?.
//   print("------------------------------------------------------------------Ready")
//    self.sendEvent(withName: "onDeviceReady", body: ["onDeviceReady": "Ready"])
//  }
  
  
  @objc(onPairingCode:)
  func onPairingCode(_ pairingCode:String) {
    self.cloverConnectorListener?.onPairingCode(pairingCode)
    print("------------------------------------------------------------------" + pairingCode)
    self.sendEvent(withName: "onPairingCode", body: ["onPairingCode": pairingCode])
    
  }
  
  func onPairingSuccess(_ authToken: String) {
  }
  
  
@objc(initializePaymentConnector:)
  func initializePaymentConnector(_ ipInput: String) {
    cloverConnector?.dispose()
    var endpoint = ipInput
    print(ipInput)
    if let components = URLComponents(string: ipInput), let _ = components.url {
        if let token = components.queryItems?.first(where: { $0.name == "authenticationToken"})?.value {
            self.token = token //we can skip the pairing code if we already have an auth token
        }

//        endpoint = components.scheme ?? "wss"
//        endpoint += "://"
//        endpoint += components.host ?? ""
//        endpoint += ":" + String(components.port ?? 80)
//        endpoint += String(components.path)
      endpoint = "wss://192.168.79.32:12345/remote_pay"
    }
    print(endpoint)
    let config:WebSocketDeviceConfiguration = WebSocketDeviceConfiguration(endpoint:endpoint, remoteApplicationID: "com.enrich.mangopay", posName: "Mango Payment", posSerial: "POS-15", pairingAuthToken: self.token, pairingDeviceConfiguration: self)
//        config.maxCharInMessage = 2000
//        config.pingFrequency = 1
//        config.pongTimeout = 6
//        config.reportConnectionProblemTimeout = 3
    
    let validCloverConnector = CloverConnectorFactory.createICloverConnector(config: config)
    self.cloverConnector = validCloverConnector
    self.cloverConnector?.addCloverConnectorListener(self)
//    self.cloverConnector?.initializeConnection()
//    let validCloverConnectorListener = CloverConnectorListener(cloverConnector: validCloverConnector)
//    self.cloverConnectorListener = validCloverConnectorListener
//
//    validCloverConnector.addCloverConnectorListener(validCloverConnectorListener)
//    validCloverConnector.initializeConnection()
}
  
override func supportedEvents() -> [String]! {
   return ["onPairingCode","onDeviceReady"]
 }

}
