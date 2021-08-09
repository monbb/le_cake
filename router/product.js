// 创建路由器对象
const express=require('express');
// 引入连接池对象   (.js后缀名可省略)
const pool=require('../pool');

var router=express.Router();

// 测试路由
router.get('/test',(req,res,next)=>{
    res.send({code:200,msg:'测试成功'});
})

// 添加蛋糕种类
router.post('/add_cake_family',(req,res,next)=>{
    // 获取传递的数据
    var obj=req.body;
    // console.log(obj);
    // 1. 查找该蛋糕种类是否已存在
    pool.query('SELECT fid FROM lc_cake_family WHERE fname=?',[obj.fname],(err,result)=>{
        if(err){
            next(err);
            return;
        }
        // console.log(result);
        // 如果找到，即：该类商品已存在
        if(result.length>0){
            res.send({code:201,msg:'该商品已存在，种类编号是:'+result[0].fid});
            return;
        }else{   // 否则
            // 2. 插入数据库
            pool.query('INSERT INTO lc_cake_family SET ?',[obj],(err,result)=>{
                // 如果有错，就把错误信息抛给错误处理中间件
                if(err){
                    next(err);
                    // 退出，不再做后续操作
                    return;
                }
                res.send({code:200,msg:'添加成功'});
            })
        }
    })
})

// 查看所有蛋糕种类
router.get('/check_cake_family',(req,res)=>{
    pool.query('SELECT * FROM lc_cake_family',(err,result)=>{
        if(err){
            next(err);
        }else{
            res.send(result);
        }
    })
})

// 添加蛋糕
router.post('/add_cake',(req,res,next)=>{
    var obj=req.body;
    // console.log(obj);
    pool.query('INSERT INTO lc_cake SET ?',[obj],(err,result)=>{
        if(err){
            next(err);
            return;
        }
        res.send({code:200,msg:'添加成功'});
    })
})

// 查看所有蛋糕
router.get('/check_cake',(req,res,next)=>{
    pool.query('SELECT * FROM lc_cake',(err,result)=>{
        if(err){
            next(err);
        }else{
            res.send(result);
        }
    })
})

// 首页要显示的蛋糕
router.get('/index_cakes',(req,res,next)=>{
    // 按标题去重（找前12条不同的标题）
    pool.query('SELECT DISTINCT title FROM lc_cake LIMIT 0,12',(err,result)=>{
        if(err){
            next(err);
        }else{
            // console.log(result);
            // 遍历每个标题
            for(let i=0;i<result.length;i++){
                // console.log(result[i].title);
                // 以标题为条件，找对应的列
                pool.query('SELECT lid,title,subtitle,pic,price,tag,remark FROM lc_cake WHERE title=? LIMIT 0,1',[result[i].title],(err,result2)=>{
                    if(err){
                        next(err);
                    }else{
                        // 将找到的记录(result2[0])替代之前找到的记录(result[i])
                        result[i]=result2[0];
                    }
                })
            }
            // 等记录替代后，再响应回页面
            setTimeout(()=>{
                res.send({code:200,msg:'查询成功',data:result});
            },200);
        }
    })
})

// 列表页要显示的蛋糕
router.get('/list_cakes',(req,res,next)=>{
    pool.query('SELECT DISTINCT title FROM lc_cake',(err,result)=>{
        if(err){
            next(err);
        }else{
            for(let i=0;i<result.length;i++){
                pool.query('SELECT lid,title,subtitle,pic,price,tag,remark FROM lc_cake WHERE title=? LIMIT 0,1',[result[i].title],(err,result2)=>{
                    if(err){
                        next(err);
                    }else{
                        result[i]=result2[0];
                    }
                })
            }
            setTimeout(()=>{
                res.send({code:200,msg:'查询成功',data:result});
            },200);
        }
    })
})

// 导出路由器对象
module.exports=router;