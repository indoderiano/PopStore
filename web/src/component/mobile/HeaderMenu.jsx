import React from 'react'
import { Button, Header, Image, Modal, Menu, Icon } from 'semantic-ui-react'
import { useState } from 'react'
import { useRef } from 'react'
import HeaderItems from '../HeaderItems'





const MenuModal = () => {

    const [ismodal,setismodal] = useState(false)

    const renderButton=()=>{
        return (
            <Menu.Item 
              style={{
                display:'inline-block',
                // marginTop:'5px',
                float:'right',
                border:'1px solid rgba(255,255,255,.9)',
                borderRadius:'3px',
                width:'32px',
                height:'32px',
                display:'flex',
                justifyContent:'center',
                alignItems:'center'
              }}
              onClick={()=>{
                setismodal(true)
              }}
              // position='right'
            >
                <Icon name='bars' style={{margin:'0'}}/>
            </Menu.Item>
        )
    }

    return (
        <Modal 
            trigger={renderButton()}
            open={ismodal}
            onClose={()=>{setismodal(false)}}
            // closeIcon
            // open={open}
            style={{
              width:'300px',
              borderRadius:'4px',
              overflow:'hidden',
              position:'absolute',
              right:'3em',
              top:'60px',
              // transform:'translate(0,-50%)'
            }}
            // inverted
        >
          <Menu
              // fixed={this.props.fixed ? 'top' : null}
              inverted
              pointing
              secondary
              size='large'
              onClick={()=>{setismodal(false)}}
              style={{backgroundColor:'rgb(27, 28, 29)',margin:'0',padding:'1em 0',width:'100%'}}
              vertical
          >
            <HeaderItems/>
            
          </Menu>
      </Modal>
    )
} 

export default MenuModal