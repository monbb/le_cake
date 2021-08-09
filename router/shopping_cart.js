const express=require('express');
const router=express.Router();

router.get('/test',(req,res,next)=>{
    res.send({code:200,msg:'测试路由成功'});
})

module.exports=router;