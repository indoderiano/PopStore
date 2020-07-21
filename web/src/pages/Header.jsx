import React, { Component } from 'react'
import {
    Button,
    Menu,
    Dropdown,
    Input,
    Responsive,
    SegmentGroup,
    Dimmer,
    Loader,
    Popup,
    Label,
    Icon
  } from 'semantic-ui-react'
import UserInfo from './UserInfo'
import MenuModal from '../component/mobile/HeaderMenu'
import HeaderItems from '../component/HeaderItems'
import { connect } from "react-redux";
import {Link} from 'react-router-dom'
import {isLogout,LoginUser} from './../redux/actions'
import {titleConstruct,idr} from '../supports/services'
import Axios from 'axios';
import { APIURL } from '../supports/ApiUrl';


class MainHeader extends Component {
    state = { 
      useroptions : [
        { key: 1, text: 'Logout', value: 1 ,onClick:()=>{this.props.isLogout()}},
        { key: 2, text: 'Profile', value: 2, as:Link, to:'/profile' },
        { key: 3, text: 'Become A Seller', value: 3, as:Link, to:'/Sellerregister' },
      ],
      isloginclick: false,
      username:'',
      password:'',
     }

    onEnter=(e)=>{
      if(e.key=='Enter'){
          var data={
          username: this.state.username,
          password: this.state.password
          }
          this.props.LoginUser(data)
          this.setState({isloginclick:false,username:'',password:''})
      }
    }
    
    render() { 
        return (
          <SegmentGroup>
          
            <Responsive
              as={Menu}
              minWidth={768}
              // fixed={this.props.fixed ? 'top' : null}
              inverted
              pointing
              secondary
              size='large'
              style={{
                backgroundColor:'rgb(27, 28, 29)',
                margin:'0',
                padding:'7px 2em 14px',
                width:'100%'
              }}
              // vertical
            >
              <Menu.Item 
                as={Link} 
                to='/' 
                style={style.menu} 
                active
              >
                POPSTORE
              </Menu.Item>

              <HeaderItems/>     

              {
                this.props.User.islogin?
                <Menu.Item 
                  as='span' 
                  style={style.menu}
                >
                  <Dropdown
                      item
                      simple
                      text={`Hi, ${titleConstruct(this.props.User.username)}`}
                      style={{
                      padding:'0px',
                      }}
                      className='header-dropdown'
                      direction='left'
                      options={this.state.useroptions}
                  />
                </Menu.Item>  
                : 
                <Menu.Item 
                  style={{
                  padding:'0',
                  height:'32px'
                  }}
                  position='right'
                >
                    
                    {
                    !this.props.User.islogin?
                    <>
                      <Popup
                        content={<UserInfo/>}
                        on='click'
                        pinned
                        // flowing
                        position='bottom center'
                        style={{maxWidth:'350px'}}
                        trigger={
                          <Button
                            inverted
                            style={{marginRight:'2em',fontWeight:'200'}}
                          >
                            <Icon name='users'/> User info
                          </Button>
                        }
                      />
                      {
                        this.state.isloginclick?
                        <div style={{display:'inline-block'}}>
                            <Input
                            placeholder='username'
                            size='mini'
                            onChange={(e)=>{
                                this.setState({username:e.target.value})
                            }}
                            />
                            <Input
                            placeholder='password'
                            size='mini'
                            type='password'
                            style={{margin:'0 1em'}}
                            onChange={(e)=>{
                                this.setState({password:e.target.value})
                            }}
                            onKeyPress={this.onEnter}
                            />
                        </div>
                        :
                        <Button 
                            inverted={!this.props.fixed}
                            onClick={()=>{this.setState({isloginclick:true})}}
                        >
                          Log in
                          {
                            this.props.User.loading?
                            <Dimmer active>
                              <Loader size='small'/>
                            </Dimmer>
                            // <Loader active/>
                            : null
                          }
                        </Button>
                        }
                        <Button as={Link} to='/register' inverted={!this.props.fixed} primary={this.props.fixed} style={{ marginLeft: '0.5em' }}>
                        Sign Up
                        </Button>
                    </>
                    :  null
                    // <Button as={Link} to='/' inverted onClick={()=>{this.props.isLogout()}}>
                    //   Log out
                    // </Button>
                    }
                </Menu.Item>
              }
                
            </Responsive>


            {/* MOBILE RESPONSIVE */}
            <Responsive
              as={Menu}
              maxWidth={767}
              // fixed={this.props.fixed ? 'top' : null}
              inverted
              pointing
              secondary
              size='large'
              style={{backgroundColor:'rgb(27, 28, 29)',margin:'0',padding:'7px 2em 14px'}}
              // vertical
            >
              <Menu.Item 
                as={Link} 
                to='/' 
                style={style.menu} 
                active
              >
                POPSTORE
              </Menu.Item>

              <Menu.Item 
                style={{
                padding:'0',
                height:'32px'
                }}
                position='right'
              >
                  
                  {
                  !this.props.User.islogin?
                  <>
                    <Popup
                      content={<UserInfo/>}
                      on='click'
                      pinned
                      flowing
                      position='left center'
                      trigger={
                        <Button 
                          content='Button'
                          // style={{
                          //   position:'absolute',
                          //   top:'70px',
                          //   right:'20px',
                          //   zIndex:'99'
                          // }}
                        />
                      }
                    />
                    {
                      this.state.isloginclick?
                      <div style={{display:'inline-block'}}>
                          <Input
                          placeholder='username'
                          size='mini'
                          onChange={(e)=>{
                              this.setState({username:e.target.value})
                          }}
                          />
                          <Input
                          placeholder='password'
                          size='mini'
                          type='password'
                          style={{margin:'0 1em'}}
                          onChange={(e)=>{
                              this.setState({password:e.target.value})
                          }}
                          onKeyPress={this.onEnter}
                          />
                      </div>
                      :
                      <Button 
                          inverted={!this.props.fixed}
                          onClick={()=>{this.setState({isloginclick:true})}}
                      >
                          Log in
                      </Button>
                      }
                      <Button as={Link} to='/register' inverted={!this.props.fixed} primary={this.props.fixed} style={{ marginLeft: '0.5em' }}>
                      Sign Up
                      </Button>
                  </>
                  :  null
                  // <Button as={Link} to='/' inverted onClick={()=>{this.props.isLogout()}}>
                  //   Log out
                  // </Button>
                  }
              </Menu.Item>

              {
                this.props.User.islogin?
                <>
                  <Menu.Item 
                    as='span' 
                    style={style.menu}
                    position='right'
                  >
                    <Dropdown
                        item
                        simple
                        text={`Hi, ${titleConstruct(this.props.User.username)}`}
                        style={{
                        padding:'0px',
                        }}
                        className='header-dropdown'
                        direction='left'
                        options={this.state.useroptions}
                    />
                  </Menu.Item>  
                  <MenuModal/>
                </>
                : null

              }
                
            </Responsive>

          </SegmentGroup>
        )
    }
}

const style={
  menu:{
    // display:'inline-block',
    marginTop:'5px',
    padding:'.6em 1em'
  }
}

const MapstatetoProps=(state)=>{
    return {
        User: state.Auth,
        Cart: state.Cart,
        Payment: state.Payment,
        Store: state.Store,
        Invoices: state.Invoices,
        Seller: state.Seller,
    }
}
 
export default connect (MapstatetoProps,{isLogout,LoginUser}) (MainHeader);