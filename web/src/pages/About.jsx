import React, { useState } from 'react';
import Axios from 'axios';
import {APIURL} from '../supports/ApiUrl';
import { Card, Icon, Image, Select, Button, Input, Segment, Header, Label } from 'semantic-ui-react';
import {connect} from 'react-redux'


const About=(props)=>{
    

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
                Made with React JS with Semantic UI Framework, and Node JS and Express for back-end developmnet. Using db4free.net as mysql database.
            </p>
            <p>
                <div>Feature,</div>
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

const style={
    label:{
        margin:'0 .5em .5em 0'
    }
}

export default About;