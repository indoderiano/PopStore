import React, { useState } from 'react';
import Axios from 'axios';
import {APIURL} from './../supports/ApiUrl';
import { Card, Icon, Image, Select, Button, Input, Segment, Header } from 'semantic-ui-react';
import {connect} from 'react-redux'
const Testimage=(props)=>{
    const [data1,setdata]=useState({
        image:undefined
    })

   const testimage=()=>{
       var formData=new FormData()
       var options={
           headers:{
            'Content-Type':'multipart/form-data'
              
           }
       }
       var data={
           caption:'test',

       }
       formData.append('image',data1.image)
       console.log(data1)
       
       formData.append('data', JSON.stringify(data))
       Axios.post(`${APIURL}/wishlist/postwishlist`,formData,options)
       .then((res)=>{
           console.log(res.data)
       }).catch((err)=>{
           console.log(err);
           
       })
   }


    return(
        <Segment style={{width:'100%'}}>
        <Header as={'h3'}> Photo</Header>
        <Input 
            type='file'
            multiple
            style={{marginRight:'1em'}}
            onChange={(e)=>setdata({image:e.target.files[0]})}
        />
        <Button onClick={testimage}>onclick</Button>
    </Segment>
    )
}
const MapStatetoProps=(state)=>{
    return state.Auth
  }
export default connect (MapStatetoProps)(Testimage)