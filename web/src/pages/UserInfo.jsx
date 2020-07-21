import React, { useState } from 'react';
import Axios from 'axios';
import {APIURL} from '../supports/ApiUrl';
import { Card, Icon, Image, Select, Button, Input, Segment, Header, List, Grid } from 'semantic-ui-react';
import {connect} from 'react-redux'


const UserInfo=(props)=>{
    

    return (
        <div style={{}}>
            <Header as={'h4'}>Hello,</Header>
            <p>
                This app has 3 type of users, which are admin, buyer, and seller.
            </p>
            <p>
                Please use the following information for good use
            </p>
            <Segment>
                <Grid>
                    <Grid.Row>
                        <Grid.Column width={4}>
                            <div style={{fontWeight:'800'}}>
                                Role
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div style={{fontWeight:'800'}}>
                                Username
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div style={{fontWeight:'800'}}>
                                Password
                            </div>
                        </Grid.Column>
                    </Grid.Row>
                    <Grid.Row>
                        <Grid.Column width={4}>
                            <div>
                                Admin
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                indo
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                1234
                            </div>
                        </Grid.Column>
                    </Grid.Row>
                </Grid>
            </Segment>

            <div style={{fontWeight:'800',marginTop:'2em'}}>
                Popular Seller
            </div>
            <Segment>
                <Grid>
                    <Grid.Row>
                        <Grid.Column width={4}>
                            <div style={{fontWeight:'800'}}>
                                Merk
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div style={{fontWeight:'800'}}>
                                Username
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div style={{fontWeight:'800'}}>
                                Password
                            </div>
                        </Grid.Column>
                    </Grid.Row>
                    <Grid.Row>
                        <Grid.Column width={4}>
                            <div>
                                Uniqlo
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                tadashi
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                1234
                            </div>
                        </Grid.Column>
                    </Grid.Row>
                    <Grid.Row>
                        <Grid.Column width={4}>
                            <div>
                                Ortuseight
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                jokowi
                            </div>
                        </Grid.Column>
                        <Grid.Column width={6}>
                            <div>
                                1234
                            </div>
                        </Grid.Column>
                    </Grid.Row>
                </Grid>
            </Segment>
        </div>
    )
}

export default UserInfo;