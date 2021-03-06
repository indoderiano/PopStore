import React ,{Component} from 'react'
import Axios from 'axios'
// import {APIURL} from '../../supports/ApiUrl'
import {APIURL} from '../../supports/ApiUrl'
import {
    Grid,
    Header,
    Image,
    Form,
    Segment,
    Button,
    Message,
    Container,
    Input,
    TextArea,
    Checkbox,
    Icon,
    Divider,
    Dimmer,
    Loader,
    Label
} from 'semantic-ui-react'
import {idr} from '../../supports/services'
import {Redirect} from 'react-router-dom'
import { connect } from 'react-redux'



class ProductItems extends Component {
    state = { 
        coverloading:true,
        itemloading:true,

        access:true,

        idseller:0,

        // Product
        pageloading:true,
        product:{
            isdeleted: false
        },
        deletecoverimageindex:-1,
        loadingcoverdelete:false,
        // coverimage:[],
        loadingcoveradd:false,
        editproduct:false,
        deleteproduct:false,
        newproductname:'',
        newdescription:'',
        loadingeditproduct:false,
        loadingprogressproduct:[],

        errorcover:'',

        // Items
        items:[],
        editid:0,
        price:0,
        stock:0,
        // image:[],
        loadingimageaddid:0,
        loadingedit:false,
        loadingprogressitem:[],

        deleteimageiditem:-1,
        deleteimageindex:-1,
        loadingimagedelete:false,

        errorimage:'',


        // Deleted Product
        permitproduct:false
    }

    componentDidMount=()=>{
        this.getProduct()
        this.getItems()
    }

    getProduct=()=>{
        
        Axios.get(`${APIURL}/products/get/${this.props.match.params.idproduct}`)
        .then((res)=>{
            // console.log('product data',res.data)
            // CHECK ACCESS
            if(this.props.Seller.idseller==res.data.idseller){
                this.setState({product:res.data,coverloading:false})
            }else{
                this.setState({product:res.data,coverloading:false,access:false})
            }
        }).catch((err)=>{
            console.log(err)
        })

    }
    
    getItems=()=>{

        Axios.get(`${APIURL}/items?idproduct=${this.props.match.params.idproduct}`)
        .then((res)=>{
            console.log(res.data)
            this.setState({items:res.data,itemloading:false,pageloading:false})
        }).catch((err)=>{
            console.log(err)
        })
    }

    onAddCover=async (files,cover,coverids)=>{
        this.setState({loadingcoveradd:true})
        if(files.length>5){
            // error message
            this.setState({errorcover:'Jumlah upload image tidak bisa lebih dari 5',loadingcoveradd:false})
        }else{
            console.log('add cover image')

            // CREATE LOADING PROGRESS VALUE
            var loadingprogress=[]
            for(var j=0;j<files.length;j++){
                loadingprogress[j]=0
            }
            // console.log('create loading progress',loadingprogress)
            this.setState({loadingprogressproduct:loadingprogress})

            // for(var image of files){
            for(var i=0;i<files.length;i++){

                var formdata=new FormData()

                formdata.append('photo',files[i])

                var data={
                    imagecover: this.isJson(cover),
                    cover_public_id: this.isJson(coverids),
                    store: this.props.Seller.namatoko
                }
    
                formdata.append('data',JSON.stringify(data))
    
                const config = {
                    onUploadProgress: progressEvent => {
                        // console.log(progressEvent.loaded)
                        // console.log(progressEvent.total)
                        var progress = Math.round((progressEvent.loaded * 100.0) / progressEvent.total);
                        console.log('progress',progress)
                        var loading=this.state.loadingprogressproduct
                        loading[i]=progress
                        this.setState({loadingprogressproduct:loading})
                    },
                    header:{
                        'Content-Type': 'multipart/form-data',
                    }
                }

                try{
                    console.log('add cover image')
                    var res= await Axios.put(`${APIURL}/products/image/cloudinary/${this.state.product.idproduct}`,formdata,config)

                    document.getElementById('cover').value='' // clear input file image
                    this.getProduct()
                    cover=res.data.imagecover
                    coverids=res.data.cover_public_id
                }catch(err){
                    this.setState({loadingcoveradd:false})
                    console.log(err)
                }
            }
            console.log('berhasil update cover image')
            this.setState({coverimage:[],loadingcoveradd:false})

        }
    }

    onDeleteCover=(index,oldids,oldcover)=>{

        this.setState({loadingcoverdelete:true})

        var data={
            imagecover: oldcover,
            cover_public_id: oldids
        }

        Axios.put(`${APIURL}/products/image/cloudinary/${this.state.product.idproduct}/${index}`,data)
        .then((res)=>{
            console.log('berhasil delete cover')
            this.setState({deletecoverimageindex:-1})
            this.getProduct()
        }).catch((err)=>{
            console.log(err)
        }).finally(()=>{
            this.setState({loadingcoverdelete:false})
        })

    }

    onSubmitProduct=()=>{
        this.setState({loadingeditproduct:true})
        var edit={
            product_name: this.state.newproductname,
            description: this.state.newdescription
        }

        Axios.put(`${APIURL}/products/${this.state.product.idproduct}`,edit)
        .then((res)=>{
            console.log('berhasil update product')
            this.getProduct()
            this.setState({editproduct:false,loadingeditproduct:false})
        }).catch((err)=>{
            console.log(err)
        })

    }

    onDeleteProduct=()=>{
        var edit={
            isdeleted: true
        }

        Axios.put(`${APIURL}/products/${this.state.product.idproduct}`,edit)
        .then((res)=>{
            console.log('berhasil delete product')
            this.getProduct()
            this.setState({deleteproduct:false})
        }).catch((err)=>{
            console.log(err)
        })
    }

    onUnblockProduct=()=>{

        var edit={
            isdeleted: false
        }

        Axios.put(`${APIURL}/products/${this.state.product.idproduct}`,edit)
        .then((res)=>{
            console.log('berhasil unblock product')
            this.getProduct()
            this.setState({permitproduct:false})
        }).catch((err)=>{
            console.log(err)
        })

    }

    onAddPhoto=async (files,iditem,image,image_public_id)=>{
        this.setState({loadingimageaddid:iditem})
        if(files.length>5){
            // error message
            this.setState({errorimage:'Jumlah upload image tidak bisa lebih dari 5',loadingimageaddid:0})
        }else{

            // CREATE LOADING PROGRESS VALUE
            var loadingprogress=[]
            for(var j=0;j<files.length;j++){
                loadingprogress[j]=0
            }
            // console.log('create loading progress',loadingprogress)
            this.setState({loadingprogressitem:loadingprogress})
            
            // for(var file of files){
            for(var i=0;i<files.length;i++){
                console.log('add image')
                
                var formdata=new FormData()

                formdata.append('photo',files[i])

                var data={
                    image: this.isJson(image),
                    image_public_id: this.isJson(image_public_id),
                    store: this.props.Seller.namatoko
                }
    
                formdata.append('data',JSON.stringify(data))
    
                const config = {
                    onUploadProgress: progressEvent => {
                        // console.log(progressEvent.loaded)
                        // console.log(progressEvent.total)
                        var progress = Math.round((progressEvent.loaded * 100.0) / progressEvent.total);
                        console.log('progress',progress)
                        var loading=this.state.loadingprogressitem
                        loading[i]=progress
                        this.setState({loadingprogressitem:loading})
                    },
                    header:{
                        'Content-Type': 'multipart/form-data',
                    }
                }

                try{
                    var res = await Axios.put(`${APIURL}/items/image/cloudinary/${iditem}`,formdata,config)

                    image=res.data.image
                    image_public_id=res.data.image_public_id
                    this.getItems()
                }catch(err){
                    this.setState({loadingimageaddid:0})
                    console.log(err)
                }
                    
            }
            
            console.log('berhasil update item')
            this.setState({image:[],loadingimageaddid:0})
            document.getElementById(iditem).value=''
        }

    }

    onDeletePhoto=(iditem,index,imageids,image)=>{

        this.setState({loadingimagedelete:true})

        var data={
            image,
            imageids
        }

        Axios.put(`${APIURL}/items/image/cloudinary/${iditem}/${index}`,data)
        .then((res)=>{
            console.log('berhasil delete image')
            this.setState({deleteimageiditem:-1,deleteimageindex:-1})
            this.getItems()
        }).catch((err)=>{
            console.log(err)
        }).finally(()=>{
            this.setState({loadingimagedelete:false})
        })
    }

    onSubmit=()=>{
        this.setState({loadingedit:true})
        var edit={
            price:this.state.price?this.state.price:0,
            stock:this.state.stock?this.state.stock:0
        }

        Axios.put(`${APIURL}/items/${this.state.editid}`,edit)
        .then((res)=>{
            console.log('berhasil update item')
            this.setState({editid:0,stock:0,price:0,loadingedit:false})
            this.getItems()
        }).catch((err)=>{
            console.log(err)
        })

        // Axios.put(`${APIURL}/items/${this.state.editid}`,edit)
        // .then((res)=>{
        //     console.log('berhasil update item')
        //     this.setState({editid:0,stock:0,price:0})
        //     this.getItems()
        // }).catch((err)=>{
        //     console.log(err)
        // })
    }

    isJson=(data)=>{
        try{
            if(data==null||data==''){
                return []
            }
            return JSON.parse(data)
        }catch{
            return []
        }
    }

    renderuploadproductprogress=()=>{
        // COUNT PROGRESS
        var progress=0
        this.state.loadingprogressproduct.forEach((val)=>{
            progress+=val/2/this.state.loadingprogressproduct.length

            // UPLOAD CLOUDINARY PROGRESS
            // FIX ALGORITHM (MADE UP VALUE)
            if(val==100&&progress>100/2/this.state.loadingprogressproduct.length){
                progress+=100/2/this.state.loadingprogressproduct.length
            }
        })
        return (
            <Label
                style={{
                    position:'absolute',
                    top:'0',
                    left:'0',
                    width:`${progress}%`,
                    height:'2px',
                    // backgroundColor:'blue',
                    transition:'all ease .3s',
                    padding:'0',
                    margin:'0'
                }}
                color='blue'
            />
        )
    }

    renderProduct=()=>{
        if(this.state.product.imagecover){
            // console.log(this.state.product.imagecover)
            var coverimages=this.isJson(this.state.product.imagecover)
            // console.log('cover images',coverimages)
            var coverids=this.isJson(this.state.product.cover_public_id)
        }

        return (
            <Segment>
                <Grid>
                    <Grid.Row>
                        <Grid.Column width={16}>
                            <Header as={'h4'}>Cover Photo</Header>
                        </Grid.Column>
                    </Grid.Row>
                    <Grid.Row style={{padding:'0 1rem'}}>
                        {
                            // OPTIONAL CHAINING OPERATOR
                            coverimages?.length?
                            // Array.isArray(coverimages)&&coverimages.length?
                            coverimages.map((image,index)=>{
                                // console.log(image)
                                return (
                                    <Grid.Column key={index} width={4} style={{padding:'.5em 1em .5em 0'}}>
                                        <Segment 
                                            style={{padding:'.5em',width:'100%',textAlign:'center'}}
                                            loading={this.state.coverloading}
                                        >
                                            <div 
                                                style={{
                                                    paddingTop:'80%',
                                                    backgroundImage:`url('${image}')`,
                                                    backgroundSize:'contain',
                                                    backgroundRepeat:'no-repeat',
                                                    backgroundPosition:'center',
                                                    marginBottom:'1em'
                                                }}
                                            />
                                            {
                                                index===this.state.deletecoverimageindex?
                                                <Button 
                                                    basic
                                                    color='red'
                                                    onClick={()=>{this.onDeleteCover(index,coverids,coverimages)}}
                                                >
                                                    Confirm
                                                    <Dimmer 
                                                        active={index==this.state.deletecoverimageindex&&this.state.loadingcoverdelete}
                                                        inverted
                                                    >
                                                        <Loader inverted>Deleting</Loader>
                                                    </Dimmer>
                                                </Button>
                                                :
                                                <Button 
                                                    basic
                                                    onClick={()=>{this.setState({deletecoverimageindex:index})}}
                                                >
                                                    Remove
                                                </Button>

                                            }
                                        </Segment>
                                    </Grid.Column>
                                )
                            })
                            : 
                            <Grid.Column width={4} style={{padding:'.5em 1em .5em 0'}}>
                                <Segment 
                                    style={{padding:'.5em',width:'100%',textAlign:'center'}}
                                    loading={this.state.coverloading}    
                                >
                                    <div 
                                        style={{
                                            paddingTop:'80%',
                                            backgroundImage:`url(https://react.semantic-ui.com/images/wireframe/image.png)`,
                                            backgroundSize:'contain',
                                            backgroundRepeat:'no-repeat',
                                            backgroundPosition:'center',
                                            marginBottom:'1em'
                                        }}
                                    />
                                    <Button basic disabled>No Images</Button>
                                </Segment>
                            </Grid.Column>
                        }
                        
                        <Grid.Column width={16} style={{margin:'1em 0',padding:'0'}}>
                            <Segment
                                placeholder
                                style={{
                                    minHeight:'unset'
                                }}
                                onDragEnter={(e)=>{
                                    e.stopPropagation()
                                    e.preventDefault()
                                }}
                                onDragOver={(e)=>{
                                    e.stopPropagation()
                                    e.preventDefault()
                                }}
                                onDrop={(e)=>{
                                    e.stopPropagation()
                                    e.preventDefault()
                                    var files=e.dataTransfer.files
                                    console.log(files)
                                    if(files){
                                        this.onAddCover(files,this.state.product.imagecover,this.state.product.cover_public_id)
                                    }
                                }}
                            >
                                <Container
                                    style={{
                                        flex:1,
                                        border:'3px solid rgba(0,0,0,.6)',
                                        borderStyle: 'dashed',
                                        padding:'1em 0',
                                        display:'flex',
                                        flexDirection:'column',
                                        justifyContent:'center',
                                        alignItems:'center',
                                        color:'rgba(0,0,0,.6)'
                                    }}
                                >
                                    <Icon name='download' size='big'/>
                                    <div style={{fontSize:'14px',fontWeight:'800',margin:'.5em 0'}}>
                                        Drag And Drop Images Here
                                    </div>
                                    <div style={{color:'rgba(0,0,0,.8)',fontSize:'14px',fontWeight:'800',margin:'0em 0 .5em'}}>
                                        Or
                                    </div>
                                    <Input
                                        type='file'
                                        id='cover'
                                        multiple
                                        size='small'
                                        style={{marginRight:'1em'}}
                                        onChange={(e)=>{
                                            // CONVERT INTO ARRAY
                                            var files=[]
                                            for(var file of e.target.files){
                                                files.push(file)
                                            }

                                            // var files=e.target.files
                                            if(files){
                                                // console.log(files)
                                                // this.setState({coverimage:files})
                                                this.onAddCover(files,this.state.product.imagecover,this.state.product.cover_public_id)
                                            }
                                        }}
                                    />
                                    <Dimmer 
                                        active={this.state.loadingcoveradd} 
                                        inverted
                                    >
                                        <Loader inverted>Uploading Image(s)</Loader>
                                        {this.renderuploadproductprogress()}
                                    </Dimmer>
                                </Container>
                            </Segment>
                            {/* <Button
                                basic
                                primary
                                loading={this.state.loadingcoveradd}
                                style={{height:'100%'}}
                                onClick={()=>{this.onAddCover()}}
                            >
                                Add
                            </Button> */}
                        </Grid.Column>
                        {
                            this.state.errorcover?
                            <Grid.Column width={16}>
                                <span style={{color:'red'}}>{this.state.errorcover}</span>
                            </Grid.Column>
                            : null
                        }
                    </Grid.Row>

                    <Divider />

                    {
                        this.state.editproduct?
                        <Grid.Row>
                            <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                <span style={{display:'block'}}>Product Name</span>
                                <Input
                                    placeholder='Product Name'
                                    value={this.state.newproductname}
                                    onChange={(e)=>{this.setState({newproductname:e.target.value})}}
                                />
                            </Grid.Column>
                            <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                <span style={{display:'block'}}>Description</span>
                                <Form>
                                    <TextArea
                                        placeholder='Description'
                                        style={{maxWidth:'500px'}}
                                        value={this.state.newdescription}
                                        onChange={(e)=>{this.setState({newdescription:e.target.value})}}
                                    />
                                </Form>
                            </Grid.Column>

                            <Grid.Column width={16} style={{textAlign:'right'}}>
                                <Button
                                    primary
                                    loading={this.state.loadingeditproduct}
                                    disabled={this.state.loadingeditproduct}
                                    onClick={this.onSubmitProduct}
                                >
                                    Submit
                                </Button>
                                <Button
                                    // primary
                                    onClick={()=>{this.setState({
                                        editproduct:false
                                    })}}
                                >
                                    Cancel
                                </Button>
                            </Grid.Column>

                        </Grid.Row>
                        :
                        <Grid.Row>
                            <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                <span >Product Name:</span>
                                <span style={{fontWeight:600,marginLeft:'.5em'}}>{this.state.product.product_name}</span>
                            </Grid.Column>
                            <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                <span>Description:</span>
                                <p style={{fontWeight:300,marginTop:'.5em'}}>{this.state.product.description}</p>
                            </Grid.Column>

                            {
                                this.state.deleteproduct?
                                <Grid.Column width={16} style={{textAlign:'right'}}>
                                    <Button
                                        color='red'
                                        onClick={this.onDeleteProduct}
                                    >
                                        Confirm
                                    </Button>
                                    <Button
                                        // primary
                                        onClick={()=>{this.setState({
                                            deleteproduct:false
                                        })}}
                                    >
                                        Cancel
                                    </Button>
                                </Grid.Column>
                                :
                                <Grid.Column width={16} style={{textAlign:'right'}}>
                                    <Button
                                        primary
                                        basic
                                        onClick={()=>{this.setState({
                                            editproduct:true,
                                            newproductname:this.state.product.product_name,
                                            newdescription:this.state.product.description
                                        })}}
                                    >
                                        Edit
                                    </Button>
                                    <Button
                                        basic
                                        color='red'
                                        onClick={()=>{this.setState({
                                            deleteproduct:true
                                        })}}
                                    >
                                        Delete
                                    </Button>
                                </Grid.Column>

                            }

                        </Grid.Row>
                    }

                </Grid>
            </Segment>

        )
    }

    renderProductIsDeleted=()=>{
        if(this.state.product.imagecover){
            // console.log(this.state.product.imagecover)
            var coverimages=this.isJson(this.state.product.imagecover)
            // console.log(coverimages)
        }

        return (
            <Segment>
                <Grid>
                    <Grid.Row>
                        <Grid.Column width={16}>
                            <Header as={'h4'}>Cover Photo</Header>
                        </Grid.Column>
                        <div style={{
                            position:'absolute',
                            top:'0',
                            left:'0',
                            width:'100%',
                            height:'100%',
                            background:'rgba(255,255,255,.5)'
                        }}/>
                    </Grid.Row>
                    <Grid.Row style={{padding:'0 1rem'}}>
                        {
                            // OPTIONAL CHAINING OPERATOR
                            coverimages?.length?
                            coverimages.map((image,index)=>{
                                // console.log(image)
                                return (
                                    <Grid.Column key={index} width={4} style={{padding:'.5em 1em .5em 0'}}>
                                        <Segment style={{padding:'.5em',width:'100%',textAlign:'center'}}>
                                            <div 
                                                style={{
                                                    paddingTop:'80%',
                                                    backgroundImage:`url('${image}')`,
                                                    backgroundSize:'contain',
                                                    backgroundRepeat:'no-repeat',
                                                    backgroundPosition:'center',
                                                    marginBottom:'1em'
                                                }}
                                            />
                                            <Button 
                                                disabled
                                                basic
                                            >
                                                Remove
                                            </Button>
                                        </Segment>
                                    </Grid.Column>
                                )
                            })
                            : 
                            <Grid.Column width={4} style={{padding:'.5em 1em .5em 0'}}>
                                <Segment 
                                    style={{padding:'.5em',width:'100%',textAlign:'center'}}
                                    loading={this.state.coverloading}    
                                >
                                    <div 
                                        style={{
                                            paddingTop:'80%',
                                            backgroundImage:`url(https://react.semantic-ui.com/images/wireframe/image.png)`,
                                            backgroundSize:'contain',
                                            backgroundRepeat:'no-repeat',
                                            backgroundPosition:'center',
                                            marginBottom:'1em'
                                        }}
                                    />
                                    <Button basic disabled>No Images</Button>
                                </Segment>
                            </Grid.Column>
                        }
                        
                        {/* <Grid.Column width={16} style={{margin:'1em 0',padding:'0'}}>
                            <Input 
                                disabled
                                type='file'
                                id='cover'
                                multiple
                                style={{marginRight:'1em'}}
                                // onChange={(e)=>{
                                //     if(e.target.files){
                                //         // console.log(e.target.files)
                                //         this.setState({coverimage:e.target.files})
                                //     }
                                // }}
                            />
                            <Button
                                disabled
                                basic
                                primary
                                style={{height:'100%'}}
                                onClick={()=>{this.onAddCover()}}
                            >
                                Add
                            </Button>
                        </Grid.Column> */}
                        <div style={{
                            position:'absolute',
                            top:'0',
                            left:'0',
                            width:'100%',
                            height:'100%',
                            background:'rgba(255,255,255,.5)'
                        }}/>
                    </Grid.Row>

                    <Divider />

                        
                    <Grid.Row>
                        <Grid.Column width={16} style={{marginBottom:'1em'}}>
                            <span >Product Name:</span>
                            <span style={{fontWeight:600,marginLeft:'.5em'}}>{this.state.product.product_name}</span>
                            <div style={{
                                position:'absolute',
                                top:'0',
                                left:'0',
                                width:'100%',
                                height:'100%',
                                background:'rgba(255,255,255,.5)'
                            }}/>
                        </Grid.Column>
                        <Grid.Column width={16} style={{marginBottom:'1em'}}>
                            <span>Description:</span>
                            <p style={{fontWeight:300,marginTop:'.5em'}}>{this.state.product.description}</p>
                            <div style={{
                                position:'absolute',
                                top:'0',
                                left:'0',
                                width:'100%',
                                height:'100%',
                                background:'rgba(255,255,255,.5)'
                            }}/>
                        </Grid.Column>

                        {
                            this.state.permitproduct?
                            <Grid.Column width={16} style={{textAlign:'right'}}>
                                <Button
                                    primary
                                    onClick={this.onUnblockProduct}
                                >
                                    Confirm
                                </Button>
                                <Button
                                    // primary
                                    onClick={()=>{this.setState({
                                        permitproduct:false
                                    })}}
                                >
                                    Cancel
                                </Button>
                            </Grid.Column>
                            :
                            <Grid.Column width={16} style={{textAlign:'right'}}>
                                <Button
                                    primary
                                    onClick={()=>{this.setState({
                                        permitproduct:true
                                    })}}
                                >
                                    Unblock
                                </Button>
                                {/* <Button
                                    color='red'
                                    onClick={()=>{this.setState({
                                        deleteproduct:true
                                    })}}
                                >
                                    Delete
                                </Button> */}
                            </Grid.Column>

                        }

                    </Grid.Row>
                    <div style={{
                        position:'absolute',
                        top:'50%',
                        left:'0',
                        width:'100%',
                        // height:'100%',
                        textAlign:'center'
                    }}>
                        <Header as={'p'} style={{fontSize:'40px',color:'rgba(0,0,0,.7)'}}>Deleted</Header>
                    </div>
                </Grid>

                
            </Segment>
        )
    }

    renderuploaditemprogress=()=>{
        // COUNT PROGRESS
        var progress=0
        this.state.loadingprogressitem.forEach((val)=>{
            progress+=val/2/this.state.loadingprogressitem.length

            // UPLOAD CLOUDINARY PROGRESS
            // FIX ALGORITHM (MADE UP VALUE)
            if(val==100&&progress>100/2/this.state.loadingprogressitem.length){
                progress+=100/2/this.state.loadingprogressitem.length
            }
        })
        return (
            <Label
                style={{
                    position:'absolute',
                    top:'0',
                    left:'0',
                    width:`${progress}%`,
                    height:'2px',
                    // backgroundColor:'blue',
                    transition:'all ease .3s',
                    padding:'0',
                    margin:'0'
                }}
                color='blue'
            />
        )
    }

    renderItems=()=>{
        return this.state.items.map((item,index)=>{
            // console.log(item.image)
            const type=this.isJson(item.type)
            const image=this.isJson(item.image)
            const imageids=this.isJson(item.image_public_id)
            // console.log('image',image)
            return (
                <Segment key={index} style={{width:'100%'}}>
                    <Grid>
                        {
                            type.length?
                            <>
                            <Grid.Row style={{paddingBottom:'0'}}>
                                <Grid.Column width={16}>
                                    <Header as={'h4'} style={{width:'100%'}}>Type</Header>
                                </Grid.Column>
                                <Grid.Column width={4}>
                                    {
                                        type.length?
                                        type.map((itemtype,index)=>{
                                            return (
                                                <span key={index} style={{margin:'0 .5em 0 0',padding:'0'}}>{itemtype?itemtype:'no type'}</span>
                                            )
                                        })
                                        :
                                        <span key={index} style={{margin:'0 .5em 0 0',padding:'0'}}>no type</span>
                                    }
                                </Grid.Column>
                            </Grid.Row>
                            <Divider />
                            <Grid.Row style={{paddingBottom:'0'}}>
                                <Grid.Column width={16}>
                                    <Header as={'h4'} style={{width:'100%',marginBottom:'.5em'}}>Images</Header>
                                </Grid.Column>
                            </Grid.Row>
                            </>
                            : null
                        }
                        

                          
                        <Grid.Row style={{padding:'0 1rem',display:type.length?'flex':'none'}}>
                            {/* <Grid.Column 
                                width={16} 
                                style={{
                                    marginBottom:'1em',
                                    display:'flex',
                                    flexDirection:'row',
                                    alignItems:'flex-end',
                                    flexWrap:'wrap'
                                }}
                            > */}
                                {
                                    // Array.isArray(image)&&image.length?
                                    // OPTIONAL CHAINING OPERATOR
                                    image?.length?
                                    image.map((path,index)=>{
                                        return (
                                                
                                            // <div
                                            //     key={index}
                                            //     style={{
                                            //         // width:'25%',
                                            //         display:'inline-block',
                                            //         textAlign:'center',
                                            //         padding:'.5em 1em .5em 0',
                                            //         display:'flex',
                                            //         flexBasis:'25%',
                                            //         // flexDirection:'row'
                                            //     }}
                                            // >   
                                            <Grid.Column key={index} width={4} style={{padding:'.5em 1em .5em 0'}}>
                                                <Segment 
                                                    style={{padding:'.5em',width:'100%',textAlign:'center'}}
                                                    loading={this.state.itemloading}
                                                >
                                                    <div 
                                                        style={{
                                                            paddingTop:'80%',
                                                            backgroundImage:`url('${path}')`,
                                                            backgroundSize:'contain',
                                                            backgroundRepeat:'no-repeat',
                                                            backgroundPosition:'center',
                                                            marginBottom:'1em'
                                                        }}
                                                    />
                                                    {
                                                        item.iditem===this.state.deleteimageiditem&&index===this.state.deleteimageindex?
                                                        <Button 
                                                            basic
                                                            color='red'
                                                            onClick={()=>{this.onDeletePhoto(item.iditem,index,imageids,image)}}
                                                        >
                                                            Confirm
                                                            <Dimmer 
                                                                active={item.iditem===this.state.deleteimageiditem&&index===this.state.deleteimageindex&&this.state.loadingimagedelete}
                                                                inverted
                                                            >
                                                                <Loader inverted>Deleting</Loader>
                                                            </Dimmer>
                                                        </Button>
                                                        :
                                                        <Button 
                                                            basic
                                                            onClick={()=>{this.setState({deleteimageiditem:item.iditem,deleteimageindex:index})}}
                                                        >
                                                            Remove
                                                        </Button>

                                                    }
                                                </Segment>
                                            </Grid.Column>
                                            // </div>
                                        )
                                    })
                                    :
                                    <>
                                    <Grid.Column key={index} width={4} style={{padding:'.5em 1em .5em 0'}}>
                                        <Segment 
                                            style={{padding:'.5em',width:'100%',textAlign:'center'}}
                                            loading={this.state.itemloading}    
                                        >
                                            <div 
                                                style={{
                                                    paddingTop:'80%',
                                                    backgroundImage:`url(https://react.semantic-ui.com/images/wireframe/image.png)`,
                                                    backgroundSize:'contain',
                                                    backgroundRepeat:'no-repeat',
                                                    backgroundPosition:'center',
                                                    marginBottom:'1em'
                                                }}
                                            />
                                            <Button basic disabled>No Images</Button>
                                        </Segment>
                                    </Grid.Column>
                                    <Grid.Column width={4} style={{padding:'.5em 1em .5em 0'}}>
                                        <Message style={{height:'100%'}}>
                                            if no image uploaded, cover image(s) will be shown 
                                        </Message>
                                    </Grid.Column>
                                    </>
                                }


                                {/* ADD PHOTO */}
                                {/* <div
                                    style={{
                                        width:'25%',
                                        display:'inline-block',
                                        textAlign:'center',
                                        padding:'.5em 1em .5em 0',
                                        display:'flex',
                                        flexDirection:'row'
                                    }}
                                >   
                                    <Segment style={{padding:'.5em',width:'100%'}}>
                                        <div 
                                            style={{
                                                paddingTop:'80%',
                                                backgroundImage:`url(https://react.semantic-ui.com/images/wireframe/image.png)`,
                                                backgroundSize:'contain',
                                                backgroundRepeat:'no-repeat',
                                                backgroundPosition:'center',
                                                marginBottom:'1em'
                                            }}
                                        />
                                        <Button basic primary>Add</Button>
                                    </Segment>
                                </div> */}
                            {/* </Grid.Column> */}

                            <Grid.Column width={16} style={{margin:'1em 0',padding:'0'}}>
                                <Segment
                                    placeholder
                                    style={{
                                        minHeight:'unset'
                                    }}
                                    onDragEnter={(e)=>{
                                        e.stopPropagation()
                                        e.preventDefault()
                                    }}
                                    onDragOver={(e)=>{
                                        e.stopPropagation()
                                        e.preventDefault()
                                    }}
                                    onDrop={(e)=>{
                                        e.stopPropagation()
                                        e.preventDefault()
                                        var files=e.dataTransfer.files
                                        if(files){
                                            this.onAddPhoto(files,item.iditem,item.image,item.image_public_id)
                                        }
                                    }}
                                >
                                    <Container
                                        style={{
                                            flex:1,
                                            border:'3px solid rgba(0,0,0,.6)',
                                            borderStyle: 'dashed',
                                            padding:'1em 0',
                                            display:'flex',
                                            flexDirection:'column',
                                            justifyContent:'center',
                                            alignItems:'center',
                                            color:'rgba(0,0,0,.6)'
                                        }}
                                    >
                                        <Icon name='download' size='big'/>
                                        <div style={{fontSize:'14px',fontWeight:'800',margin:'.5em 0'}}>
                                            Drag And Drop Images Here
                                        </div>
                                        <div style={{color:'rgba(0,0,0,.8)',fontSize:'14px',fontWeight:'800',margin:'0em 0 .5em'}}>
                                            Or
                                        </div>
                                        <Input 
                                            type='file'
                                            id={item.iditem}
                                            multiple
                                            size='small'
                                            style={{marginRight:'1em'}}
                                            onChange={(e)=>{
                                                var files= []
                                                
                                                for(var file of e.target.files){
                                                    files.push(file)
                                                }
                                                if(files){
                                                    // this.setState({image:files})
                                                    this.onAddPhoto(files,item.iditem,item.image,item.image_public_id)
                                                }
                                            }}
                                        />
                                        <Dimmer 
                                            active={item.iditem==this.state.loadingimageaddid}
                                            inverted
                                        >
                                            <Loader inverted>Uploading Image(s)</Loader>
                                            {this.renderuploaditemprogress()}
                                        </Dimmer>
                                    </Container>
                                </Segment>
                                {/* <Button
                                    basic
                                    primary
                                    loading={item.iditem==this.state.loadingimageaddid}
                                    style={{height:'100%'}}
                                    onClick={()=>{this.onAddPhoto(item.iditem,image,this.isJson(item.image_public_id))}}
                                >
                                    Add
                                </Button> */}
                            </Grid.Column>
                            {
                                this.state.errorimage?
                                <Grid.Column width={16}>
                                    <span style={{color:'red'}}>{this.state.errorimage}</span>
                                </Grid.Column>
                                : null
                            }
                        </Grid.Row>

                        <Divider style={{display:type.length?'block':'none'}}/>
                            
                            {
                                item.iditem===this.state.editid?
                                <Grid.Row>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <Header as={'h4'} style={{width:'100%'}}>Details</Header>
                                    </Grid.Column>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <Input
                                            placeholder='Price'
                                            value={this.state.price}
                                            onChange={(e)=>{this.setState({price:e.target.value})}}
                                        />
                                    </Grid.Column>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <Input
                                            placeholder='Stock'
                                            value={this.state.stock}
                                            onChange={(e)=>{this.setState({stock:e.target.value})}}
                                        />
                                    </Grid.Column>
                                    
                                    <Grid.Column width={16} style={{textAlign:'right'}}>
                                        <Button
                                            primary
                                            loading={item.iditem==this.state.editid&&this.state.loadingedit}
                                            disabled={item.iditem==this.state.editid&&this.state.loadingedit}
                                            // style={{marginLeft:'auto'}}
                                            onClick={this.onSubmit}
                                        >
                                            Save  
                                        </Button>
                                        <Button
                                            color='red'
                                            // style={{marginLeft:'auto'}}
                                            onClick={()=>{this.setState({
                                                editid:0,
                                                price:0,
                                                stock:0
                                            })}}
                                        >
                                            No
                                        </Button>
                                    </Grid.Column>
                                </Grid.Row>
                                :
                                <Grid.Row>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <Header as={'h4'} style={{width:'100%'}}>Details</Header>
                                    </Grid.Column>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <span >Harga:</span>
                                        <span style={{fontWeight:600,marginLeft:'.5em'}}>{item.price?idr(item.price):'Null'}</span>
                                    </Grid.Column>
                                    <Grid.Column width={16} style={{marginBottom:'1em'}}>
                                        <span >Stock:</span>
                                        <span style={{fontWeight:600,marginLeft:'.5em'}}>{item.stock?item.stock:'Null'}</span>
                                    </Grid.Column>
                                    
                                    <Grid.Column width={16} style={{textAlign:'right'}}>
                                        <Button
                                            primary
                                            basic
                                            // style={{marginLeft:'auto'}}
                                            onClick={()=>{this.setState({
                                                editid:item.iditem,
                                                price:item.price?item.price:'',
                                                stock:item.stock?item.stock:''
                                            })}}
                                        >
                                            Edit    
                                        </Button>
                                    </Grid.Column>
                                </Grid.Row>
                            }

                    </Grid>
                </Segment>
            )
                
        })
    }

    renderAfterAdd=()=>{
        var isnew=true
        this.state.items.forEach((item)=>{
            if(item.price){
                isnew=false
            }
        })
        if(isnew&&!this.state.pageloading){
            return (
                <Message>Set Up Your Product's Price And Stock</Message>
            )
        }
    }

    render() { 

        if(this.props.Seller.idseller==this.state.product.idseller){
            return ( 
                <Container style={{paddingTop:'2em',width:'650px'}}>
    
                <Header 
                    as={'h1'}
                    style={{marginBottom:'1em',position:'relative',height:'36px'}}
                >
                    {this.state.items[0]?this.state.items[0].product_name:''}
                    <Dimmer active={this.state.pageloading} inverted>
                        <Loader inverted/>
                    </Dimmer>
                </Header>
    
                {this.renderAfterAdd()}
    
                {
                    this.state.product.isdeleted?
                    this.renderProductIsDeleted()
                    :
                    <>
                    {this.renderProduct()}
                    {this.renderItems()}
                    </>
                }
    
                    
                <Grid style={{marginBottom:'3em'}}>
    
                </Grid>
                </Container>
             );

        }else{
            return (
                // <Container style={{paddingTop:'2em',width:'650px',height:'80%'}}>
                    <Segment 
                        style={{
                            width:'650px',
                            position:'absolute',
                            top:'50%',
                            left:'50%',
                            transform:'translate(-50%,-50%)',
                            textAlign:'center',
                        }}
                    >
                        You have no Access to this page
                    </Segment>
                // </Container>
            )
        }
    }
}

const MapstatetoProps=(state)=>{
    return {
        Seller: state.Seller
    }
}
 
export default connect(MapstatetoProps) (ProductItems);