create database MS_space

use MS_space

--�û���Ϣ��
create table users
(
	[user_ID] char(32) primary key not null ,		--�û�ID
	username varchar(50) not null ,					--�û���
	[password] varchar(50) not null ,				--����
	sex char(2) default '��' check(sex='��' or sex='Ů') ,--�Ա�
	birth date,										--��������
	[signature] varchar(50),							--����ǩ��
	[address] varchar(200),							--��ַ
	regTime date default getdate(), 				--�û�ע��ʱ��
	email varchar(50) not null ,					--����
	[state] int default 0, 							--��¼ĳһ����Ƶ�Ƿ��Ѿ���������[״̬]
	grade int default 0 check(grade>=0  and grade<=60 ),--�ȼ�	
	micro_blog varchar(50),							--΢��
	label varchar(30),							--��ǩ
	follow int, 								--��ע��
	fans int,									--��˿��
	[collection] int, 							--�ղ���
	letterID char(32),							--˽��
)
select * from users
select * from video where videouserid = ?

--��Ƶ��
create table video
(
	video_ID char(32) primary key not null ,		--��ƵID
	title varchar(30) not null,						--����
	[type] varchar(20) not null,					--����
	introduction varchar(200) not null,				--���
	Release date default getdate(),					--����ʱ��
	praise int default 0,							--��������
	share int default 0 ,					--������
	concern int default 0 ,					--��ע��
	audience int default 0 ,				--��������
	[collection] int default 0 ,			--�ղ���
	play int default 0 ,					--������
	support int default 0 ,					--֧����
	[status] int default 0 ,				--״̬0:��ʾ���ųɹ�--״̬1:��ʾ����ʧ��
	danmaku int default 0 ,					--��Ļ��
	videoname varchar(200) not null,				--��Ƶ����
	videoimg varchar(200) not null,				--ͼƬ����
	videouserid char(32) foreign key references users([user_ID])
)

--��Ʒ��
create table Product(
	pname varchar(100),--��Ʒ������
	price decimal ,--��Ʒ�ļ۸�
	pcount int  ,--��Ʒ������
	pimg varchar(100)  ,--��Ʒ��ͼƬ
	pdescription text  ,--��Ʒ������
	pclassify varchar(100)  --��Ʒ�ķ���
)

drop table Product
/*
0251446BCFE34B47B1C70943BA982B81	21 С������_����.mp4	����	21 С������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	e72d93fb-fe1e-41bd-b8f0-921f5fbd74c921 С������_����.mp4	88a58743-e699-49fd-9186-48c4ed178a55u=2253154838,1049461244&fm=21&gp=0.jpg	35E5780253FC4AD7ADF83AE083A7264D
03AFEAFFA26C4E84B49CACEAB86A25C5	46 ��ָ��_����.mp4	��������	46 ��ָ��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	90897d53-1e2f-4443-8f2f-245f22ca5e0f46 ��ָ��_����.mp4	fce7f92b-25f7-447c-8142-d532d8b573bbN`J5BZLR[X(X3(_A(5]RG3H.png	35E5780253FC4AD7ADF83AE083A7264D
069E5558D8684B1492C91B0BEA39B488	27 Ӣ����ĸ��_����.mp4	����	27 Ӣ����ĸ��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	432be2b1-e121-49c3-8d3e-057f2a2f27d427 Ӣ����ĸ��_����.mp4	e75b0a03-0cba-4689-8ed6-5cecaf04cb06R6OCIQI5NU[(3Y)1)XT$DSU.png	35E5780253FC4AD7ADF83AE083A7264D
08B78CF3B7CF445EAB156793C9C9CC7D	36 ��ֻС��_����.mp4	ͯ��	36 ��ֻС��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	52b427be-1edc-461a-a59e-3b65d6ca4c6d36 ��ֻС��_����.mp4	90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
0C1303F1ABDF479E8BDA7F5FF7317C76	16 ���ŵ������_����.mp4	����	16 ���ŵ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	64f8af87-5a78-4371-83f7-e04eb3b836c216 ���ŵ������_����.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
0D17BF8F0CFC445B87BDFDDEB5B8A484	09 �ɰ���_����.mp4	����	09 �ɰ���_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	0a892c46-5cd3-4c20-aaef-4d99a27f5d8909 �ɰ���_����.mp4	90876034-f7d1-437a-b8be-e218db9c41171I8[E4ZC8JS53.png	35E5780253FC4AD7ADF83AE083A7264D
14BAF69AD3214B9D8CA6D984C1265BB1	38 ������_����.mp4	ͯ��	38 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	af8e8bd6-d2b3-4bbb-b6a8-0b7ba5a15db838 ������_����.mp4	f9b663c2-b6af-475d-ada3-7c8759113826EXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
1869EA73682E41C1912B408354990601	45 �۹���_����.mp4	��������	45 �۹���	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 �۹���_����.mp4	1bb7cd37-a83d-466b-8243-4b7ca7b97612JM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
200034DDEFE4418D86CD1ACD18250AEB	24 СС��_����.mp4	����	24 СС��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8dcafbcc-f6c2-4a4e-b163-fac2f2aa3cf024 СС��_����.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
277E029595F54EE7B2F38E0B06C6033B	25 ��������_����.mp4	����	25 ��������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	42bbe479-5d73-4108-bff2-d8439bf0c9af25 ��������_����.mp4	dfd96217-4d0e-4d8d-8834-43d4d30d9370[C500M2H9UQF08RLIDNU.png	35E5780253FC4AD7ADF83AE083A7264D
27CB8B8397B04EC4B7D22D7CDBDC8326	30 ������ͱ�����_����.mp4	����	30 ������ͱ�����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	c0376cee-347e-46ff-97e8-66ca772868b930 ������ͱ�����_����.mp4	303b5e50-5eac-4829-89be-4137428021af(5E4EJ3Q_G0Y1YQ.png	35E5780253FC4AD7ADF83AE083A7264D
280075C7E5B845BD9A842CB5A0D718DB	10 ���챦��_����.mp4	����	10 ���챦��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	d9d0b052-8ffb-410d-ac32-477d3b04791a10 ���챦��_����.mp4	ceb87f90-1935-4814-a80f-541f11e985a9C6O5H]GLP8B@G`H~AXH436R.png	35E5780253FC4AD7ADF83AE083A7264D
2B1EF52873AE43CD8F82ACDD35E9CB9E	13 �������֪��_����.mp4	����	13 �������֪��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	25dec12d-12e5-4b79-a779-c31b1321bb9913 �������֪��_����.mp4	22a67c0e-6bc8-47eb-9aba-531d0dca27beU4YNW4GT7V8MQOG.png	35E5780253FC4AD7ADF83AE083A7264D
33DFD60127DA428F8D91CB91556992AB	20 С������ô��_����.mp4	����	20 С������ô��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	041a3b69-96dc-4e7c-8b37-965156850aa420 С������ô��_����.mp4	545750a8-7b20-4041-9eff-1f0978d48224$9FIWRVJROKT.png	35E5780253FC4AD7ADF83AE083A7264D
3859FA364C864552BBEAB76AFFF7BC0B	6 �ñ���_����.mp4	����	6 �ñ���_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	88fe1be7-1bfd-42b2-8c11-9abe0d7eb3366 �ñ���_����.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
3EA014D19F1D418FAD79BBDD1C0216D8	42 ���͸�_����.mp4	ͯ��	42 ���͸�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	86bfc096-eab2-42e7-82c5-55ac44bd9d3342 ���͸�_����.mp4	d22cc44f-e073-4aa0-9118-5d13174876681I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
429E6ADD29BF47CE81E2A959BB065F02	12 ����춣��_����.mp4	����	12 ����춣��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	b3e7152d-0672-4ce3-96aa-6990d594ea6c12 ����춣��_����.mp4	ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png	35E5780253FC4AD7ADF83AE083A7264D
47E76EECCB1642FC9659922ED6C4CECD	37 ������_����.mp4	ͯ��	37 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	0d1526cc-e556-4b42-ae71-a02bc3592a8337 ������_����.mp4	fbc91ba4-f58b-44d4-9451-2431acd4637d1I`8[E4Z~C8J$5R)%H1`S53.png	35E5780253FC4AD7ADF83AE083A7264D
53ECC2E6E31D49479DFC4DDC9CDD1952	15 ��Ѽ��_����.mp4	����	15 ��Ѽ��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7cda03ff-e85e-48b7-9490-c13ced36328615 ��Ѽ��_����.mp4	a41d317a-b4ff-41dc-b7b5-ee4d73c3a02fJM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
5E2B9439F43C4368B498C683EE7FE152	44 ʰ�����С����_����.mp4	��������	44 ʰ�����С����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8b4a4e26-0765-472d-90bc-4ba3dafb531e44 ʰ�����С����_����.mp4	ed1b84d1-78be-4ff7-a0bc-d3eee2d011ad]TRS]3Y9Q6JU7}8AG23A982.png	35E5780253FC4AD7ADF83AE083A7264D
6CB3946C537F46F59FB5A5F841F8E9AD	08 �ƹ��ϰ�_����.mp4	����	08 �ƹ��ϰ�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	09cef112-3d98-41da-ae5c-f9bd5f83ac6908 �ƹ��ϰ�_����.mp4	1eac2582-320c-4d70-bef2-fcaa5b751a8d[L]M_]UL]DITPUC_$(0TFPK.png	35E5780253FC4AD7ADF83AE083A7264D
71098772953743BFB6AB003BB0138591	34 ��ɫͯ��_����.mp4	ͯ��	34 ��ɫͯ��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	b948ec77-bcd2-4a9d-a9df-c74e8c76191a34 ��ɫͯ��_����.mp4	34e9f2e9-e650-41be-92be-7ee3bded8becJM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
711D604DBEEA45F1AC31D308CA1DAC88	17 ����һ��С����_����.mp4	����	17 ����һ��С����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	291f5ab6-dbf1-4a10-82b0-1c5295c1cd6817 ����һ��С����_����.mp4	0bf128fe-c25e-4802-99ec-cce3a0b9831fEXQ09GISXV{_5V$45T]6I7E.png	35E5780253FC4AD7ADF83AE083A7264D
71C6CFDBA792428DBB91686C1C36FF1C	22 Сè����_����.mp4	����	22 Сè����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	1673ecbe-2b8f-43b5-afcd-1844c4e0514422 Сè����_����.mp4	5f619cbd-37d8-49ed-90aa-ca0d54de3ca6{QSB422YRK8WD2S907OQWRL.png	35E5780253FC4AD7ADF83AE083A7264D
725BA22908AE431FBE7498E958ACE7BE	47 �Ҹ����ָ�_����.mp4	��������	47 �Ҹ����ָ�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 �۹���_����.mp4	1eac2582-320c-4d70-bef2-fcaa5b751a8d[L]M_]UL]DITPUC(0TFPK.png	35E5780253FC4AD7ADF83AE083A7264D
7D335240BDF14B38BC2A04203A78E4AC	23 Сë¿_����.mp4	����	23 Сë¿_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	97d85dde-3958-4ab0-9232-ddd15fabc96623 Сë¿_����.mp4	9596b37c-6e8b-4cc5-a6ef-d22b3105bc0d0}81DVFG_NO]279$NUF56{8.png	35E5780253FC4AD7ADF83AE083A7264D
7D81D7C49829459E8F0984B8840D7CC3	18 �������_����.mp4	����	18 �������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	101bcfc4-f6ad-4606-867e-97ce9b1c256618 �������_����.mp4	ba91dda6-aa2f-45ef-a4ad-2bdba0c695f527AN{C4~0JGIG8W7G}U8YW4.png	35E5780253FC4AD7ADF83AE083A7264D
839EB94DDDEB4663AD7A5DAF12D4D604	30 ������ͱ�����_����.mp4	����	30 ������ͱ�����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	84e6b952-aaa7-44fc-ab5c-360523e10e3930 ������ͱ�����_����.mp4	74f0af6e-a6ef-4971-96a7-561adc8a4d1fGP5TNQCUQOM(P2B3HS.png	35E5780253FC4AD7ADF83AE083A7264D
8541EDAD899C426BAA2C92F1103B7CA2	19 С�������_����.mp4	����	19 С�������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	31890fe5-8e65-45f1-9ece-88e5a3530da119 С�������_����.mp4	b1fdb8ea-c68d-4138-b795-771657d29745G_Q67JT$BDOY6Q73_L[J$1G.png	35E5780253FC4AD7ADF83AE083A7264D
8F695FD68A32437FBD2C7CADC4010399	40 С��С�����_����.mp4	ͯ��	40 С��С�����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	848eb117-ec6c-4480-a90e-45a4559abbc840 С��С�����_����.mp4	5aca8c83-14d3-4a54-a5d3-3c3946a77871TFFQ0JL%TQ6SV7V0`D$V2DL.png	35E5780253FC4AD7ADF83AE083A7264D
98BBE627751C416D9BFE2BA6C7B7B83A	11 ������_����.mp4	����	11 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7633fa03-3f1b-4fd9-ab09-f4ff3992917a11 ������_����.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
99B276607CE944BD8E44AA26784EA732	48 ţ�̸�_����.mp4	��������	48 ţ�̸�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	9c3fe988-631f-4aa9-8bcb-9b7691f288d848 ţ�̸�_����.mp4	312af0d0-746a-49e3-b432-56b8158c39eeEJHPYRXHIC5ERLUSGTV.png	35E5780253FC4AD7ADF83AE083A7264D
9B6CDF0391BD47A59B2CE3497D8CE96B	32 �úóԷ�_����.mp4	��������	32 �úóԷ�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7d3468ca-0a81-4a81-9b8e-93bc8f1d27ba32 �úóԷ�_����.mp4	e5f86ce4-44d6-4a89-9c44-bc4ce7728bc57~]ZUFE[YRWSN0Z50_L_ZAP.png	35E5780253FC4AD7ADF83AE083A7264D
9CCC6332FEFA41C8A4F0B6EF9B977654	04 ����֮��_����.mp4	����	04 ����֮��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	2f6f0ad4-1d6a-4f95-9ba5-a1e4cc5a207d04 ����֮��_����.mp4	fcf62152-8f2e-4396-b1d6-7a5405bc73db)29QN8$9XS((S0N3}K`HKNO.png	35E5780253FC4AD7ADF83AE083A7264D
A26F3A0D4AD144038141B335E759F5EC	01 1-10���ָ�_����.mp4	����	01 1-10���ָ�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	05b6605b-f700-43d5-966a-5802c8ced05e01 1-10���ָ�_����.mp4	fce7f92b-25f7-447c-8142-d532d8b573bbN`J5BZLR[X(X3(_A(5]RG3H.png	35E5780253FC4AD7ADF83AE083A7264D
A3A7F2CA507D4C6392E151ECAD7A64C0	33 ������_����.mp4	��������	33 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a0e001e2-21a1-4958-b869-ca93edee34f133 ������_����.mp4	8385d274-f82e-4b1f-ae59-70e213ad396826UK{0}ESQLYY5(X{H]CBPK.png	35E5780253FC4AD7ADF83AE083A7264D
A4901031BA064D60858B6CE50025AF9C	07 ����֮��_����.mp4	����	07 ����֮��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	222f0b3b-6f36-4740-a5f1-fbc6422f406607 ����֮��_����.mp4	ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png	35E5780253FC4AD7ADF83AE083A7264D
B021D36FFAFA417CB5CCFD72914F21B0	39 СС��ˢ��_����.mp4	ͯ��	39 СС��ˢ��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	fb843928-8774-49b7-9d11-5b74ae7fd4a639 СС��ˢ��_����.mp4	8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRR$P2EHX2%7ESLF.png	35E5780253FC4AD7ADF83AE083A7264D
B576BFC09BF243C5B7B2EAD731AC02ED	35 ������_����.mp4	ͯ��	35 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	933d2171-1f05-4a1a-85d3-9e6cf100cc8435 ������_����.mp4	1bb7cd37-a83d-466b-8243-4b7ca7b97612JM7WEJZH[~W}}}U_H60)4QW.png	35E5780253FC4AD7ADF83AE083A7264D
BEC596D6C831481D89D722904AADDEF5	03 ����κ�_����.mp4	����	03 ����κ�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	3170ca7e-cee2-4cdb-ad21-02dd6dd3ec9803 ����κ�_����.mp4	c6884195-47fe-4c6a-b689-b7adc41d805e9KEUTUJHJ10L6AQON5K.png	35E5780253FC4AD7ADF83AE083A7264D
D1802F61A01C4CD6B6BDC3F5D0B89C67	29 ׽����_����.mp4	����	29 ׽����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	8f4311c5-eae0-493d-be7d-459da64c30c429 ׽����_����.mp4	5aca8c83-14d3-4a54-a5d3-3c3946a77871TFFQ0JLTQ6SV7V0V2DL.png	35E5780253FC4AD7ADF83AE083A7264D
D1E3A5BCF5E542799431EC878A22F235	26 �����޵����_����.mp4	����	26 �����޵����_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	238d3574-b459-4bcf-8c96-0c2168f9959026 �����޵����_����.mp4	ceb87f90-1935-4814-a80f-541f11e985a9C6O5H]GLP8B@G`H~AXH436R.png	35E5780253FC4AD7ADF83AE083A7264D
E28A7DCD51AC46F88368A51785C8F798	55 ������_����.mp4	��������	55 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	59abe5af-d925-4a90-8f46-c1fe11d8b43a55 ������_����.mp4	22a67c0e-6bc8-47eb-9aba-531d0dca27beU4YNW4GT7V8MQOG.png	35E5780253FC4AD7ADF83AE083A7264D
E52444BB13A54314AEB030812069AB09	02 ������_����.mp4	����	02 ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a0f309ec-ea11-41a7-93ce-2a95d63b7a2d02 ������_����.mp4	8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRRP2EHX27ESLF.png	35E5780253FC4AD7ADF83AE083A7264D
E5AA09724BD8413D9984FEEB44DAE1D0	28 ��̫��_����.mp4	����	28 ��̫��_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	6bce72e7-2bf9-49d1-af03-6f14376ff90028 ��̫��_����.mp4	7963d30d-9964-4c7d-b780-bb7ec6438a9fABJH8SJBSHB5Y~~7SH`BN5E.png	35E5780253FC4AD7ADF83AE083A7264D
F062203CCAA2463D8E6F11252906C70A	14 ����ֻ�������_����.mp4	����	14 ����ֻ�������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	a5dd222c-7c12-4abb-8847-5645556fb3b714 ����ֻ�������_����.mp4	32c6918a-3657-43c1-aefb-078d0a0a15f563d0f703918fa0ec21d65113209759ee3d6ddb9e.jpg	35E5780253FC4AD7ADF83AE083A7264D
F39DED7904234229B6B541D5D0410697	31 ���͹�_����.mp4	��������	31 ���͹�_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	93f4bf85-067f-455c-8d3a-17a0b6be1c7545 ���͹�_����.mp4	2c231105-08f8-4d04-b296-c21de31e1816K5JOC1ZID134BQSSG.png	35E5780253FC4AD7ADF83AE083A7264D
F4CAEC3185D1404790B7C61419200534	43 �Ͷ������_����.mp4	ͯ��	43 �Ͷ������_����.mp4	2016-07-06	0	0	0	0	0	0	0	0	0	7c36bf58-b0b0-4b34-bce7-852ab91b334843 �Ͷ������_����.mp4	e3895121-c1f9-4a65-a2a9-06cfbf10cf54IQ$SXHZ$R{F03JMA]10[LMB.png	35E5780253FC4AD7ADF83AE083A7264D
	
select * from video where videoimg like '%90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png%'

delete video where video_ID = '60E335F461BE4D24A5106603D1954AFA'


insert into video values('29B276607CE944BD8E44AA26784EA732','48 ţ�̸�_����.mp4','��������','48 ţ�̸�_����.mp4','1996-01-02',default,default,default,default,default,default,default,default,default,'9c3fe988-631f-4aa9-8bcb-9b7691f288d848 ţ�̸�_����.mp4','8e04f1fc-c0ff-4ced-bfa5-0f3032c7f56dC3ZLMKLVRRP2EHX27ESLF.png','35E5780253FC4AD7ADF83AE083A7264D')


select * from video where video_ID='0251446BCFE34B47B1C70943BA982B81'
update video set play = '0' where video_ID= '0251446BCFE34B47B1C70943BA982B81'

--����ʱ����н���,�����µ�ʱ�����ǰ��
select count(*) count from (select Release,ROW_NUMBER() OVER(order by Release desc) as rowNumber from video) video
select * from (select *, ROW_NUMBER() OVER(Order by a.Release desc) AS RowNumber from video as a ) as b where b.RowNumber BETWEEN '1' and '5'
select * from (select * , row_number() over( Order by a.video_ID asc ) AS RowNumber from video as a ) as b where RowNumber = '2'

*/

update video set videoimg ='ee97456a-4437-493a-a4d1-e6e9a1b5cbf98V04LYB3FU64NG_09E.png' where video_ID = '08B78CF3B7CF445EAB156793C9C9CC7D'
--����
create table category(
	cid char(32) primary key ,
	cname varchar(100) not null --���������
)

insert into category values()

select * from category

--��Ʒ��
create table product(
	pid char(32) primary key not null ,--��Ʒid
	pname varchar(50) not null,			--��Ʒ����
	price decimal(10,0) not null,				--��Ʒ�۸�
	pcount int not null ,				--��Ʒ����
	pimg varchar(100) not null,			--��ƷͼƬ
	pdescription text not null,			--��Ʒ����
	cid char(32) foreign key references category(cid)--��Ʒ����
)
alter table product drop column pclassify; 
alter table product
alter column price  decimal(10,0)
delete product where pid = '76F2C29DDD7645D28D4B0A57DE5AD5F6'
select * from product
alter table product rename column cid to thisname

select pid,pname,price,pcount,pimg,pdescription,a.cid,cname from product a,category b where a.cid=b.cid
--������
create table orders(
	oid char(32) primary key ,--�������
	ordertime datetime default getDate(),--��������ʱ��
	total decimal(10,0) ,--�����ϼ�
	[status] int default 0 ,/*����״̬��δ����Ѹ��δ�������ѷ�����δȷ���ջ����ջ��ѽ���*/
	[user_ID] char(32) ,--����������
	address varchar(200) ,--�������ջ���ַ
	foreign key ([user_ID]) references users([user_ID])--��������������һ���û���
)

select * from orders
--������
create table orderitem(
	oitemid char(32) primary key ,--������id
	ocount int ,--����
	subtotal decimal(10,0),--С��
	oid char(32) foreign key references orders(oid),--��������
	pid char(32) foreign key references product(pid) --��������ָ����Ʒ
)
select * from orderitem

select * from video where videoimg='90876034-f7d1-437a-b8be-e218db9c41171I`8[E4Z~C8J$5R)%H1`S53.png'
select count(*) from video where title like '%С%'