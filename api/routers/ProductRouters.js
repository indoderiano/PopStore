const express=require('express')
const {ProductControllers}=require('../controllers')
const multer  = require('multer')
const upload = multer({})

const Router=express.Router()

// Router.get('/productseller',ProductControllers.productseller)               //get all products for seller page
Router.post('/',ProductControllers.add) // UPLOAD IMAGE TO API
Router.post('/cloudinary',upload.array('photo'),ProductControllers.create) // UPLOAD IMAGE TO CLOUDINARY

Router.get('/get/:idproduct',ProductControllers.get)

Router.put('/image/:idproduct',ProductControllers.addcover) // UPLOAD IMAGE TO API 
Router.put('/image/cloudinary/:idproduct',upload.array('photo'),ProductControllers.addCoverToCloudinary)

Router.put('/image/:idproduct/:index',ProductControllers.deletecover)
Router.put('/image/cloudinary/:idproduct/:index',ProductControllers.deleteCoverFromCloudinary)

Router.put('/:idproduct',ProductControllers.edit)
Router.put('/sold/:idproduct',ProductControllers.countSold)
Router.get('/search/:keyword',ProductControllers.searchproduct)
Router.get('/allproducts',ProductControllers.allproducts)
Router.get('/totalproduct',ProductControllers.getTotalProduct)
Router.get('/mostviewed',ProductControllers.mostviewed)
Router.put('/rating/:idproduct',ProductControllers.countRating)
Router.get('/menproducts',ProductControllers.menProducts)
Router.get('/totalmenproducts',ProductControllers.totalMenProducts)
Router.get('/womenproducts',ProductControllers.womenProducts)
Router.get('/totalwomenproducts',ProductControllers.totalWomenProducts)
Router.get('/getseen/:idproduct',ProductControllers.getseen)
Router.get('/sellerproducts',ProductControllers.sellerProducts)
Router.get('/totalsellerproducts',ProductControllers.totalSellerProducts)

Router.get('/seller',ProductControllers.getStoreProducts)
/////////////////////////////////////////////////////////
// NOTE IMPORTANT
// Router.get('/:idproduct',ProductControllers.get)
// NEVER USE REQ.PARAMS THIS WAY
// BECAUSE IT WILL NOT ALLOW THE CODE AFTER IT TO EXECUTE
/////////////////////////////////////////////////////////

// not being used
// Router.post('/add',ProductControllers.create)

// not being used
// Router.put('/edit/:id',ProductControllers.edit)

module.exports=Router