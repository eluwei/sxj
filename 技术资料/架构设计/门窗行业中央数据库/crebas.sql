/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/10/9 16:54:38                           */
/*==============================================================*/


drop table if exists "sxj-supervisor".IDENTITIES;

drop table if exists "sxj-supervisor".M_CONTRACT;

drop table if exists "sxj-supervisor".M_CONTRACT_BATCH;

drop table if exists "sxj-supervisor".M_CONTRACT_ITEM;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY_BATCH;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY_ITEM;

drop table if exists "sxj-supervisor".M_CONTRACT_RECORD;

drop table if exists "sxj-supervisor".M_CONTRACT_REPLENISH;

drop table if exists "sxj-supervisor".M_CONTRACT_REPLENISH_BATCH;

drop table if exists "sxj-supervisor".M_MEMBER;

drop table if exists "sxj-supervisor".M_MEMBER_ACCOUNT;

drop table if exists "sxj-supervisor".M_MEMBER_FUNCTION;

drop table if exists "sxj-supervisor".M_MEMBER_ROLE;

drop table if exists "sxj-supervisor".M_ROLE_ACCOUNT;

drop table if exists "sxj-supervisor".M_SYS_ACCOUNT;

drop table if exists "sxj-supervisor".M_SYS_AREA;

drop table if exists "sxj-supervisor".M_SYS_FUNCTION;

drop table if exists "sxj-supervisor".M_SYS_LOG;

drop table if exists "sxj-supervisor".M_SYS_ROLE;

drop table if exists "sxj-supervisor".R_FACTORY_REGISTER;

drop table if exists "sxj-supervisor".R_FACTORY_SCHAIN;

drop table if exists "sxj-supervisor".R_FUNCTION_ROLE;

drop table if exists "sxj-supervisor".R_LOGISTICE_REF;

drop table if exists "sxj-supervisor".R_LOGISTICS_RFID;

drop table if exists "sxj-supervisor".R_RFID_APPLICATION;

drop table if exists "sxj-supervisor".R_RFID_PRICE;

drop table if exists "sxj-supervisor".R_RFID_PURCHASE;

drop table if exists "sxj-supervisor".R_RFID_SALE;

drop table if exists "sxj-supervisor".R_RFID_SUPPLIER;

drop table if exists "sxj-supervisor".R_ROLE_USER;

drop table if exists "sxj-supervisor".R_WINDOW_REF;

drop table if exists "sxj-supervisor".R_WINDOW_RFID;

drop table if exists "sxj-supervisor".SHARD;

drop table if exists "sxj-supervisor".SHARD2;

drop table if exists "sxj-supervisor".TEST_FUNCTION;

drop table if exists "sxj-supervisor".TEST_RFID_NUMBER;

drop table if exists "sxj-supervisor".T_ADMIN;

drop table if exists "sxj-supervisor".T_ADMIN_ROLE;

drop table if exists "sxj-supervisor".T_CONTRACT;

drop table if exists "sxj-supervisor".T_CONTRACT_REGISTER;

drop table if exists "sxj-supervisor".T_FACTORY;

drop table if exists "sxj-supervisor".T_FUNCTION;

drop table if exists "sxj-supervisor".T_SN;

drop table if exists "sxj-supervisor".T_SUBSYSTEM;

drop table if exists "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION;

drop table if exists "sxj-supervisor".T_SYSTEM_PARAM;

/*==============================================================*/
/* User: "sxj-supervisor"                                       */
/*==============================================================*/
create user "sxj-supervisor";

/*==============================================================*/
/* Table: IDENTITIES                                            */
/*==============================================================*/
create table "sxj-supervisor".IDENTITIES
(
   IDENTITIES_ID        bigint(20),
   IDENTITIES_DELIMITER national varchar(45) not null,
   primary key (IDENTITIES_DELIMITER)
);

/*==============================================================*/
/* Table: M_CONTRACT                                            */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT
(
   ID                   national varchar(32) not null comment '主键ID',
   CONTRACT_NO          national varchar(50) comment '合同号',
   ADDRESS              national varchar(255) comment '签订地址',
   MEMBER_ID_A          national varchar(32) comment '甲方',
   MEMBER_ID_B          national varchar(32) comment '乙方',
   ENG_NAME             national varchar(50) comment '工程名称',
   ENG_ADDRESS          national varchar(255) comment '工程地址',
   RECORD_NO            national varchar(50) comment '合同备案号',
   SIGNED_DATE          datetime comment '签订日期',
   VALIDITY_DATE        datetime comment '合同期限',
   START_DATE           datetime comment '生效日期',
   CREATE_DATE          datetime comment '生成时间',
   RECORD_DATE          datetime comment '备案时间',
   DEPOSIT              bigint(20) comment '合同定金',
   REMARKS              national varchar(255) comment '备注',
   DELIVERY_ADDRESS     national varchar(255) comment '交货地址',
   STATE                int(10) comment '状态',
   TYPE                 int(10) comment '合同类型',
   REF_CONTRACT_NO      national varchar(50) comment '关联合同号',
   MEMBER_NAME_A        national varchar(50) comment '甲方名称',
   MEMBER_NAME_B        national varchar(50) comment '乙方名称',
   STATE_LOG            national varchar(255) comment '合同状态变更记录(JOSN)',
   BATCH_COUNT          national varchar(255) comment '总批次',
   NOW_RECORD_NO        int(11) comment '当前更新备案号',
   IMG_PATH             national longtext comment '扫描件路径',
   CONFIRM_STATE        int(11) comment '确认状态状态',
   DELETE_STATE         int(255) comment '删除状态'
);

/*==============================================================*/
/* Table: M_CONTRACT_BATCH                                      */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_BATCH
(
   ID                   national varchar(32) not null comment '主键',
   CONTRACT_ID          national varchar(32) comment '合同编号',
   RFID_NO              national varchar(50) comment 'RFID号',
   AMOUNT               bigint(255) comment '金额',
   BATCH_ITEMS          national varchar(255) comment '批次条目JSON',
   BATCH_NO             int(11) comment '批次号',
   UPDATE_STATE         int(11) comment '标识状态'
);

/*==============================================================*/
/* Table: M_CONTRACT_ITEM                                       */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_ITEM
(
   ID                   national varchar(32) not null comment '主键',
   CONTRACT_ID          national varchar(32) comment '合同ID',
   PRODUCT_NAME         national varchar(100) comment '产品名称',
   PRODUCT_MODEL        national varchar(50) comment '规格型号',
   QUANTITY             float(255,0) comment '数量',
   PRICE                bigint(255) comment '单价',
   AMOUNT               bigint(255) comment '金额',
   REMARKS              national varchar(255) comment '备注',
   UPDATE_STATE         int(11) comment '变更状态',
   WINDOW_TYPE          int(11) comment '门窗类型'
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY                                     */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY
(
   ID                   national varchar(32) not null comment '主键',
   CONTRACT_ID          national varchar(32) comment '合同ID',
   RECORD_NO            national varchar(32) comment '备案号',
   IMG_PATH             national varchar(255) comment '扫描件',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_BATCH                               */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY_BATCH
(
   ID                   national varchar(32) not null comment '主键',
   MODIFY_ID            national varchar(32) comment '变更ID',
   RFID_NO              national varchar(50) comment 'RFID号',
   AMOUNT               bigint(255) comment '金额',
   BATCH_ITEMS          national varchar(255) comment '批次条目JSON',
   RECORD_NO            national varchar(50),
   BATCH_NO             int(11) comment '批次号',
   UPDATE_STATE         int(11) comment '标识状态'
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_ITEM                                */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY_ITEM
(
   ID                   national varchar(32) not null comment '主键',
   MODIFY_ID            national varchar(32) comment '变更记录ID',
   PRODUCT_NAME         national varchar(100) comment '产品名称',
   PRODUCT_MODEL        national varchar(50) comment '规格型号',
   QUANTITY             float(255,0) comment '数量',
   PRICE                bigint(255) comment '单价',
   AMOUNT               bigint(255) comment '金额',
   REMARKS              national varchar(255) comment '备注',
   UPDATE_STATE         int(11) comment '标识状态',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_RECORD                                     */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_RECORD
(
   ID                   national varchar(32) not null comment '主键ID',
   RECORD_NO            national varchar(32) comment '备案号',
   APPLY_ID             national varchar(32) comment '申请会员ID',
   APPLY_NAME           national varchar(255) comment '申请会员名称',
   MEMBER_ID_A          national varchar(32) comment '甲方会员ID',
   MEMBER_NAME_A        national varchar(255) comment '甲方会员名称',
   MEMBER_ID_B          national varchar(32) comment '乙方会员ID',
   MEMBER_NAME_B        national varchar(255) comment '乙方会员名称',
   TYPE                 int(10) comment '备案类型',
   IMG_PATH             national longtext comment '备案扫描件',
   STATE                int(10) comment '备案状态',
   CONTRACT_TYPE        int(10) comment '合同类型',
   CONTRACT_NO          national varchar(32) comment '绑定合同号',
   REF_CONTRACT_NO      national varchar(32) comment '关联招标合同',
   APPLY_DATE           datetime comment '申请时间',
   ACCEPT_DATE          datetime comment '受理时间',
   RECORD_FLAG          int(255) comment '标记',
   DEL_STATE            tinyint(1) default 0 comment '删除标记',
   CONFIRM_STATE        int(255) comment '前台使用确认状态',
   RFID_NO              national varchar(255) comment '补损RFID',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH                                  */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_REPLENISH
(
   ID                   national varchar(32) not null comment '主键',
   CONTRACT_ID          national varchar(32) comment '合同ID',
   RECORD_NO            national varchar(50) comment '备案号',
   BATCH_RFID_NO        national varchar(50) comment '补损批次RFID',
   RFID_ORDER_NO        national varchar(50) comment 'RFID订单号',
   IMG_PATH             national varchar(255) comment '扫描件路径',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH_BATCH                            */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_REPLENISH_BATCH
(
   ID                   national varchar(32) not null comment '主键',
   BATCH_NO             national varchar(32) comment '批次号',
   REPLENISH_ID         national varchar(32) comment '变更ID',
   RFID_NO              national varchar(32) comment 'RFID号',
   AMOUNT               bigint(20) comment '金额',
   BATCH_ITEMS          national varchar(255) comment '批次条目JSON',
   NEW_RFID_NO          national varchar(32) comment '新RFID号',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER                                              */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER
(
   ID                   national varchar(32) not null comment '标识,主键',
   MEMBER_NO            national varchar(32) not null comment '会员号',
   NAME                 national varchar(255) comment '会员名称',
   B_LICENSE_NO         national varchar(15) comment '营业执照号',
   TYPE                 int(11) comment '会员类型',
   AREA                 national varchar(100) comment '地理区域',
   CONTACTS             national varchar(255) comment '联系人名称',
   ENERGY_NO            national varchar(15) comment '节能标识号',
   PHONE_NO             national varchar(15) comment '联系人手机',
   ADDRESS              national varchar(255) comment '公司地址',
   TEL_NUM              national varchar(15) comment '联系电话',
   REG_DATE             datetime comment '注册日期',
   AUTHOR_DATE          datetime comment '认证日期',
   STATE                int(11) comment '账户状态',
   CHECK_STATE          int(11) comment '审核状态',
   TOTAL_AMOUNT         bigint(20) comment '总交易额',
   ACCOUNT_NUM          int(11) comment '子账户数目',
   PASSWORD             national varchar(255) comment '会员密码',
   B_LICENSE_PATH       national varchar(255) comment '营业执照图片path',
   ENERGY_PATH          national varchar(255) comment '节能标识图片path',
   CODE                 national varchar(32) comment '邮政编码',
   FLAG                 tinyint(1) default 0 comment '是否完善会员资料标记',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ACCOUNT                                      */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_ACCOUNT
(
   ID                   national varchar(32) not null comment '主键标识',
   ACCOUNT_NO           national varchar(50) not null comment '子账户ID',
   PASSWORD             national varchar(255) comment '子账户密码',
   PARENT_ID            national varchar(32) not null comment '所属会员ID',
   ACCOUNT_NAME         national varchar(50) not null comment '子账户名称',
   NAME                 national varchar(50) not null comment '姓名',
   STATE                int(10) not null comment '子账户状态',
   REG_DATE             datetime not null comment '注册日期',
   DEL_STATE            tinyint(1) not null default 0 comment '逻辑删除标记',
   primary key (ID),
   key UN_ACCOUNT_NAME (ACCOUNT_NAME)
);

/*==============================================================*/
/* Table: M_MEMBER_FUNCTION                                     */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_FUNCTION
(
   ID                   national varchar(32) not null comment '主键标识',
   TITLE                national varchar(50) not null comment '功能名称',
   URL                  national varchar(512) comment '功能请求URL',
   PARENT_ID            national varchar(32) comment '父系统功能ID',
   LEVEL                int(10) comment '级别',
   "DESC"               int(11),
   STYLE                national varchar(50) comment '样式',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ROLE                                         */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_ROLE
(
   ID                   national varchar(32) not null comment '主键标识',
   FUNCTION_ID          national varchar(32) not null comment '系统功能ID',
   ACCOUNT_ID           national varchar(32) not null comment '账户ID',
   MEMBER_ID            national varchar(32) comment '会员ID',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_ROLE_ACCOUNT                                        */
/*==============================================================*/
create table "sxj-supervisor".M_ROLE_ACCOUNT
(
   ID                   national varchar(32) not null,
   FUNCTION_ID          national varchar(32) not null,
   ACCOUNT_ID           national varchar(32) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ACCOUNT                                         */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_ACCOUNT
(
   ID                   national varchar(32) not null comment '主键',
   NAME                 national varchar(50) not null comment '管理员姓名',
   ACCOUNT              national varchar(50) not null comment '管理员账号',
   PASSWORD             national varchar(50) comment '密码',
   ACCOUNT_NO           national varchar(32),
   DEL_STATE            tinyint(1) comment '删除标记',
   LAST_LOGIN           datetime comment '登录时间',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_AREA                                            */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_AREA
(
   ID                   national varchar(32) not null comment '主键标识',
   NAME                 national varchar(50) comment '地域名称',
   PARENT_ID            national varchar(32) comment '父ID',
   LEVEL                int(1) comment '级别',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_FUNCTION                                        */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_FUNCTION
(
   ID                   national varchar(32) not null comment '主键标识',
   TITLE                national varchar(50) not null comment '功能名称',
   URL                  national varchar(512) comment '功能请求URL',
   PARENT_ID            national varchar(32) comment '父系统功能ID',
   LEVEL                int(10) comment '级别',
   "DESC"               int(11),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_LOG                                             */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_LOG
(
   ID                   national varchar(32) not null comment '主键',
   ACCOUNT_NO           national varchar(32) comment '管理員賬號',
   OPER_TIME            datetime comment '操作時間',
   LOGS                 national varchar(500) comment '操作內容',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ROLE                                            */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_ROLE
(
   ID                   national varchar(32) not null comment '主键标识',
   FUNCTION_ID          national varchar(32) not null comment '系统功能ID',
   ACCOUNT_ID           national varchar(32) not null comment '账户ID',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_FACTORY_REGISTER                                    */
/*==============================================================*/
create table "sxj-supervisor".R_FACTORY_REGISTER
(
   F_FACTORY_ID         national varchar(32) not null,
   F_REGISTER_ID        national varchar(32) not null,
   primary key (F_FACTORY_ID, F_REGISTER_ID)
);

/*==============================================================*/
/* Table: R_FACTORY_SCHAIN                                      */
/*==============================================================*/
create table "sxj-supervisor".R_FACTORY_SCHAIN
(
   F_FACTORY_ID         national varchar(32) not null,
   F_SCHAIN_NODE        national varchar(32) not null,
   primary key (F_FACTORY_ID, F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: R_FUNCTION_ROLE                                       */
/*==============================================================*/
create table "sxj-supervisor".R_FUNCTION_ROLE
(
   F_ROLE_ID            national varchar(32) not null,
   F_FUNC_ID            national varchar(32) not null,
   primary key (F_ROLE_ID, F_FUNC_ID)
);

/*==============================================================*/
/* Table: R_LOGISTICE_REF                                       */
/*==============================================================*/
create table "sxj-supervisor".R_LOGISTICE_REF
(
   ID                   national varchar(32) not null comment '主键',
   RFID_REF_NO          national varchar(15) not null comment 'RFID关联申请号',
   RFID_NO              national varchar(15) comment 'RFID编号',
   MEMBER_NO            national varchar(15) comment '申请人',
   MEMBER_NAME          national varchar(100) comment '申请人名称',
   RFID_TYPE            int(1) comment 'RFID类型',
   STATE                int(1) comment '审核状态',
   TYPE                 int(1) comment '关联类型',
   BATCH_NO             national varchar(15) comment '批次',
   APPLY_DATE           datetime comment '关联申请时间',
   REPLENISH_RFID       national varchar(15) comment '被补损RFID',
   CONTRACT_NO          national varchar(15) comment '采购合同号',
   DEL_STATE            tinyint(1) default 0 comment '逻辑删除标记',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_LOGISTICS_RFID                                      */
/*==============================================================*/
create table "sxj-supervisor".R_LOGISTICS_RFID
(
   ID                   national varchar(32) not null comment '主键',
   RFID_NO              national varchar(15) not null comment 'RFID编号',
   PURCHASE_NO          national varchar(15) comment '采购单号',
   TYPE                 int(1) comment 'RFID类型',
   MEMBER_NO            national varchar(15) comment '申请会员号',
   MEMBER_NAME          national varchar(100) comment '申请会员名称',
   CONTRACT_NO          national varchar(15) comment '采购合同号',
   BATCH_NO             national varchar(15) comment '执行批次号',
   IMPORT_DATE          datetime comment '导入日期',
   REPLENISH_NO         national varchar(15) comment '关联补损单',
   RFID_STATE           int(1) comment 'RFID状态',
   PROGRESS_STATE       int(1) comment '进度状态',
   LOG                  national varchar(255) comment '执行日志',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_APPLICATION                                    */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_APPLICATION
(
   ID                   national varchar(32) not null comment '主键',
   APPLY_NO             national varchar(15) not null comment 'RFID申请单编号',
   MEMBER_NO            national varchar(15) comment '申请会员ID',
   MEMBER_NAME          national varchar(100) comment '申请会员名称',
   RFID_TYPE            int(1) comment 'RFID类型',
   CONTRACT_NO          national varchar(15) comment '招标合同号',
   COUNT                int(11) comment '申请数量',
   APPLY_DATE           datetime comment '申请日期',
   PAY_STATE            int(1) comment '支付状态',
   RECEIPT_STATE        int(1) comment '收货状态',
   DEL_STATE            tinyint(1) default 0 comment '逻辑删除标记',
   HAS_NUMBER           int(11) default 0 comment '已申请数量',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_PRICE                                          */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_PRICE
(
   ID                   national varchar(32) not null comment '主键',
   LOGISTICS_PRICE      int(11) comment '物流批次RFID价格',
   WINDOW_PRICE         int(11) comment '门窗RFID价格',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_PURCHASE                                       */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_PURCHASE
(
   ID                   national varchar(32) not null comment '主键',
   PURCHASE_NO          national varchar(15) not null comment '采购单编号',
   SUPPLIER_NO          national varchar(15) comment '供应商编号',
   SUPPLIER_NAME        national varchar(100) comment '供应商名称',
   RFID_TYPE            int(1) comment 'RFID类型',
   COUNT                int(11) comment '数量',
   PRICE                int(11) comment '单价',
   AMOUNT               int(11) comment '金额',
   PURCHASE_DATE        datetime comment '采购日期',
   CONTRACT_NO          national varchar(15) comment '招标合同号',
   APPLY_NO             national varchar(15) comment '申请单编号',
   IMPORT_STATE         int(1) comment '导入状态',
   PAY_STATE            int(1) comment '支付状态',
   RECEIPT_STATE        int(1) comment '发货状态',
   DEL_STATE            int(11) comment '删除状态',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SALE                                           */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_SALE
(
   ID                   national varchar(32) not null comment '主键',
   APPLY_NO             national varchar(15) comment '申请单号',
   PURCHASE_NO          national varchar(15) comment '采购单号',
   COUNT                int(11) comment '销售数量',
   RFID_TYPE            int(1) comment 'RFID类型',
   PRICE                int(11) comment '销售价格',
   SALE_DATE            datetime comment '销售日期',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SUPPLIER                                       */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_SUPPLIER
(
   ID                   national varchar(32) not null comment '主键',
   SUPPLIER_NO          national varchar(15) comment '供应商NO',
   NAME                 national varchar(100) comment '供应商名称',
   ADDRESS              national varchar(255) comment '地址',
   CONTRACT_NAME        national varchar(255) comment '联系人姓名',
   CONTRACT_TEL         national varchar(15) comment '联系电话',
   TEL_NAME             national varchar(15) comment '固定电话',
   DOORS_PRICE          bigint(10) comment '门窗标签采购价',
   BATCH_PRICE          bigint(10) comment '批次标签采购价',
   DEL_STATE            tinyint(1) default 0 comment '逻辑删除',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_ROLE_USER                                           */
/*==============================================================*/
create table "sxj-supervisor".R_ROLE_USER
(
   F_USER_ID            national varchar(32) not null,
   F_ROLE_ID            national varchar(32) not null,
   primary key (F_USER_ID, F_ROLE_ID)
);

/*==============================================================*/
/* Table: R_WINDOW_REF                                          */
/*==============================================================*/
create table "sxj-supervisor".R_WINDOW_REF
(
   ID                   national varchar(32) not null comment '主键',
   RFID_REF_NO          national varchar(15) not null comment 'RFID关联申请号',
   RFID_RANGE           national varchar(100) comment 'RFID编号区间',
   MEMBER_NO            national varchar(15) comment '申请人',
   MEMBER_NAME          national varchar(100) comment '申请人名称',
   TYPE                 int(1) comment '关联类型',
   WINDOWS_NO           national varchar(15) comment '窗型代号',
   GLASS_BATCH_NO       national varchar(15) comment '玻璃批次',
   PROFILE_BATCH_NO     national varchar(15) comment '型材批次',
   APPLY_DATE           datetime comment '关联申请时间',
   REPLENISH_RFID       national varchar(15) comment '被补损RFID',
   CONTRACT_NO          national varchar(15) comment '合同号',
   DEL_STATE            int(11) comment '删除状态',
   STATE                int(11) comment '审核状态',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_WINDOW_RFID                                         */
/*==============================================================*/
create table "sxj-supervisor".R_WINDOW_RFID
(
   ID                   national varchar(32) not null comment '主键',
   RFID_NO              national varchar(15) comment 'RFID编号',
   PURCHASE_NO          national varchar(15) comment '采购单号',
   CONTRACT_NO          national varchar(15) comment '采购合同号',
   WINDOW_TYPE          int(1) comment '窗型代号',
   GLASS_RFID           national varchar(15) comment '玻璃RFID',
   PROFILE_RFID         national varchar(15) comment '型材RFID',
   IMPORT_DATE          datetime comment '导入日期',
   REPLENISH_NO         national varchar(15) comment '关联补损单',
   RFID_STATE           int(1) comment 'RFID状态',
   PROGRESS_STATE       int(1) comment '进度状态',
   LOG                  national varchar(255) comment '执行日志',
   primary key (ID)
);

/*==============================================================*/
/* Table: SHARD                                                 */
/*==============================================================*/
create table "sxj-supervisor".SHARD
(
   SHARD_ID             int(11) not null,
   SHARD_NAME           national varchar(45),
   primary key (SHARD_ID)
);

/*==============================================================*/
/* Table: SHARD2                                                */
/*==============================================================*/
create table "sxj-supervisor".SHARD2
(
   SHARD2_ID            national varchar(128) not null,
   SHARD2_NAME          national varchar(45),
   primary key (SHARD2_ID)
);

/*==============================================================*/
/* Table: TEST_FUNCTION                                         */
/*==============================================================*/
create table "sxj-supervisor".TEST_FUNCTION
(
   ID                   national varchar(32) not null,
   TITLE                national varchar(45) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: TEST_RFID_NUMBER                                      */
/*==============================================================*/
create table "sxj-supervisor".TEST_RFID_NUMBER
(
   NUMBER_ID            int(11) not null auto_increment,
   NUMBER_START         bigint(20),
   NUMBER_END           bigint(20),
   FOREIGN_KEY          national varchar(45),
   primary key (NUMBER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN                                               */
/*==============================================================*/
create table "sxj-supervisor".T_ADMIN
(
   F_USER_ID            national varchar(32) not null,
   primary key (F_USER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
create table "sxj-supervisor".T_ADMIN_ROLE
(
   F_ROLE_ID            national varchar(32) not null,
   primary key (F_ROLE_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT                                            */
/*==============================================================*/
create table "sxj-supervisor".T_CONTRACT
(
   F_CONTRACT_ID        national varchar(32) not null,
   F_RELATIVE_CONTRACT_ID national varchar(32),
   F_REGISTER_ID        national varchar(32),
   F_CONTRACT_NO        national varchar(32),
   primary key (F_CONTRACT_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT_REGISTER                                   */
/*==============================================================*/
create table "sxj-supervisor".T_CONTRACT_REGISTER
(
   F_REGISTER_ID        national varchar(32) not null,
   F_REGISTER_NO        national varchar(32),
   primary key (F_REGISTER_ID)
);

/*==============================================================*/
/* Table: T_FACTORY                                             */
/*==============================================================*/
create table "sxj-supervisor".T_FACTORY
(
   F_FACTORY_ID         national varchar(32) not null,
   F_FACTORY_NAME       national varchar(512),
   primary key (F_FACTORY_ID)
);

/*==============================================================*/
/* Table: T_FUNCTION                                            */
/*==============================================================*/
create table "sxj-supervisor".T_FUNCTION
(
   F_FUNC_ID            national varchar(32) not null,
   F_SUBSYSTEM_ID       national varchar(32),
   F_FUNC_URL           national varchar(512),
   F_DISPLAY_ORDER      int,
   primary key (F_FUNC_ID)
);

/*==============================================================*/
/* Table: T_SN                                                  */
/*==============================================================*/
create table "sxj-supervisor".T_SN
(
   F_SN_NUMBER          int(11),
   F_SN_NAME            national varchar(128)
);

/*==============================================================*/
/* Table: T_SUBSYSTEM                                           */
/*==============================================================*/
create table "sxj-supervisor".T_SUBSYSTEM
(
   F_SUBSYSTEM_ID       national varchar(32) not null,
   F_SUBSYSTEM_NAME     national varchar(128),
   F_SUBSYSTEM_STATUS   tinyint,
   F_FUNC_URL           national varchar(512),
   primary key (F_SUBSYSTEM_ID)
);

/*==============================================================*/
/* Table: T_SUPPLYCHAIN_DESCRIPTION                             */
/*==============================================================*/
create table "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION
(
   F_SCHAIN_NODE        national varchar(32) not null,
   F_NEXT_SCHAIN_NODE   national varchar(32),
   F_SCHAIN_NAME        national varchar(128),
   primary key (F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: T_SYSTEM_PARAM                                        */
/*==============================================================*/
create table "sxj-supervisor".T_SYSTEM_PARAM
(
   F_PARAM_ID           national varchar(32) not null,
   F_SUBSYSTEM_ID       national varchar(32),
   F_PARAM_NAME         national varchar(256),
   F_PARAM_VALUE        national varchar(1024),
   F_PARAM_TYPE         tinyint comment '??JDBC  Types.java',
   primary key (F_PARAM_ID)
);

alter table "sxj-supervisor".R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER foreign key (F_FACTORY_ID)
      references "sxj-supervisor".T_FACTORY (F_FACTORY_ID);

alter table "sxj-supervisor".R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER2 foreign key (F_REGISTER_ID)
      references "sxj-supervisor".T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table "sxj-supervisor".R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN foreign key (F_FACTORY_ID)
      references "sxj-supervisor".T_FACTORY (F_FACTORY_ID);

alter table "sxj-supervisor".R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN2 foreign key (F_SCHAIN_NODE)
      references "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table "sxj-supervisor".R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE foreign key (F_ROLE_ID)
      references "sxj-supervisor".T_ADMIN_ROLE (F_ROLE_ID);

alter table "sxj-supervisor".R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE2 foreign key (F_FUNC_ID)
      references "sxj-supervisor".T_FUNCTION (F_FUNC_ID);

alter table "sxj-supervisor".R_ROLE_USER add constraint FK_R_ROLE_USER foreign key (F_USER_ID)
      references "sxj-supervisor".T_ADMIN (F_USER_ID);

alter table "sxj-supervisor".R_ROLE_USER add constraint FK_R_ROLE_USER2 foreign key (F_ROLE_ID)
      references "sxj-supervisor".T_ADMIN_ROLE (F_ROLE_ID);

alter table "sxj-supervisor".T_CONTRACT add constraint FK_R_CONTRACT_CONTRACT foreign key (F_RELATIVE_CONTRACT_ID)
      references "sxj-supervisor".T_CONTRACT (F_CONTRACT_ID);

alter table "sxj-supervisor".T_CONTRACT add constraint FK_R_REGISTER_CONTRACT foreign key (F_REGISTER_ID)
      references "sxj-supervisor".T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table "sxj-supervisor".T_FUNCTION add constraint FK_R_SUBSYSTEM_FUNCTION foreign key (F_SUBSYSTEM_ID)
      references "sxj-supervisor".T_SUBSYSTEM (F_SUBSYSTEM_ID);

alter table "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION add constraint FK_R_SCHAIN_SCHAIN foreign key (F_NEXT_SCHAIN_NODE)
      references "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table "sxj-supervisor".T_SYSTEM_PARAM add constraint FK_R_PARAM_SUBSYSTEM foreign key (F_SUBSYSTEM_ID)
      references "sxj-supervisor".T_SUBSYSTEM (F_SUBSYSTEM_ID);

