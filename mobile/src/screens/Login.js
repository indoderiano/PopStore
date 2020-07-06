import React, { useState } from 'react'
import { TouchableWithoutFeedback, View } from 'react-native'
import { Icon, Input, Button } from '@ui-kitten/components'

const Login = () => {
    const [value,setvalue] = useState('')
    const [visible,setvisible] = useState(false) 


    const renderIcon=(props)=>{
        return (
            <TouchableWithoutFeedback
                onPress={()=>{
                    setvisible(!visible)
                }}
            >
                <Icon {...props} name={visible?'eye':'eye-off'}/>
            </TouchableWithoutFeedback>
        )
    }

    return (
        <View style={{flex:1,justifyContent:'center',alignItems:'center', paddingHorizontal:30}}>
            <Input
                value={value}
                style={{marginBottom:20}}
                label='Password'
                placeholder='password'
                caption='Shoul contain letters'
                accessoryRight={renderIcon}
                // captionIcon={AlertIcon}
                secureTextEntry={!visible}
                onChangeText={text=>setvalue(text)}
            />
            <Button
                style={{width:'100%'}}
            >
                Login
            </Button>
            
        </View>
    )


}

export default Login;