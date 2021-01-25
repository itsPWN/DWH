
CREATE TABLE STG_FORMULAT
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NO       numeric(7)  NOT NULL ,
	STRENGTH             varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	UNIT                 varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	INGREDIANT_NAME      varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_FORMULAT__00551192 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_FIRMS
(
	STG_SQN              numeric(10)  NOT NULL ,
	LBLCODE              varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	FIRM_NAME            varchar(65) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	ADDR_HEADER          varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STREET               varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PO_BOX               varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	FOREIGN_ADDR         varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	CITY                 varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STATE                varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	ZIP                  varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PROVINCE_NAME        varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	COUNTRY              varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_FIRMS__7E6CC920 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_APPLICATION
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NO       numeric(7)  NOT NULL ,
	APPL_NUM             varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PROD_NO              varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_APPLICATION__7C8480AE PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE NONCLUSTERED INDEX STG_APP_UX_1 ON STG_APPLICATION
(
	LISTING_SEQ_NO        ASC,
	APPL_NUM              ASC,
	PROD_NO               ASC
)
go


CREATE TABLE CNTRL_DATE
(
	CNTRL_SQN            int  NOT NULL ,
	LOAD_DTS             datetime  NOT NULL 
	CONSTRAINT DF__CNTRL_DAT__LOAD___1DE57479
		 DEFAULT  getdate(),
	CONSTRAINT PK__CNTRL_DATE__1ED998B2 PRIMARY KEY  CLUSTERED (CNTRL_SQN ASC)
)
go


CREATE TABLE STG_PRODUCTS
(
	STG_SQN              int  NOT NULL ,
	INGREDIENT           varchar(66) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	DOSE_FORM_ROUTE      varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	TRADENAME            varchar(85) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	APPLICANT_FIRM_NAME  varchar(65) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STRENGTH             varchar(155) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_APPL_NUM         varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_PROD_NUM         varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	THERAP_EQUIV_CODE    varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	APPROVAL_DATE        varchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	REF_LISTED_DRUG_CODE varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	RX_OTC_TYPE_CODE     varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	APPL_FULL_FIRM_NAME  varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_PRODUCTS__1920BF5C PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_PATENT
(
	STG_SQN              int  NOT NULL ,
	NDA_APPL_NUM         varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_PROD_NUM         varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_PATENT_NUM       varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_PATENT_EXP_DATE  varchar(29) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	DRUG_SUBSTANCE_FLG   varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	DRUG_PROD_FLG        varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PATENT_USE_CODE      varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_PATENT__173876EA PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_EXCLUSIVITY
(
	STG_SQN              int  NOT NULL ,
	NDA_APPL_NUM         varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	NDA_PROD_NUM         varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	EXCLUSIVITY_CODE     varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	EXCLUSIVITY_EXP_DATE varchar(29) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_EXCLUSIVITY__15502E78 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_REG_SITES
(
	STG_SQN              numeric(10)  NOT NULL ,
	FEI_NUMBER           varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CURRENT_REGISTRATION_YEAR varchar(18) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	FIRM_NAME            varchar(65) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STREET               varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	CITY                 varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STATE_ID             varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	ZIP                  varchar(13) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	ISO_COUNTRY_CODE     varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	COUNTRY_NAME         varchar(13) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_REG_SITES__1367E606 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_DOSE_FORM
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NO       numeric(9)  NOT NULL ,
	DOSEFORM             varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	DOSAGE_NAME          varchar(240) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_DOSE_FORM__0F975522 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE NONCLUSTERED INDEX STG_DOSE_FORM_UX_1 ON STG_DOSE_FORM
(
	LISTING_SEQ_NO        ASC,
	DOSEFORM              ASC,
	DOSAGE_NAME           ASC
)
go


CREATE TABLE STG_TBL_UNIT
(
	STG_SQN              numeric(10)  NOT NULL ,
	UNIT                 varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	TRANSLATION          varchar(240) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_TBL_UNIT__0DAF0CB0 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_TBL_ROUTE
(
	STG_SQN              numeric(10)  NOT NULL ,
	ROUTE_CHAR           varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	TRANSLATION          varchar(240) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_TBL_ROUTE__0BC6C43E PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_SCHEDULE
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NUM      numeric(7)  NOT NULL ,
	SCHEDULE             numeric(1)  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_SCHEDULE__09DE7BCC PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_TBL_DOSAGE
(
	STG_SQN              numeric(10)  NOT NULL ,
	DOSE_FORM            varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	TRANSLATION          varchar(240) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_TBL_DOSAGE__07F6335A PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_ROUTES
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NUM      numeric(7)  NOT NULL ,
	ROUTE_CODE           varchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	ROUTE_NAME           varchar(240) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_ROUTES__060DEAE8 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_PACKAGES
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NO       numeric(7)  NOT NULL ,
	PKGCODE              varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PKG_SIZE             varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PKG_TYPE             varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_PACKAGES__0425A276 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go


CREATE TABLE STG_LISTINGS
(
	STG_SQN              numeric(10)  NOT NULL ,
	LISTING_SEQ_NO       numeric(7)  NOT NULL ,
	LBLCODE              varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	PRODUCT_CD           varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	STRENGTH             varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	UNIT                 varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	RX_OTC               varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	TRADENAME            varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	LOAD_DTS             datetime  NOT NULL ,
	REC_SRC              varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	CONSTRAINT PK__STG_LISTINGS__023D5A04 PRIMARY KEY  CLUSTERED (STG_SQN ASC)
)
go

