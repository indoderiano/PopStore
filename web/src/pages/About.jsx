import React, { Component } from 'react';
import Axios from 'axios';
import {APIURL} from '../supports/ApiUrl';
import { Card, Icon, Image, Select, Button, Input, Segment, Header, Label, Popup } from 'semantic-ui-react';
import {connect} from 'react-redux'
    

const style={
    label:{
        margin:'0 .5em .5em 0'
    }
}


class About extends Component {
    state = { 
        tick: true,
     }

    componentDidMount(){
        this.setTimer()
    }

    componentWillUnmount(){
        clearInterval(this.timer)
    }
    
    setTimer=()=>{
        this.timer = setInterval(() => {
            this.setState({tick:!this.state.tick})
            // console.log(!this.state.tick)
        }, 600);
    }

    renderInfo=()=>{
        return (
            <div style={{}}>
                <Header as={'h4'}>About</Header>
                <Segment placeholder style={{minHeight:'0px'}}>
                    <div>Note that,</div>
                    the hosting site is on sleep mode, so it takes a moment before it shows the app.
                </Segment>
                <p>
                    This is a simple marketplace commerce app.
                </p>
                <p>
                    Made with React JS with Semantic UI Framework, and Node JS and Express for back-end development. Using db4free.net as mysql database.
                </p>
                <p>
                    <span style={{display:'block'}}>Feature,</span>
                    Cloudinary for image hosting using rest API
                </p>
                <div>
                <Label style={style.label}>
                    React JS
                </Label>
                <Label style={style.label}>
                    Node JS
                </Label>
                <Label style={style.label}>
                    Express
                </Label>
                <Label style={style.label}>
                    Nodemailer
                </Label>
                <Label style={style.label}>
                    MySql
                </Label>
                <Label style={style.label}>
                    Cloudinary
                </Label>
                </div>
            </div>
        )
    }

    render() { 
        return ( 
            
            <Popup
                content={this.renderInfo()}
                basic
                on='click'
                flowing
                position='bottom center'
                style={{
                maxWidth:'450px'
                }}
                trigger={
                <Button style={{width:'100%',color:this.state.tick?'white':'rgba(255,255,255,.75)'}} color='orange'>
                    <Icon name='info circle'/>
                    About This App
                </Button>
                // <Label 
                //   as='a' 
                //   color='orange' 
                //   tag
                //   style={{
                //     position:'absolute',
                //     top:'70px',
                //     right:'20px',
                //   }}
                // >
                //   About this app
                // </Label>
                }
            />
         );
    }
}
 
export default About;