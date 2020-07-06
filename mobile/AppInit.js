
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

import { Layout, Text, Button, Icon } from '@ui-kitten/components';

import Login from './src/screens/Login'

const FacebookIcon = (props) => (
    <Icon name='facebook' {...props} />
  );

const AppInit = () => {
  return (

    <Login/>

    // <Layout style={{flex:1,justifyContent:'center',alignItems:'center'}}>
    //     <Text category='h1'>Popstore</Text>
    //     <View style={{height:30}}>
    //         <Button accessoryLeft={FacebookIcon}>Login</Button>
    //     </View>
    // </Layout>
  );
};

const stylesCall=StyleSheet.create({

    muliExtraLight: {
        fontFamily: 'Muli-ExtraLight'
    },
    muliLight: {
        fontFamily: 'Muli-Light'
    },
    muliRegular: {
        fontFamily: 'Muli-Regular'
    },
    muliMedium: {
        fontFamily: 'Muli-Medium'
    },
    muliSemiBold: {
        fontFamily: 'Muli-SemiBold'
    },
    muliBold: {
        fontFamily: 'Muli-Bold'
    },
    muliExtraBold: {
        fontFamily: 'Muli-ExtraBold'
    }

})

export default AppInit;
