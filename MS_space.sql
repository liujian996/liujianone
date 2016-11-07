create database MS_space

use MS_space

--用户信息表
create table users
(
	[user_ID] char(32) primary key not null ,		--用户ID
	username varchar(50) not null ,					--用户名
	[password] varchar(50) not null ,				--密码
	sex char(2) default '男' check(sex='男' or sex='女') ,--性别
	birth date,										--出生日期
	[signature] varchar(50),							--个人签名
	[address] varchar(200),							--地址
	regTime date default getdate(), 				--用户注册时间
	email varchar(50) not null ,					--邮箱
	[state] int default 0, 							--记录某一部视频是否已经被播放了[状态]
	grade int default 0 check(grade>=0  and grade<=60 ),--等级	
	micro_blog varchar(50),							--微博
	label varchar(30),							--标签
	follow int, 								--关注量
	fans int,									--粉丝量
	[collection] int, 							--收藏量
	letterID char(32),							--私信
)
select * from users
select * from video where videouserid = ?

--视频表
create table video
(
	video_ID char(32) primary key not null ,		--视频ID
	title varchar(30) not null,						--标题
	[type] varchar(20) not null,					--类型
	introduction varchar(200) not null,				--简介
	Release date default getdate(),					--发布时间
	praise int default 0,							--点赞数量
	share int default 0 ,					--分享量
	concern int default 0 ,					--关注量
	audience int default 0 ,				--观众人数
	[collection] int default 0 ,			--收藏量
	play int default 0 ,					--播放量
	support int default 0 ,					--支持量
	[status] int default 0 ,				--状态0:表示播放成功--状态1:表示播放失败
	danmaku int default 0 ,					--弹幕量
	videoname varchar(200) not null,				--视频名称
	videoimg varchar(200) not null,				--图片名称
	videouserid char(32) foreign key references users([user_ID])
)

--商品表
create table Product(
	pname varchar(100),--商品的名称
	price decimal ,--商品的价格
	pcount int  ,--商品的数量
	pimg varchar(100)  ,--商品的图片
	pdescription text  ,--商品的描述
	pclassify varchar(100)  --商品的分类
)

drop table Product
/*
0251446BCFE34B47B1C70943BA982B81	21 小狗豆豆_高清.mp4	动漫	21 小狗豆豆_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	e72d93fb-fe1e-41bd-b8f0-921f5fbd74c921 小狗豆豆_高清.mp4	88a58743-e699-49fd-9186-48c4ed178a55u=2253154838,1049461244&fm=21&gp=0.jpg	35E5780253FC4AD7ADF83AE083A7264D
03AFEAFFA26C4E84B49CACEAB86A25C5	46 五指歌_高清.mp4	今日热门	46 五指歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	90897d53-1e2f-4443-8f2f-245f22ca5e0f46 五指歌_高清.mp4	fce7f92b-25f7-447c-8142-d532d8b573bbN`J5BZLR[X(X3(_A(5]RG3H.png	35E5780253FC4AD7ADF83AE083A7264D
069E5558D8684B1492C91B0BEA39B488	27 英文字母歌_高清.mp4	动漫	27 英文字母歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	432be2b1-e121-49c3-8d3e-057f2a2f27d427 英文字母歌_高清.mp4	e75b0a03-0cba-4689-8ed6-5cecaf04cb06R6OCIQI5NU[(3Y)1)XT$DSU.png	35E5780253FC4AD7ADF83AE083A7264D
08B78CF3B7CF445EAB156793C9C9CC7D	36 三只小熊_高清.mp4	童年	36 三只小熊_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	52b427be-1edc-461a-a59e-3b65d6ca4c6d36 三只小熊_高清.mp4	90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
0C1303F1ABDF479E8BDA7F5FF7317C76	16 外婆的澎湖湾_高清.mp4	音乐	16 外婆的澎湖湾_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	64f8af87-5a78-4371-83f7-e04eb3b836c216 外婆的澎湖湾_高清.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
0D17BF8F0CFC445B87BDFDDEB5B8A484	09 可爱颂_高清.mp4	音乐	09 可爱颂_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	0a892c46-5cd3-4c20-aaef-4d99a27f5d8909 可爱颂_高清.mp4	90876034-f7d1-437a-b8be-e218db9c41171I8[E4ZC8JS53.png	35E5780253FC4AD7ADF83AE083A7264D
14BAF69AD3214B9D8CA6D984C1265BB1	38 兔子舞_高清.mp4	童年	38 兔子舞_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	af8e8bd6-d2b3-4bbb-b6a8-0b7ba5a15db838 兔子舞_高清.mp4	f9b663c2-b6af-475d-ada3-7c8759113826EXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
1869EA73682E41C1912B408354990601	45 哇哈哈_高清.mp4	今日热门	45 哇哈哈	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 哇哈哈_高清.mp4	1bb7cd37-a83d-466b-8243-4b7ca7b97612JM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
200034DDEFE4418D86CD1ACD18250AEB	24 小小手_高清.mp4	动漫	24 小小手_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8dcafbcc-f6c2-4a4e-b163-fac2f2aa3cf024 小小手_高清.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
277E029595F54EE7B2F38E0B06C6033B	25 牙儿乐乐_高清.mp4	动漫	25 牙儿乐乐_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	42bbe479-5d73-4108-bff2-d8439bf0c9af25 牙儿乐乐_高清.mp4	dfd96217-4d0e-4d8d-8834-43d4d30d9370[C500M2H9UQF08RLIDNU.png	35E5780253FC4AD7ADF83AE083A7264D
27CB8B8397B04EC4B7D22D7CDBDC8326	30 爱我你就抱抱我_高清.mp4	动漫	30 爱我你就抱抱我_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	c0376cee-347e-46ff-97e8-66ca772868b930 爱我你就抱抱我_高清.mp4	303b5e50-5eac-4829-89be-4137428021af(5E4EJ3Q_G0Y1YQ.png	35E5780253FC4AD7ADF83AE083A7264D
280075C7E5B845BD9A842CB5A0D718DB	10 蓝天宝贝_高清.mp4	音乐	10 蓝天宝贝_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	d9d0b052-8ffb-410d-ac32-477d3b04791a10 蓝天宝贝_高清.mp4	ceb87f90-1935-4814-a80f-541f11e985a9C6O5H]GLP8B@G`H~AXH436R.png	35E5780253FC4AD7ADF83AE083A7264D
2B1EF52873AE43CD8F82ACDD35E9CB9E	13 妈妈你可知道_高清.mp4	音乐	13 妈妈你可知道_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	25dec12d-12e5-4b79-a779-c31b1321bb9913 妈妈你可知道_高清.mp4	22a67c0e-6bc8-47eb-9aba-531d0dca27beU4YNW4GT7V8MQOG.png	35E5780253FC4AD7ADF83AE083A7264D
33DFD60127DA428F8D91CB91556992AB	20 小动物怎么叫_高清.mp4	动漫	20 小动物怎么叫_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	041a3b69-96dc-4e7c-8b37-965156850aa420 小动物怎么叫_高清.mp4	545750a8-7b20-4041-9eff-1f0978d48224$9FIWRVJROKT.png	35E5780253FC4AD7ADF83AE083A7264D
3859FA364C864552BBEAB76AFFF7BC0B	6 好宝宝_高清.mp4	音乐	6 好宝宝_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	88fe1be7-1bfd-42b2-8c11-9abe0d7eb3366 好宝宝_高清.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
3EA014D19F1D418FAD79BBDD1C0216D8	42 加油歌_高清.mp4	童年	42 加油歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	86bfc096-eab2-42e7-82c5-55ac44bd9d3342 加油歌_高清.mp4	d22cc44f-e073-4aa0-9118-5d13174876681I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
429E6ADD29BF47CE81E2A959BB065F02	12 铃儿响叮当_高清.mp4	音乐	12 铃儿响叮当_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	b3e7152d-0672-4ce3-96aa-6990d594ea6c12 铃儿响叮当_高清.mp4	ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png	35E5780253FC4AD7ADF83AE083A7264D
47E76EECCB1642FC9659922ED6C4CECD	37 数数歌_高清.mp4	童年	37 数数歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	0d1526cc-e556-4b42-ae71-a02bc3592a8337 数数歌_高清.mp4	fbc91ba4-f58b-44d4-9451-2431acd4637d1I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
53ECC2E6E31D49479DFC4DDC9CDD1952	15 数鸭子_高清.mp4	音乐	15 数鸭子_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7cda03ff-e85e-48b7-9490-c13ced36328615 数鸭子_高清.mp4	a41d317a-b4ff-41dc-b7b5-ee4d73c3a02fJM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
5E2B9439F43C4368B498C683EE7FE152	44 拾稻穗的小姑娘_高清.mp4	今日热门	44 拾稻穗的小姑娘_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8b4a4e26-0765-472d-90bc-4ba3dafb531e44 拾稻穗的小姑娘_高清.mp4	ed1b84d1-78be-4ff7-a0bc-d3eee2d011ad]TRS]3Y9Q6JU7}8AG23A982.png	35E5780253FC4AD7ADF83AE083A7264D
6CB3946C537F46F59FB5A5F841F8E9AD	08 酒鬼老爸_高清.mp4	音乐	08 酒鬼老爸_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	09cef112-3d98-41da-ae5c-f9bd5f83ac6908 酒鬼老爸_高清.mp4	1eac2582-320c-4d70-bef2-fcaa5b751a8d[L]M_]UL]DITPUC_$(0TFPK.png	35E5780253FC4AD7ADF83AE083A7264D
71098772953743BFB6AB003BB0138591	34 金色童年_高清.mp4	童年	34 金色童年_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	b948ec77-bcd2-4a9d-a9df-c74e8c76191a34 金色童年_高清.mp4	34e9f2e9-e650-41be-92be-7ee3bded8becJM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
711D604DBEEA45F1AC31D308CA1DAC88	17 我是一条小青龙_高清.mp4	音乐	17 我是一条小青龙_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	291f5ab6-dbf1-4a10-82b0-1c5295c1cd6817 我是一条小青龙_高清.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
71C6CFDBA792428DBB91686C1C36FF1C	22 小猫跑跑_高清.mp4	动漫	22 小猫跑跑_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	1673ecbe-2b8f-43b5-afcd-1844c4e0514422 小猫跑跑_高清.mp4	5f619cbd-37d8-49ed-90aa-ca0d54de3ca6{QSB422YRK8WD2S907OQWRL.png	35E5780253FC4AD7ADF83AE083A7264D
725BA22908AE431FBE7498E958ACE7BE	47 幸福拍手歌_高清.mp4	今日热门	47 幸福拍手歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 哇哈哈_高清.mp4	1eac2582-320c-4d70-bef2-fcaa5b751a8d[L]M_]UL]DITPUC(0TFPK.png	35E5780253FC4AD7ADF83AE083A7264D
7D335240BDF14B38BC2A04203A78E4AC	23 小毛驴_高清.mp4	动漫	23 小毛驴_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	97d85dde-3958-4ab0-9232-ddd15fabc96623 小毛驴_高清.mp4	9596b37c-6e8b-4cc5-a6ef-d22b3105bc0d0}81DVFG_NO]279$NUF56{8.png	35E5780253FC4AD7ADF83AE083A7264D
7D81D7C49829459E8F0984B8840D7CC3	18 香草咪咪_高清.mp4	音乐	18 香草咪咪_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	101bcfc4-f6ad-4606-867e-97ce9b1c256618 香草咪咪_高清.mp4	ba91dda6-aa2f-45ef-a4ad-2bdba0c695f527AN{C4~0JGIG8W7G}U8YW4.png	35E5780253FC4AD7ADF83AE083A7264D
839EB94DDDEB4663AD7A5DAF12D4D604	30 爱我你就抱抱我_高清.mp4	动漫	30 爱我你就抱抱我_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	84e6b952-aaa7-44fc-ab5c-360523e10e3930 爱我你就抱抱我_高清.mp4	74f0af6e-a6ef-4971-96a7-561adc8a4d1fGP5TNQCUQOM(P2B3HS.png	35E5780253FC4AD7ADF83AE083A7264D
8541EDAD899C426BAA2C92F1103B7CA2	19 小白兔请客_高清.mp4	音乐	19 小白兔请客_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	31890fe5-8e65-45f1-9ece-88e5a3530da119 小白兔请客_高清.mp4	b1fdb8ea-c68d-4138-b795-771657d29745G_Q67JT$BDOY6Q73_L[J$1G.png	35E5780253FC4AD7ADF83AE083A7264D
8F695FD68A32437FBD2C7CADC4010399	40 小猪小猪肥嘟嘟_高清.mp4	童年	40 小猪小猪肥嘟嘟_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	848eb117-ec6c-4480-a90e-45a4559abbc840 小猪小猪肥嘟嘟_高清.mp4	5aca8c83-14d3-4a54-a5d3-3c3946a77871TFFQ0JL%TQ6SV7V0`D$V2DL.png	35E5780253FC4AD7ADF83AE083A7264D
98BBE627751C416D9BFE2BA6C7B7B83A	11 狼来了_高清.mp4	音乐	11 狼来了_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7633fa03-3f1b-4fd9-ab09-f4ff3992917a11 狼来了_高清.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
99B276607CE944BD8E44AA26784EA732	48 牛奶歌_高清.mp4	今日热门	48 牛奶歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	9c3fe988-631f-4aa9-8bcb-9b7691f288d848 牛奶歌_高清.mp4	312af0d0-746a-49e3-b432-56b8158c39eeEJHPYRXHIC5ERLUSGTV.png	35E5780253FC4AD7ADF83AE083A7264D
9B6CDF0391BD47A59B2CE3497D8CE96B	32 好好吃饭_高清.mp4	今日热门	32 好好吃饭_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7d3468ca-0a81-4a81-9b8e-93bc8f1d27ba32 好好吃饭_高清.mp4	e5f86ce4-44d6-4a89-9c44-bc4ce7728bc57~]ZUFE[YRWSN0Z50_L_ZAP.png	35E5780253FC4AD7ADF83AE083A7264D
9CCC6332FEFA41C8A4F0B6EF9B977654	04 饭桌之歌_高清.mp4	音乐	04 饭桌之歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	2f6f0ad4-1d6a-4f95-9ba5-a1e4cc5a207d04 饭桌之歌_高清.mp4	fcf62152-8f2e-4396-b1d6-7a5405bc73db)29QN8$9XS((S0N3}K`HKNO.png	35E5780253FC4AD7ADF83AE083A7264D
A26F3A0D4AD144038141B335E759F5EC	01 1-10数字歌_高清.mp4	音乐	01 1-10数字歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	05b6605b-f700-43d5-966a-5802c8ced05e01 1-10数字歌_高清.mp4	fce7f92b-25f7-447c-8142-d532d8b573bbN`J5BZLR[X(X3(_A(5]RG3H.png	35E5780253FC4AD7ADF83AE083A7264D
A3A7F2CA507D4C6392E151ECAD7A64C0	33 好妈妈_高清.mp4	今日热门	33 好妈妈_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a0e001e2-21a1-4958-b869-ca93edee34f133 好妈妈_高清.mp4	8385d274-f82e-4b1f-ae59-70e213ad396826UK{0}ESQLYY5(X{H]CBPK.png	35E5780253FC4AD7ADF83AE083A7264D
A4901031BA064D60858B6CE50025AF9C	07 戒烟之歌_高清.mp4	音乐	07 戒烟之歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	222f0b3b-6f36-4740-a5f1-fbc6422f406607 戒烟之歌_高清.mp4	ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png	35E5780253FC4AD7ADF83AE083A7264D
B021D36FFAFA417CB5CCFD72914F21B0	39 小小粉刷匠_高清.mp4	童年	39 小小粉刷匠_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	fb843928-8774-49b7-9d11-5b74ae7fd4a639 小小粉刷匠_高清.mp4	8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRR$P2EHX2%7ESLF.png	35E5780253FC4AD7ADF83AE083A7264D
B576BFC09BF243C5B7B2EAD731AC02ED	35 卖报歌_高清.mp4	童年	35 卖报歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	933d2171-1f05-4a1a-85d3-9e6cf100cc8435 卖报歌_高清.mp4	1bb7cd37-a83d-466b-8243-4b7ca7b97612JM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
BEC596D6C831481D89D722904AADDEF5	03 大象拔河_高清.mp4	音乐	03 大象拔河_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	3170ca7e-cee2-4cdb-ad21-02dd6dd3ec9803 大象拔河_高清.mp4	c6884195-47fe-4c6a-b689-b7adc41d805e9KEUTUJHJ10L6AQON5K.png	35E5780253FC4AD7ADF83AE083A7264D
D1802F61A01C4CD6B6BDC3F5D0B89C67	29 捉泥鳅_高清.mp4	动漫	29 捉泥鳅_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8f4311c5-eae0-493d-be7d-459da64c30c429 捉泥鳅_高清.mp4	5aca8c83-14d3-4a54-a5d3-3c3946a77871TFFQ0JLTQ6SV7V0V2DL.png	35E5780253FC4AD7ADF83AE083A7264D
D1E3A5BCF5E542799431EC878A22F235	26 洋娃娃的舞会_高清.mp4	动漫	26 洋娃娃的舞会_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	238d3574-b459-4bcf-8c96-0c2168f9959026 洋娃娃的舞会_高清.mp4	ceb87f90-1935-4814-a80f-541f11e985a9C6O5H]GLP8B@G`H~AXH436R.png	35E5780253FC4AD7ADF83AE083A7264D
E28A7DCD51AC46F88368A51785C8F798	55 健康歌_高清.mp4	今日热门	55 健康歌_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	59abe5af-d925-4a90-8f46-c1fe11d8b43a55 健康歌_高清.mp4	22a67c0e-6bc8-47eb-9aba-531d0dca27beU4YNW4GT7V8MQOG.png	35E5780253FC4AD7ADF83AE083A7264D
E52444BB13A54314AEB030812069AB09	02 包饺子_高清.mp4	音乐	02 包饺子_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a0f309ec-ea11-41a7-93ce-2a95d63b7a2d02 包饺子_高清.mp4	8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRRP2EHX27ESLF.png	35E5780253FC4AD7ADF83AE083A7264D
E5AA09724BD8413D9984FEEB44DAE1D0	28 种太阳_高清.mp4	动漫	28 种太阳_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	6bce72e7-2bf9-49d1-af03-6f14376ff90028 种太阳_高清.mp4	7963d30d-9964-4c7d-b780-bb7ec6438a9fABJH8SJBSHB5Y~~7SH`BN5E.png	35E5780253FC4AD7ADF83AE083A7264D
F062203CCAA2463D8E6F11252906C70A	14 世上只有妈妈好_高清.mp4	音乐	14 世上只有妈妈好_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a5dd222c-7c12-4abb-8847-5645556fb3b714 世上只有妈妈好_高清.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
F39DED7904234229B6B541D5D0410697	31 哈巴狗_高清.mp4	今日热门	31 哈巴狗_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 哈巴狗_高清.mp4	2c231105-08f8-4d04-b296-c21de31e1816K5JOC1ZID134BQSSG.png	35E5780253FC4AD7ADF83AE083A7264D
F4CAEC3185D1404790B7C61419200534	43 劳动最光荣_高清.mp4	童年	43 劳动最光荣_高清.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7c36bf58-b0b0-4b34-bce7-852ab91b334843 劳动最光荣_高清.mp4	e3895121-c1f9-4a65-a2a9-06cfbf10cf54IQ$SXHZ$R{F03JMA]10[LMB.png	35E5780253FC4AD7ADF83AE083A7264D
	
select * from video where videoimg like '%90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png%'

delete video where video_ID = '60E335F461BE4D24A5106603D1954AFA'


insert into video values('29B276607CE944BD8E44AA26784EA732','48 牛奶歌_高清.mp4','今日热门','48 牛奶歌_高清.mp4','1996-01-02',default,default,default,default,default,default,default,default,default,'9c3fe988-631f-4aa9-8bcb-9b7691f288d848 牛奶歌_高清.mp4','8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRRP2EHX27ESLF.png','35E5780253FC4AD7ADF83AE083A7264D')


select * from video where video_ID='0251446BCFE34B47B1C70943BA982B81'
update video set play = '0' where video_ID= '0251446BCFE34B47B1C70943BA982B81'

--根据时间进行降序,即最新的时间放在前面
select count(*) count from (select Release,ROW_NUMBER() OVER(order by Release desc) as rowNumber from video) video
select * from (select *, ROW_NUMBER() OVER(Order by a.Release desc) AS RowNumber from video as a ) as b where b.RowNumber BETWEEN '1' and '5'
select * from (select * , row_number() over( Order by a.video_ID asc ) AS RowNumber from video as a ) as b where RowNumber = '2'

*/

update video set videoimg ='ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png' where video_ID = '08B78CF3B7CF445EAB156793C9C9CC7D'
--分类
create table category(
	cid char(32) primary key ,
	cname varchar(100) not null --分类的名称
)

insert into category values()

select * from category

--商品表
create table product(
	pid char(32) primary key not null ,--商品id
	pname varchar(50) not null,			--商品名称
	price decimal(10,0) not null,				--商品价格
	pcount int not null ,				--商品数量
	pimg varchar(100) not null,			--商品图片
	pdescription text not null,			--商品描述
	cid char(32) foreign key references category(cid)--商品类型
)
alter table product drop column pclassify; 
alter table product
alter column price  decimal(10,0)
delete product where pid = '76F2C29DDD7645D28D4B0A57DE5AD5F6'
select * from product
alter table product rename column cid to thisname

select pid,pname,price,pcount,pimg,pdescription,a.cid,cname from product a,category b where a.cid=b.cid
--订单表
create table orders(
	oid char(32) primary key ,--订单编号
	ordertime datetime default getDate(),--订单生产时间
	total decimal(10,0) ,--订单合计
	[status] int default 0 ,/*订单状态：未付款、已付款但未发货、已发货但未确认收货、收货已结束*/
	[user_ID] char(32) ,--订单的主人
	address varchar(200) ,--订单的收货地址
	foreign key ([user_ID]) references users([user_ID])--这条订单属于那一个用户的
)

select * from orders
--订单项
create table orderitem(
	oitemid char(32) primary key ,--订单项id
	ocount int ,--数量
	subtotal decimal(10,0),--小计
	oid char(32) foreign key references orders(oid),--所属订单
	pid char(32) foreign key references product(pid) --订单项所指的商品
)
select * from orderitem

select * from video where videoimg='90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png'
select count(*) from video where title like '%小%'