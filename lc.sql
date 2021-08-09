SET NAMES UTF8;
DROP DATABASE IF EXISTS lc;
CREATE DATABASE lc CHARSET=UTF8;
USE lc;


/*商品种类表*/
CREATE TABLE lc_cake_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,    #种类编号
    fname VARCHAR(16)       #类名（奶油蛋糕，鲜果蛋糕，慕斯蛋糕...）
);

/*商品表*/
CREATE TABLE lc_cake(
    lid INT PRIMARY KEY AUTO_INCREMENT,    #产品编号
    family_id INT,             #种类编号
    title VARCHAR(32),         #标题
    subtitle VARCHAR(32),      #副标题
    tag VARCHAR(8),            #标签：首页->商品列表->左上角的标签内容
    remark VARCHAR(32),        #备注：限时优惠，立减，专享价...
    price DECIMAL(6,2),        #价格
    pic VARCHAR(64),           #图片
    lg_pic VARCHAR(64),        #大图（仅用于详情页最顶位置）
    spec VARCHAR(16),          #规格（2-4人食、5-8人食...）
    tableware VARCHAR(16),     #餐具
    size VARCHAR(32),          #尺寸
    weight VARCHAR(16),        #蛋糕的重量
    sweet TINYINT,             #甜度（根据返回的数字，画出n个甜甜圈）
    details VARCHAR(1024),     #详情
    is_onsale TINYINT,         #是否促销中
    sold_count INT             #已售出的数量
);

/*用户表*/
CREATE TABLE lc_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,     #用户编号
    uname VARCHAR(16),                      #用户名
    upwd VARCHAR(32),                       #密码
    email VARCHAR(64),                      #邮箱
    phone CHAR(11),                         #电话
    avatar VARCHAR(64),                     #头像图片路径
    gender TINYINT,                         #性别 0-女 1-男
    reg_time BIGINT                         #注册时间
);

/*用户收货地址*/
CREATE TABLE lc_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,     #地址编号
    user_id INT,               #用户编号
    receiver VARCHAR(16),      #收件人姓名
    province VARCHAR(16),      #省
    city VARCHAR(16),          #市
    address VARCHAR(128),      #详细地址
    cellphone CHAR(11),        #手机
    fixedphone VARCHAR(16),    #固定电话
    tag VARCHAR(8),            #标签（公司、学校、家）
    is_default TINYINT         #是否为当前用户的默认收货地址
);

/*购物车*/
CREATE TABLE lc_shopping_cart(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,               #用户编号
    product_id INT,            #商品编号
    count INT,                 #购买数量
    putIn_time BIGINT          #加入购物车时间
);

/*订单表*/
CREATE TABLE lc_order(
    aid INT PRIMARY KEY AUTO_INCREMENT,    #订单编号
    user_id INT,             #用户编号
    address_id INT,          #地址编号
    status TINYINT,          #订单状态   1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
    order_time BIGINT,       #下单时间
    pay_time BIGINT,         #付款时间
    deliver_time BIGINT,     #发货时间
    received_time BIGINT     #签收时间
);

/*订单详情表*/
CREATE TABLE lc_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,    #受理订单编号
    user_id INT,             #用户编号
    address_id INT,          #地址编号
    product_id INT,          #产品编号
    spec VARCHAR(16),        #规格
    count INT                #购买数量
);

/*评论区*/
CREATE TABLE lc_comments(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,             #用户编号
    uname VARCHAR(16),       #用户名
    spec VARCHAR(16),        #规格
    comm_time BIGINT,        #发表评论时间
    content VARCHAR(512),    #内容
    pic VARCHAR(64)          #用户上传的图片
);

/*首页广告轮播图*/
CREATE TABLE lc_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(64),           #图片
    title VARCHAR(32),         #标题
    subtitle VARCHAR(32),      #副标题
    href VARCHAR(64)           #跳转至哪个页面
);

/*首页热卖推荐*/
CREATE TABLE lc_hot_cake(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(64),       #图片
    href VARCHAR(64)       #跳转至哪个页面
);


/*导入数据*/
/*商品种类表*/
INSERT INTO lc_cake_family VALUES(null,'牛乳芝士蛋糕');
INSERT INTO lc_cake_family VALUES(null,'奶油蛋糕');
INSERT INTO lc_cake_family VALUES(null,'鲜果蛋糕');
INSERT INTO lc_cake_family VALUES(null,'慕斯蛋糕');
INSERT INTO lc_cake_family VALUES(null,'奶油芝士蛋糕');
INSERT INTO lc_cake_family VALUES(null,'鲜果慕斯蛋糕');
INSERT INTO lc_cake_family VALUES(null,'巧克力蛋糕');
INSERT INTO lc_cake_family VALUES(null,'芝士蛋糕');
INSERT INTO lc_cake_family VALUES(null,'芝士慕斯蛋糕');
INSERT INTO lc_cake_family VALUES(null,'燕麦露芝士蛋糕');
INSERT INTO lc_cake_family VALUES(null,'木糖醇慕斯蛋糕');


/*商品表*/
INSERT INTO lc_cake VALUES(null,1,'雪域牛乳芝士','经典之作 热销多年','招牌',null,218,'imgs/cakes/list_10800.jpg','imgs/cakes/display_10800_66669.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约480g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域牛乳芝士','经典之作 热销多年','招牌',null,336,'imgs/cakes/list_10800.jpg','imgs/cakes/display_10800_66669.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约890g',	2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域牛乳芝士','经典之作 热销多年','招牌',null,506,'imgs/cakes/list_10800.jpg','imgs/cakes/display_10800_66669.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1420g',2,null,	0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域牛乳芝士','经典之作 热销多年','招牌',null,840,'imgs/cakes/list_10800.jpg','imgs/cakes/display_10800_66669.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约2700g',2,null,	0,0);
INSERT INTO lc_cake VALUES(null,2,'桃你喜欢',	'清新甜润，「桃」气满满','NEW','限时立减40元',258,'imgs/cakes/list_24954.jpg','imgs/cakes/display_24954_32026.jpg','2-4人食','含5套餐具','约 12 x 12 x 10 cm',	'约675g',1,null,1,0);
INSERT INTO lc_cake VALUES(null,3,'好芒椰魔芋蛋糕','「魔」力控卡，轻爽好「芒椰」','NEW',null,258,'imgs/cakes/list_24847.jpg','imgs/cakes/display_24847_85237.jpg','2-4人食','含5套餐具','约 13 x 13 x 7 cm','约552g',	2,null,0,0);
INSERT INTO lc_cake VALUES(null,2,'芋你啵啵','“啵啵”一下 芋见满分香甜','人气爆款','首单全额返 折合0元到手',218,'imgs/cakes/list_24207.jpg',	'imgs/cakes/display_24207_9675.jpg','2-4人食','含5套餐具','约 14 x 14 x 8 cm','约585g',1,null,1,0);
INSERT INTO lc_cake VALUES(null,2,'芋你啵啵','“啵啵”一下 芋见满分香甜','人气爆款','首单全额返 折合0元到手',336,'imgs/cakes/list_24207.jpg',	'imgs/cakes/display_24207_9675.jpg','5-8人食','含10套餐具','约 18 x 18 x 8 cm','约930g',1,null,1,0);
INSERT INTO lc_cake VALUES(null,2,'双层甜心莓莓','高颜值Ins风 晒圈无鸭梨','热卖新品','首单全额返 折合0元到手',258,'imgs/cakes/list_24183.jpg','imgs/cakes/display_24183_24277.jpg','2-4人食	','含5套餐具','约 13 x 13 x 9 cm','约645g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,4,'环游世界','五星好评 9种口味一次过瘾','新人打卡',null,258,'imgs/cakes/list_12287.jpg','imgs/cakes/display_12287_7949.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约405g	',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'环游世界','五星好评 9种口味一次过瘾','新人打卡',null,398,'imgs/cakes/list_12287.jpg','imgs/cakes/display_12287_7949.jpg','5-8人食','含10套餐具	','约 17 x 17 x 4 cm','约650g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'环游世界','五星好评 9种口味一次过瘾','新人打卡',null,598,'imgs/cakes/list_12287.jpg','imgs/cakes/display_12287_7949.jpg','10-12人食','含15套餐具',	'约 22 x 22 x 4 cm','约1060g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'环游世界','五星好评 9种口味一次过瘾','新人打卡',null,998,'imgs/cakes/list_12287.jpg','imgs/cakes/display_12287_7949.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm',	'约2185g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,5,'海盐乳酪芝士','芝士控绕不开的难忘滋味',null,'生日会 限时75折',218,'imgs/cakes/list_10782.jpg','imgs/cakes/display_10782_17359.jpg',	'2-4人食','含5套餐具','约 13 x 3 cm','约454g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,5,'海盐乳酪芝士','芝士控绕不开的难忘滋味',null,'生日会 限时75折',336,'imgs/cakes/list_10782.jpg','imgs/cakes/display_10782_17359.jpg',	'5-8人食','含10套餐具','约 17 x 3 cm','约908g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,1,'王牌雪域套餐','经典之作 热销多年',null,'限时立减30元',298,'imgs/cakes/list_24707.jpg','imgs/cakes/display_24707_33146.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约480g',	2,null,1,0);
INSERT INTO lc_cake VALUES(null,6,'夏日芒芒套餐','口碑超人气 清爽来袭',null,'限时立减30元',298,'imgs/cakes/list_24713.jpg','imgs/cakes/display_24713_69513.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约650g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,6,'杨枝甘露','口碑超人气 清爽来袭',null,null,218,'imgs/cakes/list_13345.jpg','imgs/cakes/display_13345_29945.jpg','2-4人食',	'含5套餐具','约 13 x 13 x 4 cm','约650g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,6,'杨枝甘露','口碑超人气 清爽来袭',null,null,336,'imgs/cakes/list_13345.jpg','imgs/cakes/display_13345_29945.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约1100g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,6,'杨枝甘露','口碑超人气 清爽来袭',null,null,506,'imgs/cakes/list_13345.jpg','imgs/cakes/display_13345_29945.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1750g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,6,'杨枝甘露','口碑超人气 清爽来袭',null,null,840,'imgs/cakes/list_13345.jpg','imgs/cakes/display_13345_29945.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约3260g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'壁咚！阿华田','浓郁麦芽可可 绵软与甜脆的碰撞',null,null,258,'imgs/cakes/list_22642.jpg','imgs/cakes/display_22642_36710.jpg','2-4人食','含5套餐具','约 13 x 5 cm',	'约450g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,8,'巴斯克流心','流心诱惑！风靡Ins的芝士蛋糕','人气爆款','首单全额返 折合0元到手',218,'imgs/cakes/list_23019.jpg','imgs/cakes/display_23019_80172.jpg','2-4人食','含5套餐具','约 13 x 13 x 6 cm','约454g',1,null,1,0);
INSERT INTO lc_cake VALUES(null,8,'巴斯克流心','流心诱惑！风靡Ins的芝士蛋糕','人气爆款','首单全额返 折合0元到手',336,'imgs/cakes/list_23019.jpg','imgs/cakes/display_23019_80172.jpg','5-8人食','含10套餐具','约 17 x 17 x 7 cm','约840g',	1,null,1,0);
INSERT INTO lc_cake VALUES(null,4,'玫瑰星河','玫瑰盛放 为爱“花”心思',null,null,298,'imgs/cakes/list_24273.jpg','imgs/cakes/display_24273_45141.jpg','2-4人食','含5套餐具','约 13 x 13 x 13 cm','约585g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,9,'提拉米苏·轻享','80%的雪域老友也爱这一款',null,null,298,'mgs/cakes/list_23370.jpg','imgs/cakes/display_23370_36504.jpg','2-4人食','含5套餐具','约 15 x 15 x 4 cm','约455g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,9,'提拉米苏·轻享','80%的雪域老友也爱这一款',null,null,458,'mgs/cakes/list_23370.jpg','imgs/cakes/display_23370_36504.jpg','5-8人食',	'含10套餐具','约 20 x 20 x 4 cm','约910g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,9,'提拉米苏·轻享','80%的雪域老友也爱这一款',null,null,680	,'mgs/cakes/list_23370.jpg','imgs/cakes/display_23370_36504.jpg','10-12人食','含15套餐具','约 25 x 25 x 4 cm','约1285g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,9,'提拉米苏·轻享','80%的雪域老友也爱这一款',null,null,1120,'imgs/cakes/list_23370.jpg','imgs/cakes/display_23370_36504.jpg','15-20人食','含20套餐具','约 33 x 33 x 4 cm','约2300g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,2,'搞怪多多','呆萌小怪兽 守护孩子气',null,'首单全额返 折合0元到手',218,'imgs/cakes/list_24317.jpg','imgs/cakes/display_24317_41861.jpg','2-4人食','含5套餐具','约 14 x 14 x 12 cm','约558g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,2,'玩趣毛毛','大眼小怪兽 玩心大爆发',null,'首单全额返 折合0元到手',218,'imgs/cakes/list_24322.jpg','imgs/cakes/display_24322_51596.jpg',	'2-4人食','含5套餐具','约 14 x 14 x 12 cm','约558g',2,null,1,0);
INSERT INTO lc_cake VALUES(null,4,'茶草京都','抹茶控京都寻味 草色茶香自悠然',null,null,218,'imgs/cakes/list_20105.jpg',	'imgs/cakes/display_20105_95977.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约470g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'茶草京都','抹茶控京都寻味 草色茶香自悠然',null,null,336,'imgs/cakes/list_20105.jpg',	'imgs/cakes/display_20105_95977.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约840g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'茶草京都','抹茶控京都寻味 草色茶香自悠然',null,null,506,'imgs/cakes/list_20105.jpg',	'imgs/cakes/display_20105_95977.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1330g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'茶草京都','抹茶控京都寻味 草色茶香自悠然',null,null,840,'imgs/cakes/list_20105.jpg',	'imgs/cakes/display_20105_95977.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约2500g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,10,'雪域莓莓燕麦芝士·轻享','清新莓果邂逅雪域燕麦芝士',null,null,298,'imgs/cakes/list_23573.jpg','imgs/cakes/display_19907_94240.jpg','2-4人食','含5套餐具','约 15 x 15 x 3 cm','约540g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,10,'雪域莓莓燕麦芝士·轻享','清新莓果邂逅雪域燕麦芝士',null,null,458,'imgs/cakes/list_23573.jpg','imgs/cakes/display_19907_94240.jpg','5-8人食','含10套餐具','约 20 x 20 x 3 cm','约980g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,10,'雪域莓莓燕麦芝士·轻享','清新莓果邂逅雪域燕麦芝士',null,null,680,'imgs/cakes/list_23573.jpg','imgs/cakes/display_19907_94240.jpg','10-12人食','含15套餐具','约 25 x 25 x 3 cm','约1520g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,10,'雪域莓莓燕麦芝士·轻享','清新莓果邂逅雪域燕麦芝士',null,null,1120,'imgs/cakes/list_23573.jpg','imgs/cakes/display_19907_94240.jpg','15-20人食','含20套餐具',	'约 33 x 33 x 3 cm','约2720g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'草莓雪域芝士','时令草莓邂逅浓浓芝士',null,null,218,'imgs/cakes/list_10937.jpg',	'imgs/cakes/display_10937_77444.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约440g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'草莓雪域芝士','时令草莓邂逅浓浓芝士',null,null,336,'imgs/cakes/list_10937.jpg',	'imgs/cakes/display_10937_77444.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约780g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'草莓雪域芝士','时令草莓邂逅浓浓芝士',null,null,506,'imgs/cakes/list_10937.jpg',	'imgs/cakes/display_10937_77444.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1220g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'草莓雪域芝士','时令草莓邂逅浓浓芝士',null,null,840,'imgs/cakes/list_10937.jpg',	'imgs/cakes/display_10937_77444.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约2400g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'玫瑰雪域芝士','懂得营造浪漫氛围的蛋糕',null,null,218,'imgs/cakes/list_12244.jpg',	'imgs/cakes/display_12244_57356.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约520g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'玫瑰雪域芝士','懂得营造浪漫氛围的蛋糕',null,null,336,'imgs/cakes/list_12244.jpg',	'imgs/cakes/display_12244_57356.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约900g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'玫瑰雪域芝士','懂得营造浪漫氛围的蛋糕',null,null,506,'imgs/cakes/list_12244.jpg',	'imgs/cakes/display_12244_57356.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1590g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'玫瑰雪域芝士','懂得营造浪漫氛围的蛋糕',null,null,840,'imgs/cakes/list_12244.jpg',	'imgs/cakes/display_12244_57356.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约3180g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'王子','小王子的专属宠溺','宝妈挚爱',null,218,'imgs/cakes/list_12486.jpg','imgs/cakes/display_12486_7080.jpg','2-4人食','含5套餐具',	'约 13 x 4 cm','约454g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'王子','小王子的专属宠溺','宝妈挚爱',null,336,'imgs/cakes/list_12486.jpg','imgs/cakes/display_12486_7080.jpg','5-8人食','含10套餐具','约 17 x 4 cm',	'约908g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'王子','小王子的专属宠溺','宝妈挚爱',null,506,'imgs/cakes/list_12486.jpg','imgs/cakes/display_12486_7080.jpg','10-12人食','含15套餐具','约 22 x 4 cm','约1362g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'王子','小王子的专属宠溺','宝妈挚爱',null,840,'imgs/cakes/list_12486.jpg','imgs/cakes/display_12486_7080.jpg	','15-20人食','含20套餐具','约 31 x 4 cm','约2270g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,4,'白玉麻麻','芝麻配上白玉丸 清香软糯很有料',null,'首单全额返 折合0元到手',218,'imgs/cakes/list_24342.jpg','imgs/cakes/display_24342_47160.jpg','2-4人食','含5套餐具','约 12 x 12 x 12 cm','约585g',1,	null,1,0);
INSERT INTO lc_cake VALUES(null,7,'巧克力松露·轻享','熠彩斑斓 轻享浓滑',null,null,298,'imgs/cakes/list_23364.jpg',	'imgs/cakes/display_23364_68464.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约420g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'巧克力松露·轻享','熠彩斑斓 轻享浓滑',null,null,458,'imgs/cakes/list_23364.jpg',	'imgs/cakes/display_23364_68464.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约750g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'巧克力松露·轻享','熠彩斑斓 轻享浓滑',null,null,680,'imgs/cakes/list_23364.jpg',	'imgs/cakes/display_23364_68464.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1240g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,7,'巧克力松露·轻享','熠彩斑斓 轻享浓滑',null,null,1120,'imgs/cakes/list_23364.jpg',	'imgs/cakes/display_23364_68464.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约2300g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,11,'福禄寿禧','蟠桃献瑞 贴心低甜木糖醇','木糖醇',null,388,'imgs/cakes/list_23954.jpg',	'imgs/cakes/display_23954_64654.jpg','8-10人食','含10套餐具','约 17 x 17 x 9 cm','约940g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,11,'福禄寿禧','蟠桃献瑞 贴心低甜木糖醇','木糖醇',null,1120,'imgs/cakes/list_23954.jpg',	'imgs/cakes/display_23954_64654.jpg','10-15人食','含15套餐具','约 32 x 32 x 9 cm','约2377g',1,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域蓝莓芝士','营造生日派对闪耀时刻',null,null,218,'imgs/cakes/list_10491.jpg',	'imgs/cakes/display_10491_80237.jpg','2-4人食','含5套餐具','约 13 x 13 x 4 cm','约510g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域蓝莓芝士','营造生日派对闪耀时刻',null,null,336,'imgs/cakes/list_10491.jpg',	'imgs/cakes/display_10491_80237.jpg','5-8人食','含10套餐具','约 17 x 17 x 4 cm','约920g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域蓝莓芝士','营造生日派对闪耀时刻',null,null,506,'imgs/cakes/list_10491.jpg',	'imgs/cakes/display_10491_80237.jpg','10-12人食','含15套餐具','约 22 x 22 x 4 cm','约1460g',2,null,0,0);
INSERT INTO lc_cake VALUES(null,1,'雪域蓝莓芝士','营造生日派对闪耀时刻',null,null,840,'imgs/cakes/list_10491.jpg',	'imgs/cakes/display_10491_80237.jpg','15-20人食','含20套餐具','约 31 x 31 x 4 cm','约2640g',2,null,0,0);


/*用户表*/
INSERT INTO lc_user VALUES(null,'tom','tom123','tom@qq.com','13312345678',null,1,null);
INSERT INTO lc_user VALUES(null,'jack','jack888','jack@163.com','13912345678',null,1,null);
INSERT INTO lc_user VALUES(null,'kitty','kitty666','kitty@126.com','13512345678',null,0,null);
INSERT INTO lc_user VALUES(null,'abc','abc123','abc@qq.com','13612345678',null,1,null);
INSERT INTO lc_user VALUES(null,'jerry','jerry123','jerry@163.com','13912345670',null,1,null);
INSERT INTO lc_user VALUES(null,'lily','lily123','lily@qq.com','13612345671',null,0,null);
