import React from 'react';
import {NativeModules} from 'react-native';

const {CloverNetModule} = NativeModules;

const connectToClover = ipInput => {
  CloverNetModule.initializePaymentConnector(ipInput);
};

export {connectToClover, CloverNetModule};
