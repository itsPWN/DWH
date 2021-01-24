
CREATE TABLE STG_FORMULAT
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NO        numeric(7)  NOT NULL,
	STRENGTH              varchar(10)  ,
	UNIT                  varchar(5)  ,
	INGREDIANT_NAME       varchar(100)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_FORMULAT__00551192  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_FIRMS
(
	STG_SQN               numeric(10)  NOT NULL,
	LBLCODE               varchar(6)  NOT NULL,
	FIRM_NAME             varchar(65)  ,
	ADDR_HEADER           varchar(40)  ,
	STREET                varchar(40)  ,
	PO_BOX                varchar(9)  ,
	FOREIGN_ADDR          varchar(40)  ,
	CITY                  varchar(30)  ,
	STATE                 varchar(2)  ,
	ZIP                   varchar(9)  ,
	PROVINCE_NAME         varchar(30)  ,
	COUNTRY               varchar(40)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_FIRMS__7E6CC920  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_APPLICATION
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NO        numeric(7)  NOT NULL,
	APPL_NUM              varchar(6)  ,
	PROD_NO               varchar(3)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_APPLICATION__7C8480AE  PRIMARY KEY (STG_SQN)
)
;



CREATE INDEX STG_APP_UX_1 ON STG_APPLICATION
(
	LISTING_SEQ_NO        ASC,
	APPL_NUM              ASC,
	PROD_NO               ASC
)
;



CREATE TABLE CNTRL_DATE
(
	CNTRL_SQN             INTEGER  NOT NULL,
	LOAD_DTS              TIMESTAMP  NOT NULL DEFAULT getdate(),
	CONSTRAINT  PK__CNTRL_DATE__1ED998B2  PRIMARY KEY (CNTRL_SQN)
)
;



CREATE TABLE STG_PRODUCTS
(
	STG_SQN               INTEGER  NOT NULL,
	INGREDIENT            varchar(66)  ,
	DOSE_FORM_ROUTE       varchar(45)  ,
	TRADENAME             varchar(85)  ,
	APPLICANT_FIRM_NAME   varchar(65)  ,
	STRENGTH              varchar(155)  ,
	NDA_APPL_NUM          varchar(8)  ,
	NDA_PROD_NUM          varchar(3)  ,
	THERAP_EQUIV_CODE     varchar(2)  ,
	APPROVAL_DATE         varchar(35)  ,
	REF_LISTED_DRUG_CODE  varchar(5)  ,
	RX_OTC_TYPE_CODE      varchar(5)  ,
	APPL_FULL_FIRM_NAME   varchar(150)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_PRODUCTS__1920BF5C  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_PATENT
(
	STG_SQN               INTEGER  NOT NULL,
	NDA_APPL_NUM          varchar(8)  ,
	NDA_PROD_NUM          varchar(3)  ,
	NDA_PATENT_NUM        varchar(25)  ,
	NDA_PATENT_EXP_DATE   varchar(29)  ,
	DRUG_SUBSTANCE_FLG    varchar(1)  ,
	DRUG_PROD_FLG         varchar(1)  ,
	PATENT_USE_CODE       varchar(15)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_PATENT__173876EA  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_EXCLUSIVITY
(
	STG_SQN               INTEGER  NOT NULL,
	NDA_APPL_NUM          varchar(8)  ,
	NDA_PROD_NUM          varchar(3)  ,
	EXCLUSIVITY_CODE      varchar(10)  ,
	EXCLUSIVITY_EXP_DATE  varchar(29)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_EXCLUSIVITY__15502E78  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_REG_SITES
(
	STG_SQN               numeric(10)  NOT NULL,
	FEI_NUMBER            varchar(10)  NOT NULL,
	CURRENT_REGISTRATION_YEAR  varchar(18)  ,
	FIRM_NAME             varchar(65)  ,
	STREET                varchar(40)  ,
	CITY                  varchar(40)  ,
	STATE_ID              varchar(2)  ,
	ZIP                   varchar(13)  ,
	ISO_COUNTRY_CODE      varchar(2)  ,
	COUNTRY_NAME          varchar(13)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(10)  NOT NULL,
	CONSTRAINT  PK__STG_REG_SITES__1367E606  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_DOSE_FORM
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NO        numeric(9)  NOT NULL,
	DOSEFORM              varchar(3)  ,
	DOSAGE_NAME           varchar(240)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_DOSE_FORM__0F975522  PRIMARY KEY (STG_SQN)
)
;



CREATE INDEX STG_DOSE_FORM_UX_1 ON STG_DOSE_FORM
(
	LISTING_SEQ_NO        ASC,
	DOSEFORM              ASC,
	DOSAGE_NAME           ASC
)
;



CREATE TABLE STG_TBL_UNIT
(
	STG_SQN               numeric(10)  NOT NULL,
	UNIT                  varchar(15)  NOT NULL,
	TRANSLATION           varchar(240)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_TBL_UNIT__0DAF0CB0  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_TBL_ROUTE
(
	STG_SQN               numeric(10)  NOT NULL,
	ROUTE_CHAR            varchar(3)  NOT NULL,
	TRANSLATION           varchar(240)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_TBL_ROUTE__0BC6C43E  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_SCHEDULE
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NUM       numeric(7)  NOT NULL,
	SCHEDULE              numeric(1)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_SCHEDULE__09DE7BCC  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_TBL_DOSAGE
(
	STG_SQN               numeric(10)  NOT NULL,
	DOSE_FORM             varchar(3)  NOT NULL,
	TRANSLATION           varchar(240)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_TBL_DOSAGE__07F6335A  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_ROUTES
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NUM       numeric(7)  NOT NULL,
	ROUTE_CODE            varchar(3)  ,
	ROUTE_NAME            varchar(240)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_ROUTES__060DEAE8  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_PACKAGES
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NO        numeric(7)  NOT NULL,
	PKGCODE               varchar(2)  ,
	PKG_SIZE              varchar(25)  ,
	PKG_TYPE              varchar(25)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_PACKAGES__0425A276  PRIMARY KEY (STG_SQN)
)
;



CREATE TABLE STG_LISTINGS
(
	STG_SQN               numeric(10)  NOT NULL,
	LISTING_SEQ_NO        numeric(7)  NOT NULL,
	LBLCODE               varchar(6)  ,
	PRODUCT_CD            varchar(4)  ,
	STRENGTH              varchar(10)  ,
	UNIT                  varchar(10)  ,
	RX_OTC                varchar(1)  ,
	TRADENAME             varchar(100)  ,
	LOAD_DTS              TIMESTAMP  NOT NULL,
	REC_SRC               varchar(15)  NOT NULL,
	CONSTRAINT  PK__STG_LISTINGS__023D5A04  PRIMARY KEY (STG_SQN)
)
;


