const express=require('express');
// 引入商品模块路由器   (.js后缀名可省略)
const productRouter=require('./router/product');
// 引入用户模块路由器
const userRouter=require('./router/user');
// 引入购物车模块路由器
const shopping_cartRouter=require('./router/shopping_cart');

const bodyParser=require('body-parser');

// 创建web服务器
const app=express();
app.listen(8080);

// 托管静态资源
app.use(express.static('public'));

//使用第三方模块接收post提交的数据
app.use(bodyParser.urlencoded({
    extended:false
}));

// 使用商品模块路由器
app.use('/product',productRouter);
// 使用用户模块路由器
app.use('/user',userRouter);
// 使用购物车模块路由器
app.use('/shopping_cart',shopping_cartRouter);

// 错误处理中间件（放到最后执行）
app.use((err,req,res,next)=>{
    // 只要接收到错误信息，就响应回页面
    res.send({code:500,msg:`${err}`});
})