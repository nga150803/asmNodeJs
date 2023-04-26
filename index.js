const { query } = require("express");
const express = require("express");
const bodyParser = require("body-parser");
// const session = require('express-session');
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
const port = 3001;
app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.static("public"));

//upload filé hình ảnh trong admin
//index.js
var mysql = require("mysql"); // nhúng module mysql vào trang
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "asm_nodejs", //tên database muốn kết nối
});
db.connect(function (err) {
  if (err) {
    console.error("Lỗi kết nối: " + err.stack);
    return;
  }

  console.log("Kết nối thành công với ID: " + db.threadId);
});
//routes
//
app.get("/", (req, res) => {
  let page = parseInt(req.query.page) || 1;
  let limit = 8;
  let offset = (page - 1) * limit;

  let sql = "select id, name_category from category";
  db.query(sql, function (err, listCategory) {
    if (err) throw err;

    let sqlProduct = `select id, name_product, price, img, description, quantity, tags, product_details, views 
                          from products limit ${limit} offset ${offset}`;
    let sqlProductHot =
      "select id, name_product, price,img from products where hot = 1";

    db.query(sqlProduct, (err, listProduct) => {
      db.query(sqlProductHot, (err, listSPHot) => {
        console.log(listSPHot);
        if (err) {
          throw err;
        }

        let sqlCount = "select count(*) as total from products";
        db.query(sqlCount, (err, result) => {
          if (err) throw err;

          let total = result[0].total;
          let totalPages = Math.ceil(total / limit);

          res.render("index", {
            loaiHang: listCategory,
            listProduct: listProduct,
            listSPHot: listSPHot,

            totalPages: totalPages,
            currentPage: page,
          });
        });
      });
    });
  });
});

//get product trong shop
app.get("/shop", (req, res) => {
  let page = parseInt(req.query.page) || 1;
  let limit = 9;
  let offset = (page - 1) * limit;

  let sql = "select id, name_category from category";
  db.query(sql, function (err, listCategory) {
    if (err) throw err;

    let sqlProduct = `select id, name_product, price, img, description, quantity, tags, product_details, views 
                          from products`;

    if (req.query.sort && req.query.sort === "price_asc") {
      sqlProduct += ` order by price asc`;
    } else if (req.query.sort && req.query.sort === "price_desc") {
      sqlProduct += ` order by price desc`;
    }

    sqlProduct += ` limit ${limit} offset ${offset}`;

    db.query(sqlProduct, (err, listProduct) => {
      if (err) throw err;

      let sqlCount = "select count(*) as total from products";
      db.query(sqlCount, (err, result) => {
        if (err) throw err;

        let total = result[0].total;
        let totalPages = Math.ceil(total / limit);

        res.render("shop", {
          listCategory: listCategory,
          listProduct: listProduct,
          totalPages: totalPages,
          currentPage: page,
        });
      });
    });
  });
});
// tìm kiếm sản phẩm theo tên
app.get("/search", (req, res) => {
  let page = parseInt(req.query.page) || 1;
  let limit = 9;
  let offset = (page - 1) * limit;

  let search_product = req.query.search_product;
  let search_category = req.query.search_category;

  let sql = "select id, name_category from category";
  db.query(sql, function (err, listCategory) {
    if (err) throw err;

    let sqlProduct = `select id, name_product, price, img, description, quantity, tags, product_details, views 
                          from products where 1=1`;

    if (search_product) {
      sqlProduct += ` and name_product like '%${search_product}%'`;
    }
    if (search_category) {
      sqlProduct += ` and category_id = (select id from category where name_category = '${search_category}')`;
    }

    sqlProduct += ` limit ${limit} offset ${offset}`;

    db.query(sqlProduct, (err, listProduct) => {
      if (err) throw err;

      let sqlCount = "select count(*) as total from products where 1=1";

      if (search_product) {
        sqlCount += ` and name_product like '%${search_product}%'`;
      }
      if (search_category) {
        sqlCount += ` and category_id = (select id from category where name_category = '${search_category}')`;
      }

      db.query(sqlCount, (err, result) => {
        if (err) throw err;

        let total = result[0].total;
        let totalPages = Math.ceil(total / limit);

        res.render("shop", {
          listCategory: listCategory,
          listProduct: listProduct,
          totalPages: totalPages,
          currentPage: page,
          search_product: search_product,
          search_category: search_category,
        });
      });
    });
  });
});

//get product trong shop -- xét id loại

app.get("/shop/:categoryId", (req, res) => {
  let page = parseInt(req.query.page) || 1;
  let limit = 9;
  let offset = (page - 1) * limit;
  let id = req.params.categoryId;

  let sql = `select * from category`;

  db.query(sql, function (err, listCategory) {
    if (err) throw err;

    let sqlProduct = `select id, name_product, price, img, description, quantity, tags, product_details, views 
                          from products where id_category=${id} limit ${limit} offset ${offset} `;

    db.query(sqlProduct, (err, listProduct) => {
      if (err) throw err;

      let sqlCount = "select count(*) as total from products";
      db.query(sqlCount, (err, result) => {
        if (err) throw err;

        let total = result[0].total;
        let totalPages = Math.ceil(total / limit);

        res.render("shop", {
          listCategory: listCategory,
          listProduct: listProduct,
          totalPages: totalPages,
          currentPage: page,
        });
      });
    });
  });
});
// chi tiết sản phẩm và sản phẩm có lượt xem nhiều nhất
app.get("/detail_product/:id", (req, res) => {
  let id = req.params.id;
  let sql = `select * from products`;
  let sqlProduct = `select * from products WHERE id=${id}`;
  db.query(sql, function (err, listCategory) {
    db.query(sqlProduct, function (err, data) {
      if (err) throw err;
      let sqlViews = `SELECT * FROM products ORDER BY views DESC LIMIT 4`;
      db.query(sqlViews, function (err, viewsProducts) {
        if (err) throw err;
        res.render("detail_product", {
          listcategory: listCategory,
          products: data[0],
          viewsProducts: viewsProducts,
        });
      });
    });
  });
});

// app.get("/detail_product/:id",(req,res)=>{

//     let id = req.params.id;
//     let sql = `select * from products`;
//     let sqlProduct = `select * from products WHERE id=${id}`;
//     db.query(sql, function(err, listCategory) {
//         db.query(sqlProduct, function(err, data) {
//             if (err) throw err;
//             res.render('detail_product',{listcategory:listCategory, products:data[0]});
//         });
//     });
// })
//get blog
app.get("/blog", (req, res) => {
  return res.render("blog");
});
app.get("/contact", (req, res) => {
  return res.render("contact");
});
// đăng nhâọ tài khoản
app.get("/login", (req, res) => {
  return res.render("login");
});

// thực hiện truy vấn lấy dữ liệu user
// Xử lý yêu cầu đăng nhập
app.post("/login", function (req, res) {
  try {
    var username = req.body.username;
    var password = req.body.password;
    var sql = "SELECT * FROM users WHERE username = ? AND password = ?";
    var values = [username, password];
    db.query(sql, values, function (error, results) {
      return res.status(200).json(results);
    });
  } catch (error) {}
});

// đăng ký tài khoản người dùng
app.get("/signin", (req, res) => {
  return res.render("signin");
});
app.post("/signin", (req, res) => {
  const { email, username, password } = req.body;

  const checkEmailSql = `SELECT * FROM users WHERE email = ?`;
  const checkEmailValues = [email];

  db.query(checkEmailSql, checkEmailValues, (error, result) => {
    if (error) {
      console.error("Lỗi khi kiểm tra email: ", error);
      return res.status(500).send("Lỗi máy chủ nội bộ");
    }

    if (result.length > 0) {
      console.log(`Email "${email}" đã được đăng ký trước đó.`);
      return res.status(400).send(`Email "${email}" đã được đăng ký trước đó.`);
    }

    const insertSql = `INSERT INTO users (email, username, password) VALUES (?, ?, ?)`;
    const insertValues = [email, username, password];

    db.query(insertSql, insertValues, (error, result) => {
      if (error) {
        console.error("Lỗi khi lưu người dùng vào cơ sở dữ liệu: ", error);
        return res.status(500).send("Lỗi máy chủ nội bộ");
      }

      console.log("Người dùng được lưu vào cơ sở dữ liệu.");
      return res.redirect("/login");
    });
  });
});

// quên mật khẩu
app.get("/forgot_password", (req, res) => {
  return res.render("forgot_password");
});
app.post("/forgot_password", function (req, res) {
  // Lấy email từ request body
  const email = req.body.email;

  // Kiểm tra email có tồn tại trong cơ sở dữ liệu hay không
  const sql = "SELECT * FROM users WHERE email = ?";
  db.query(sql, [email], function (err, results) {
    if (err) throw err;

    // Nếu email tồn tại, tạo mã đặt lại mật khẩu và gửi email chứa liên kết đặt lại mật khẩu
    if (results.length > 0) {
      const resetToken = crypto.randomBytes(20).toString("hex");
      const resetUrl = `http://localhost:300/reset_password?token=${resetToken}`;

      // Gửi email chứa liên kết đặt lại mật khẩu tới email của người dùng
      const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          user: "ngatran1508cute@gmail.com",
          pass: "",
        },
      });

      const mailOptions = {
        from: "ngatran1508cute@gmail.com",
        to: email,
        subject: "Đặt lại mật khẩu",
        html: `<p>Bạn đã yêu cầu đặt lại mật khẩu. Vui lòng nhấn vào liên kết dưới đây để đặt lại mật khẩu:</p><p><a href="${resetUrl}">${resetUrl}</a></p>`,
      };

      transporter.sendMail(mailOptions, function (err, info) {
        if (err) throw err;
        console.log("Email sent: " + info.response);
      });

      // Lưu mã đặt lại mật khẩu vào cơ sở dữ liệu
      const updateSql = "UPDATE users SET reset_token = ? WHERE email = ?";
      db.query(updateSql, [resetToken, email], function (err, result) {
        if (err) throw err;
        console.log("Reset token updated");
      });

      // Hiển thị thông báo cho người dùng
      res.send("Một liên kết đặt lại mật khẩu đã được gửi tới email của bạn.");
    } else {
      // Hiển thị thông báo cho người dùng nếu email không tồn tại trong cơ sở dữ liệu
      res.send("Email không tồn tại.");
    }
  });
});

app.get("/cart", (req, res) => {
  return res.render("cart");
});
app.get("/meInfor", (req, res) => {
  return res.render("meInfor");
});
app.get("/page", (req, res) => {
  return res.render("page");
});
//phaanf admin///////////////////////////////////////////////////////////////////////////

// app.get("/admin", (req, res) => {
//   return res.render("admin/admin");
// });
//show loại hàng
app.get("/admin", (req, res) => {
  // res.send('Danh sách sản phẩm');
  let sql = `SELECT * FROM category`;
  db.query(sql, function (err, data) {
    res.render("admin/admin", { listCategory: data });
  });
  // return res.render("admin/shopAdmin");
});
app.get("/addCategory", (req, res) => {
  return res.render("admin/addCategory");
});
app.post("/admin", function (req, res, next) {
  //nhận dữ liệu từ addnew để thêm record vào db
  let name_cate = req.body.name_category;
  let order_cate = req.body.order;
  let role_cate = req.body.role;

  category = {
    name_category: name_cate,
    order: order_cate,
    role: role_cate,
  };
  db.query("insert into category SET ?", category, function (err, data) {
    if (err) throw err;
    res.redirect("/admin/");
  });
});
app.get("/editCate/:id", function (req, res, next) {
  var id = req.params.id;
  let sql = `SELECT * FROM category where id=${id}`;
  db.query(sql, function (err, data) {
    res.render("admin/editCategory", { category: data[0] });
  });
});

app.post("/admin/updateCate", function (req, res, next) {
  let id = req.body.id;
  let name_cate = req.body.name_category;
  let order_cate = req.body.order;
  let role_cate = req.body.role;

  console.log(id, name_cate, order_cate, role_cate);

  db.query(
    `UPDATE category SET name_category=?,order=?,role=? WHERE id=?`,
    [name_cate, order_cate, role_cate, id],
    (err, data) => {
      res.redirect("/admin/");
    }
  );
});
app.get("/destroy/:id", function (req, res) {
  let id = req.params.id;
  let sql = `DELETE FROM category WHERE id = ?`;
  db.query(sql, [id], function (err, data) {
    //   if (data.affectedRows==0) {
    //       console.log(`Không có loại ${id} để xóa`);
    //   }
    res.redirect("/admin");
  });
});
//show sản phẩm admin
app.get("/shopAdmin", (req, res) => {
  // res.send('Danh sách sản phẩm');
  let sql = `SELECT * FROM products`;
  db.query(sql, function (err, data) {
    res.render("admin/shopAdmin", { listProduct: data });
  });
  // return res.render("admin/shopAdmin");
});

// router.get('/addProduct', function (req, res, next) {
//     res.render("addProduct");
// });
app.get("/addProduct", (req, res) => {
  return res.render("admin/addProduct");
});
app.post("/shopAdmin", function (req, res, next) {
  //nhận dữ liệu từ addnew để thêm record vào db
  let name_pd = req.body.name_product;
  let img_pd = req.body.img;
  let price_pd = req.body.price;
  let price_sale_pd = req.body.price_sale;
  let description_pd = req.body.description;
  let quantity_pd = req.body.quantity;
  let views_pd = req.body.views;
  let id_cate = req.body.id_category;
  products = {
    name_product: name_pd,
    img: img_pd,
    price: price_pd,
    price_sale: price_sale_pd,
    description: description_pd,
    quantity: quantity_pd,
    views: views_pd,
    id_category: id_cate,
  };
  db.query("insert into products SET ?", products, function (err, data) {
    if (err) throw err;
    res.redirect("/shopAdmin/");
  });
});

app.get("/edit/:id", function (req, res, next) {
  var id = req.params.id;
  let sql = `SELECT * FROM products where id=${id}`;
  db.query(sql, function (err, data) {
    res.render("admin/editProduct", { products: data[0] });
  });
});

app.post("/shopAdmin/update", function (req, res, next) {
  let id = req.body.id;
  let name_pd = req.body.name_product;
  let img_pd = req.body.img;
  let price_pd = req.body.price;
  let price_sale_pd = req.body.price_sale;
  let description_pd = req.body.description;
  let quantity_pd = req.body.quantity;
  let views_pd = req.body.views;
  let id_cate = req.body.id_category;

  db.query(
    `UPDATE products SET name_product=?,img=?,price=?,price_sale=?,description=?,quantity=?,views=?,id_category=? WHERE id=?`,
    [
      name_pd,
      img_pd,
      price_pd,
      price_sale_pd,
      description_pd,
      quantity_pd,
      views_pd,
      id_cate,
      id,
    ],
    (err, data) => {
      res.redirect("/shopAdmin/");
    }
  );
});
app.get("/delete/:id", function (req, res) {
  let id = req.params.id;
  let sql = `DELETE FROM products WHERE id = ?`;
  db.query(sql, [id], function (err, data) {
    //   if (data.affectedRows==0) {
    //       console.log(`Không có loại ${id} để xóa`);
    //   }
    res.redirect("/shopAdmin");
  });
});

app.get("/userAdmin", (req, res) => {
  let sql = `SELECT * FROM users`;
  db.query(sql, function (err, data) {
    res.render("admin/userAdmin", { listUsers: data });
  });
  // return res.render("admin/shopAdmin");
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
