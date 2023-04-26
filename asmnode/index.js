const { query } = require("express");
const express = require("express");
const app = express();
const port = 3001;
app.set("view engine","ejs");
app.set("views","./views");
app.use(express.static("public"))


//index.js
var mysql = require('mysql'); // nhúng module mysql vào trang
const db = mysql.createConnection ({
   host: 'localhost',
   user: 'root',
   password: '',
   database: 'asm_nodejs'  //tên database muốn kết nối
});
//routes
// app.get("/",(req, res) =>{
//     return res.render("shop");

// })


//get product

// app.get("/",(req,res) =>{
//     let sql ="select id, name_category from category";

//     db.query(sql, function(err, listCategory){
//         if(err) throw err;
//         let sqlProduct ="select id, name_product, price,img from products";

//         db.query(sqlProduct , (err, listProduct) =>{
//             // if(err) throw err;
//             res.render("index",{loaiHang:listCategory, listProduct:listProduct});
//         })
//     })

// })
app.get("/", (req, res) => {
    const perPage = 8;
    const currentPage = parseInt(req.query.page) || 1;
    const start = (currentPage - 1) * perPage;
    const end = start + perPage - 1;
  
    const sql = "SELECT id, name_category FROM category";
    db.query(sql, function (err, listCategory) {
      if (err) throw err;
  
      const countSql = "SELECT COUNT(*) AS count FROM products";
      db.query(countSql, function (err, result) {
        if (err) throw err;
  
        const count = result[0].count;
        const totalPages = Math.ceil(count / perPage);
  
        const sqlProduct =
          "SELECT id, name_product, price, img FROM products LIMIT ?, ?";
        db.query(sqlProduct, [start, perPage], function (err, listProduct) {
          if (err) throw err;
  
          res.render("index", {
            loaiHang: listCategory,
            listProduct: listProduct,
            totalPages: totalPages,
            currentPage: currentPage,
          });
        });
      });
    });
  });
  
//////////////////////////////////////////////
//sp hot---
app.get("/",(req,res) =>{
    let sql ="select id, name_category from category";

    db.query(sql, function(err, listCategory){
        if(err) throw err;
        let sqlProduct ="select id, name_product, price,img from products";
        let sqlProductHot ="select id, name_product, price,img from products where hot = 1";

        db.query(sqlProduct , (err, listProduct) =>{
            db.query(sqlProductHot,(err,listSPHot) =>{
                console.log(listSPHot);
                if(err) {
                    throw err;
                }
            res.render("index",{loaiHang:listCategory,listSPHot:listSPHot, listProduct:listProduct});

            })
           
        })
    })

})
//get product trong shop
app.get("/shop", (req, res) => {
    let page = parseInt(req.query.page) || 1;
    let limit = 9;
    let offset = (page - 1) * limit;

    let sql = "select id, name_category from category";
    db.query(sql, function(err, listCategory) {
        if(err) throw err;

        let sqlProduct = `select id, name_product, price, img, description, quantity, tags, product_details, views 
                          from products limit ${limit} offset ${offset}`;
        db.query(sqlProduct, (err, listProduct) => {
            if(err) throw err;

            let sqlCount = "select count(*) as total from products";
            db.query(sqlCount, (err, result) => {
                if(err) throw err;

                let total = result[0].total;
                let totalPages = Math.ceil(total / limit);

                res.render("shop", {
                    listCategory: listCategory,
                    listProduct: listProduct,
                    totalPages: totalPages,
                    currentPage: page
                });
            });
        });
    });
});

//get product trong shop -- xét id loại
// app.get("/shop/:categoryId",(req,res)=>{
//     let id = req.params.categoryId;
//     let sql = `select * from category`; 
//     let sqlProduct = `select * from products WHERE id_category=${id}`; 
//     db.query(sql, function(err, listCategory) { 
//         db.query(sqlProduct, function(err, listProduct) { 
//             if (err) throw err; 
//             res.render('shop',{listCategory:listCategory, listProduct:listProduct});
//         });
//     });
// })
app.get("/shop/:categoryId", (req, res) => {
    let id = req.params.categoryId;
    
    
    let page = parseInt(req.query.page) || 1;
    let limit = 9;
    let offset = (page - 1) * limit;

        let sql = `select * from category`; 

    db.query(sql, function(err, listCategory) {
        if(err) throw err;

        let sqlProduct = `select * from products limit ${limit} offset ${offset} WHERE id_category=${id}`;
        db.query(sqlProduct, (err, listProduct) => {
            if(err) throw err;

            let sqlCount = "select count(*) as total from products WHERE id_category=${id}";
            db.query(sqlCount, (err, result) => {
                if(err) throw err;

                let total = result[0].total;
                let totalPages = Math.ceil(total / limit);

                res.render('shop', {
                    listCategory: listCategory,
                    listProduct: listProduct,
                    totalPages: totalPages,
                    currentPage: page
                });
            });
        });
    });
});

//get blog
app.get("/blog",(req, res) =>{
    return res.render("blog");

})
app.get("/contact",(req, res) =>{
    return res.render("contact");

})
app.get("/login",(req, res) =>{
    return res.render("login");

})
function getProductById(productId) {
    // Connect to the database and retrieve the product with the given ID
    const product = db.query(`SELECT * FROM products WHERE id = ${productId}`);
    // Return the product object
    return product;
  }
  app.get('/add-to-cart', (req, res) => {
    const productId = req.query.product_id;
    // const quantity = parseInt(req.query.quantity) || 1;
    // Retrieve the product from the database based on the product ID
    const product = db.getProductById(productId);
    if (!product) {
      return res.status(404).send('Product not found');
    }
    // Add the product to the cart
    const cart = req.session.cart || {};
    cart[productId] = (cart[productId] || 0) + quantity;
    req.session.cart = cart;
    // Redirect the user to the cart page
    res.redirect('/cart');
  });
  
app.get("/cart",(req, res) =>{
    return res.render("cart");

})
app.get("/page",(req, res) =>{
    return res.render("page");

})

app.get("/detail_product/:id",(req,res)=>{
 
    let id = req.params.id;
    let sql = `select * from products`; 
    let sqlProduct = `select * from products WHERE id=${id}`; 
    db.query(sql, function(err, listCategory) { 
        db.query(sqlProduct, function(err, data) { 
            if (err) throw err; 
            res.render('detail_product',{listcategory:listCategory, products:data[0]});
        });
    });
})




app.listen(port, () => {
    console.log(`http://localhost:${port}`);
});