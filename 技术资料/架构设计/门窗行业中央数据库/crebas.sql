/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/8/1 16:13:40                            */
/*==============================================================*/


drop table if exists R_FACTORY_REGISTER;

drop table if exists R_FACTORY_SCHAIN;

drop table if exists R_FUNCTION_ROLE;

drop table if exists R_ROLE_USER;

drop table if exists T_ADMIN;

drop table if exists T_ADMIN_ROLE;

drop table if exists T_CONTRACT;

drop table if exists T_CONTRACT_REGISTER;

drop table if exists T_FACTORY;

drop table if exists T_FUNCTION;

drop table if exists T_SUBSYSTEM;

drop table if exists T_SUPPLYCHAIN_DESCRIPTION;

/*==============================================================*/
/* Table: R_FACTORY_REGISTER                                    */
/*==============================================================*/
create table R_FACTORY_REGISTER
(
   F_FACTORY_ID         varchar(32) not null,
   F_REGISTER_ID        varchar(32) not null,
   primary key (F_FACTORY_ID, F_REGISTER_ID)
);

/*==============================================================*/
/* Table: R_FACTORY_SCHAIN                                      */
/*==============================================================*/
create table R_FACTORY_SCHAIN
(
   F_FACTORY_ID         varchar(32) not null,
   F_SCHAIN_NODE        varchar(32) not null,
   primary key (F_FACTORY_ID, F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: R_FUNCTION_ROLE                                       */
/*==============================================================*/
create table R_FUNCTION_ROLE
(
   F_ROLE_ID            varchar(32) not null,
   F_FUNC_ID            varchar(32) not null,
   primary key (F_ROLE_ID, F_FUNC_ID)
);

/*==============================================================*/
/* Table: R_ROLE_USER                                           */
/*==============================================================*/
create table R_ROLE_USER
(
   F_USER_ID            varchar(32) not null,
   F_ROLE_ID            varchar(32) not null,
   primary key (F_USER_ID, F_ROLE_ID)
);

/*==============================================================*/
/* Table: T_ADMIN                                               */
/*==============================================================*/
create table T_ADMIN
(
   F_USER_ID            varchar(32) not null,
   primary key (F_USER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
create table T_ADMIN_ROLE
(
   F_ROLE_ID            varchar(32) not null,
   primary key (F_ROLE_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT                                            */
/*==============================================================*/
create table T_CONTRACT
(
   F_CONTRACT_ID        varchar(32) not null,
   F_RELATIVE_CONTRACT_ID varchar(32),
   F_REGISTER_ID        varchar(32),
   F_CONTRACT_NO        varchar(32),
   primary key (F_CONTRACT_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT_REGISTER                                   */
/*==============================================================*/
create table T_CONTRACT_REGISTER
(
   F_REGISTER_ID        varchar(32) not null,
   F_REGISTER_NO        varchar(32),
   primary key (F_REGISTER_ID)
);

/*==============================================================*/
/* Table: T_FACTORY                                             */
/*==============================================================*/
create table T_FACTORY
(
   F_FACTORY_ID         varchar(32) not null,
   F_FACTORY_NAME       varchar(512),
   primary key (F_FACTORY_ID)
);

/*==============================================================*/
/* Table: T_FUNCTION                                            */
/*==============================================================*/
create table T_FUNCTION
(
   F_FUNC_ID            varchar(32) not null,
   F_SUBSYSTEM_ID       varchar(32),
   F_FUNC_URL           varchar(512),
   F_DISPLAY_ORDER      int,
   primary key (F_FUNC_ID)
);

/*==============================================================*/
/* Table: T_SUBSYSTEM                                           */
/*==============================================================*/
create table T_SUBSYSTEM
(
   F_SUBSYSTEM_ID       varchar(32) not null,
   F_SUBSYSTEM_NAME     varchar(128),
   F_SUBSYSTEM_STATUS   tinyint,
   F_FUNC_URL           varchar(512),
   primary key (F_SUBSYSTEM_ID)
);

/*==============================================================*/
/* Table: T_SUPPLYCHAIN_DESCRIPTION                             */
/*==============================================================*/
create table T_SUPPLYCHAIN_DESCRIPTION
(
   F_SCHAIN_NODE        varchar(32) not null,
   F_NEXT_SCHAIN_NODE   varchar(32),
   F_SCHAIN_NAME        varchar(128),
   primary key (F_SCHAIN_NODE)
);

alter table R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER foreign key (F_FACTORY_ID)
      references T_FACTORY (F_FACTORY_ID) on delete restrict on update restrict;

alter table R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER2 foreign key (F_REGISTER_ID)
      references T_CONTRACT_REGISTER (F_REGISTER_ID) on delete restrict on update restrict;

alter table R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN foreign key (F_FACTORY_ID)
      references T_FACTORY (F_FACTORY_ID) on delete restrict on update restrict;

alter table R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN2 foreign key (F_SCHAIN_NODE)
      references T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE) on delete restrict on update restrict;

alter table R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE foreign key (F_ROLE_ID)
      references T_ADMIN_ROLE (F_ROLE_ID) on delete restrict on update restrict;

alter table R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE2 foreign key (F_FUNC_ID)
      references T_FUNCTION (F_FUNC_ID) on delete restrict on update restrict;

alter table R_ROLE_USER add constraint FK_R_ROLE_USER foreign key (F_USER_ID)
      references T_ADMIN (F_USER_ID) on delete restrict on update restrict;

alter table R_ROLE_USER add constraint FK_R_ROLE_USER2 foreign key (F_ROLE_ID)
      references T_ADMIN_ROLE (F_ROLE_ID) on delete restrict on update restrict;

alter table T_CONTRACT add constraint FK_R_CONTRACT_CONTRACT foreign key (F_RELATIVE_CONTRACT_ID)
      references T_CONTRACT (F_CONTRACT_ID) on delete restrict on update restrict;

alter table T_CONTRACT add constraint FK_R_REGISTER_CONTRACT foreign key (F_REGISTER_ID)
      references T_CONTRACT_REGISTER (F_REGISTER_ID) on delete restrict on update restrict;

alter table T_FUNCTION add constraint FK_R_SUBSYSTEM_FUNCTION foreign key (F_SUBSYSTEM_ID)
      references T_SUBSYSTEM (F_SUBSYSTEM_ID) on delete restrict on update restrict;

alter table T_SUPPLYCHAIN_DESCRIPTION add constraint FK_R_SCHAIN_SCHAIN foreign key (F_NEXT_SCHAIN_NODE)
      references T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE) on delete restrict on update restrict;

