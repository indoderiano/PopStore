import React, { Component } from 'react'
import {
    Button,
    Menu,
    Icon,
    Label,
    Dropdown,
    Input,
  } from 'semantic-ui-react'
  import {Link} from 'react-router-dom'
import { idr, titleConstruct } from '../supports/services'
import {isLogout,LoginUser} from '../redux/actions'
import { connect } from 'react-redux'


class HeaderItems extends Component {
    state = { 
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
            <>
                {
                    this.props.isseller?
                    <Menu.Item as={Link} to='/seller' style={style.menu}>Seller</Menu.Item>
                    : null
                }
                {/* SALES */}
                {
                    this.props.User.isadmin?
                    <Menu.Item as={Link} to='/admin/sales' style={style.menu}>Sales</Menu.Item>
                    : null
                }
                {
                    this.props.User.isseller?
                    <Menu.Item as={Link} to='/seller/flashsales' style={style.menu}>Flashsale</Menu.Item>
                    : null
                }
                {
                    this.props.User.isadmin?
                    <Menu.Item as={Link} to='/admin/flashsales' style={style.menu}><Icon name='bolt'/>Manage Flashsale</Menu.Item>
                    : null
                }
                

                <Menu.Item 
                    style={{
                        padding:'0',
                    }}
                    position='right'
                >
                </Menu.Item>
                
                {
                    this.props.User.islogin?
                    <>
                    {// ADMIN MANAGE ORDERS
                        this.props.User.isadmin?
                        <Menu.Item 
                        as={Link}
                        to='/managetransactions'
                        style={style.menu}
                        // icon='cart'
                        >
                        <Icon name='list alternate'/>
                        Manage Transactions
                        {
                            this.props.Invoices.total?
                            <Label 
                            color='blue' 
                            // floating 
                            // style={{top:'-.5em',left:'85%',}}
                            style={{marginLeft:'.4em'}}
                            >
                            {this.props.Invoices.total}
                            </Label>
                            : null
                        }
                        </Menu.Item>
                        : null
                    }

                    {// SELLER MANAGE ORDERS
                        this.props.User.isseller?
                        <Menu.Item 
                        as={Link}
                        to='/manageorders'
                        style={style.menu}
                        // icon='cart'
                        >
                        <Icon name='list alternate'/>
                        Orders
                        {
                            this.props.Store.total?
                            <Label 
                            color='blue' 
                            // floating 
                            // style={{top:'-.5em',left:'85%',}}
                            style={{marginLeft:'.4em'}}
                            >
                            {this.props.Store.total}
                            </Label>
                            : null
                        }
                        </Menu.Item>
                        : null
                    }

                    {// USER MANAGE TRANSACTION
                        this.props.User.isuser?
                        <Menu.Item 
                        as={Link}
                        to='/transactions'
                        style={style.menu}
                        // icon='cart'
                        >
                        <Icon name='list alternate'/>
                        Transactions
                        {
                            this.props.Payment.total?
                            <Label 
                            color='blue' 
                            // floating 
                            // style={{top:'-.5em',left:'85%',}}
                            style={{marginLeft:'.4em'}}
                            >
                            {this.props.Payment.total}
                            </Label>
                            : null
                        }
                        </Menu.Item>
                        : null
                    }

                    {
                        this.props.User.isverified?
                        <Menu.Item 
                        as={Link}
                        to='/popcoin'
                        style={style.menu}
                        // icon='cart'
                        >
                        <Icon name='bitcoin' color='blue'/>
                        {idr(this.props.User.popcoin)}
                        </Menu.Item>
                        : null
                    }

                    {// CART
                        this.props.User.isuser?
                        <Menu.Item 
                            as={Link}
                            to='/cart'
                            style={style.menu}
                            // icon='cart'
                        >
                        <Icon name='cart'/>
                        Cart
                        {
                            this.props.Cart.totalitems?
                            <Label 
                            color='blue' 
                            // floating 
                            // style={{top:'-.5em',left:'85%',}}
                            style={{marginLeft:'.4em'}}
                            >
                            {this.props.Cart.totalitems}
                            </Label>
                            : null
                        }
                        </Menu.Item>
                        : null
                    }

                    </>
                    : null
                }
            </>
         );
    }
}

const style={
    menu:{
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

export default connect (MapstatetoProps,{isLogout,LoginUser}) (HeaderItems);