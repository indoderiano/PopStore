import React, { Component } from 'react';
import { Grid, Image, Button, Segment, Header, Card, Icon, Rating } from 'semantic-ui-react';
import Flashsale from '../component/FlashsaleHome'
import { NavLink, Link } from 'react-router-dom';
import MenPic from '../assets/images/Men.jpg'
import Axios from 'axios';
import { APIURL } from '../supports/ApiUrl';

class Home extends Component {
  state = {
      mostViewedProducts:[],
      recommendedProducts:[]
  }

  componentDidMount(){
      Axios.get(`${APIURL}/products/mostviewed`)
      .then((res)=>{
        this.setState({
          mostViewedProducts:res.data.mostviewed,
          recommendedProducts:res.data.recommended
        })
      }).catch((err)=>{
        console.log(err)
      })
  }

  renderMostViewed=()=>{
    // console.log(this.state.mostViewedProducts)
    // console.log(this.state.mostViewedProducts[0])
    // console.log( this.state.mostViewedProducts[0])
    if(this.state.mostViewedProducts.length){
      return this.state.mostViewedProducts.map((val,index)=>{
          return (                  
            <div key={index} style={{width:'22%', marginLeft:12, marginRight:12, marginBottom:20}}>
                <Link to={`/product/${val.idproduct}`}>
                    <Card raised style={{ paddingTop:5, height:'100%'}}>
                            <Image src={APIURL+ JSON.parse(val.imagecover)[0]} style={{height:'150px' }}/>
                        {/* <a style={{alignSelf:'center'}}>
                        </a> */}
                        <Card.Content style={{borderColor: 'transparent',}} >
                        <Card.Header style={{display:'block', overflow: 'hidden',}}>{val.product_name}</Card.Header>
                        <Card.Meta>{val.maincategory}</Card.Meta>
                        <Card.Description >
                            Rp.{val.price} <br/>
                            <Rating icon='star' rating={val.product_rating} maxRating={5} />
                        </Card.Description>
                        </Card.Content>
                        <Card.Content style={{textAlign:'center',alignSelf:'center'}} extra>
                            <Icon name='cart' />
                            Detail
                        {/* <a style={{fontSize:'20px', width:'100%'}} >
                        </a> */}
                        </Card.Content>
                    </Card>
                </Link>
            </div>
          ) 
      })
    }
  }

  renderRecommended=()=>{
    if(this.state.recommendedProducts.length){
      return this.state.recommendedProducts.map((val,index)=>{
            return (                  
              <div key={index} style={{width:'22%', marginLeft:12, marginRight:12, marginBottom:20}}>
                  <Link to={`/product/${val.idproduct}`}>
                      <Card raised style={{ paddingTop:5, height:'100%'}}>
                              <Image src={APIURL+ JSON.parse(val.imagecover)[0]} style={{height:'150px' }}/>
                          {/* <a style={{alignSelf:'center'}}>
                          </a> */}
                          <Card.Content style={{borderColor: 'transparent',}} >
                          <Card.Header style={{display:'block', overflow: 'hidden',}}>{val.product_name}</Card.Header>
                          <Card.Meta>{val.maincategory}</Card.Meta>
                          <Card.Description >
                              Rp.{val.price} <br/>
                              <Rating icon='star' rating={val.product_rating} maxRating={5} />
                          </Card.Description>
                          </Card.Content>
                          <Card.Content style={{textAlign:'center',alignSelf:'center'}} extra>
                              <Icon name='cart' />
                              Detail
                          {/* <a style={{fontSize:'20px', width:'100%'}} >
                          </a> */}
                          </Card.Content>
                      </Card>
                  </Link>
              </div>
           ) 
      })
    }
  }
  

  render() { 
    return ( 
          <Grid style={{padding:'20px 50px 50px'}}>
                  <Grid.Row>
                      <Grid.Column 
                        width={16} 
                        style={{
                          textAlign:'center',
                          padding:'1em'
                        }}
                      >
                        <Header 
                          as={'h1'} 
                          className='title-reveal'
                          style={{
                            fontFamily:'muli,sans-serif',
                            fontWeight:'100',
                            fontSize:45,
                            letterSpacing:10,
                            color:'rgba(0,0,0,.8)'
                          }}
                        >
                          POPSTORE
                        </Header>
                      </Grid.Column>

                      <Grid.Column width={8} style={{padding:'0',height:'350px',overflow:'hidden'}}>
                          <Image 
                            // src='/images/men.jpg'
                            src={MenPic}
                            style={{
                              minHeight:'100%',
                              maxHeight:'115%',
                              width:'auto',
                              maxWidth:'unset'
                            }}
                          />
                          <div style={{
                            position:'absolute',
                            top:'35%',
                            right:'2em',
                            transform:'translate(0,-50%)'
                          }}>
                            <Segment 
                              className='title-reveal'
                              circular 
                              style={{
                                width: 200, 
                                height: 200, 
                                // backgroundColor: '#898989'
                                backgroundColor: 'transparent'
                              }}
                            >
                              <Header as='h2' inverted style={{fontFamily:'muli,sans-serif',fontWeight:'100',fontSize:'36px'}}>
                                Casual
                                <Link to='/allproducts/men'>
                                    <Button inverted className='btn-shopnow' style={{padding:20, marginTop:30, borderWidth:'0.5px',fontWeight:100, textTransform:'uppercase', fontSize:'16px'}}>Shop Now</Button>
                                </Link>
                              </Header>
                            </Segment>
                          </div>
                      </Grid.Column>
                      
                      <Grid.Column 
                        width={8} 
                        style={{
                          padding:'0',
                          height:'350px',
                          overflow:'hidden',
                          position:'relative',
                          backgroundColor:'rgba(0,0,0,.88)',
                          // backgroundImage:`url(https://wallpapercave.com/wp/wp5444493.jpg)`,
                          // backgroundSize:'contain',
                          // backgroundRepeat:'no-repeat',
                          // backgroundPosition:'center'
                        }}
                      >
                        <Image 
                          src='https://wallpapercave.com/wp/wp5444493.jpg' 
                          centered
                          // size='medium'
                          style={{
                            position:'absolute',
                            top:'47%',
                            left:'70%',
                            transform:'translate(-50%,-50%)',
                            width:'280px'
                          }}  
                        />
                        <div style={{
                            position:'absolute',
                            top:'65%',
                            left:'2em',
                            transform:'translate(0,-50%)'
                          }}>
                            <Segment className='title-reveal' circular inverted style={{width: 200, height: 200,backgroundColor:'transparent'}}>
                              <Header as='h2' inverted style={{fontFamily:'muli,sans-serif',fontWeight:'100',fontSize:'36px'}}>
                                Sport
                                <Link to='/allproducts/women'>
                                    <Button inverted className='btn-shopnow' style={{padding:20, marginTop:30, borderWidth:'0.5px',fontWeight:100, textTransform:'uppercase', fontSize:'16px'}}>Shop Now</Button>
                                </Link>
                              </Header>
                            </Segment>
                          </div>
                      </Grid.Column>

                  </Grid.Row>
                  <div style={{width:'100%', borderWidth:'2px', borderColor:'black', padding:20, justifyContent: 'center', alignItems:'center', display: 'flex', flexDirection:'column' ,}}>
                    <div style={{width:'100%', textAlign:'center', marginBottom:20}}>
                      <Link to='search/recommended'><h2>Recommended Products</h2></Link>
                    </div> 
                    <div style={{width:'70%', textAlign:'center',display:'flex',justifyContent:'space-between'}}>
                        {this.renderRecommended()}
                    </div>
                  </div>
                  <div style={{width:'100%', borderWidth:'20px', borderColor:'black', padding:20, justifyContent: 'center', alignItems:'center', display: 'flex', flexDirection:'column' ,}}>
                    <div style={{width:'100%', textAlign:'center', marginBottom:20}}>
                    <Link to='search/mostviewed'><h2>Most Viewed Products</h2></Link>
                    </div>
                    <div style={{width:'70%', textAlign:'center',display:'flex',justifyContent:'space-between'}}>
                        {this.renderMostViewed()}
                    </div>
                  </div>

                  {/* INDO */}
                  {/* FLASHSALE */}
                  <Flashsale/>
          </Grid>
    );
  }
}
 
export default Home;