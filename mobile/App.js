/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import 'react-native-gesture-handler'
import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  StatusBar,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

import { createStore, applyMiddleware} from 'redux'
import { Provider} from 'react-redux'
import Thunk from 'redux-thunk'
import reducers from './src/redux/reducers'

import { NavigationContainer } from '@react-navigation/native';

import * as eva from '@eva-design/eva';
import { ApplicationProvider, IconRegistry, Layout, Text } from '@ui-kitten/components';
import { default as theme } from './custom-theme.json';
import { default as mapping } from './mapping.json'; // <-- Import app mapping

import { EvaIconsPack } from '@ui-kitten/eva-icons';

import AppInit from './AppInit'


const store=createStore(reducers,{},applyMiddleware(Thunk))


const App = () => {
  return (
    <Provider store={store}>
      <NavigationContainer>
        <>
          <IconRegistry icons={EvaIconsPack} />
          <ApplicationProvider 
            {...eva} 
            theme={{...eva.light,...theme}}
            customMapping={mapping}>
            <AppInit/>
          </ApplicationProvider>
        </>
      </NavigationContainer>
    </Provider>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
