
CREATE TABLE HUB_NDA_APPLICATION
(
	APPL_SQN              NUMBER(10)  NOT NULL ,
	APPL_LDTS             DATE  NOT NULL ,
	APPL_RSRC             VARCHAR2(15)  NULL ,
	APPL_NUM              NUMBER(10)  NULL ,
CONSTRAINT  XPKHUB_NDA_APPLICATION PRIMARY KEY (APPL_SQN)
);



CREATE TABLE HUB_PROD_NUM
(
	PROD_NUM_SQN          NUMBER(10)  NOT NULL ,
	PROD_NUM_LDTS         DATE  NOT NULL ,
	PROD_NUM_RSRC         VARCHAR2(15)  NULL ,
	PROD_NUM              VARCHAR2(4)  NOT NULL ,
CONSTRAINT  XPKHUB_PROD_NUM PRIMARY KEY (PROD_NUM_SQN)
);



CREATE TABLE HUB_EXCLUSIVITY_CODE
(
	EXCL_CODE_SQN         NUMBER(10)  NOT NULL ,
	EXCL_CODE_LDTS        DATE  NOT NULL ,
	EXCL_CODE_RSRC        VARCHAR2(15)  NULL ,
	EXCL_CODE             VARCHAR2(10)  NOT NULL ,
CONSTRAINT  XPKHUB_EXCLUSIVITY_CODE PRIMARY KEY (EXCL_CODE_SQN)
);



CREATE TABLE LNK_APPL_PROD_EXCL
(
	LNK_APPL_PROD_SQN     NUMBER(10)  NOT NULL ,
	LNK_APPL_PROD_LDTS    DATE  NOT NULL ,
	LNK_APPL_PROD_RSRC    VARCHAR2(15)  NULL ,
	APPL_SQN              NUMBER(10)  NULL ,
	PROD_NUM_SQN          NUMBER(10)  NULL ,
	EXCL_CODE_SQN         NUMBER(10)  NULL ,
	EXCL_EXPIRATION_DATE  VARCHAR2(29)  NULL ,
CONSTRAINT  XPKLNK_APPL_PROD PRIMARY KEY (LNK_APPL_PROD_SQN),
CONSTRAINT  R_43 FOREIGN KEY (APPL_SQN) REFERENCES HUB_NDA_APPLICATION(APPL_SQN),
CONSTRAINT  R_44 FOREIGN KEY (PROD_NUM_SQN) REFERENCES HUB_PROD_NUM(PROD_NUM_SQN),
CONSTRAINT  R_46 FOREIGN KEY (EXCL_CODE_SQN) REFERENCES HUB_EXCLUSIVITY_CODE(EXCL_CODE_SQN)
);



CREATE TABLE HUB_LBL_CODE
(
	LBLCODE_SQN           NUMBER(10)  NOT NULL ,
	LBLCODE_LDTS          DATE  NOT NULL ,
	LBLCODE_RSRC          VARCHAR2(15)  NULL ,
	LBLCODE               VARCHAR2(6)  NOT NULL ,
CONSTRAINT  XPKHUB_LBL_CODE PRIMARY KEY (LBLCODE_SQN)
);



CREATE TABLE HUB_LISTINGS
(
	LIST_SQN              NUMBER(10)  NOT NULL ,
	LIST_LDTS             DATE  NOT NULL ,
	LIST_RSRC             VARCHAR2(15)  NULL ,
	LISTING_SEQ_NO        NUMBER(10)  NOT NULL ,
CONSTRAINT  XPKHUB_LISTINGS PRIMARY KEY (LIST_SQN)
);



CREATE TABLE LNK_LIST_LBLCODE
(
	LIST_LBLCD_SQN        NUMBER(10)  NOT NULL ,
	LBLCODE_SQN           NUMBER(10)  NOT NULL ,
	LIST_SQN              NUMBER(10)  NOT NULL ,
	LIST_LBLCD_LDTS       DATE  NOT NULL ,
	LIST_LBLCD_RSRC       VARCHAR2(15)  NULL ,
CONSTRAINT  XPKLNK_LIST_LBLCODE PRIMARY KEY (LIST_LBLCD_SQN),
CONSTRAINT  R_20 FOREIGN KEY (LBLCODE_SQN) REFERENCES HUB_LBL_CODE(LBLCODE_SQN),
CONSTRAINT  R_21 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN)
);



CREATE TABLE SAT_LSTNG_EFFECTIVITY
(
	LIST_LBLCD_SQN        NUMBER(10)  NOT NULL ,
	SAT_LSTNG_EFF_LDTS    DATE  NOT NULL ,
	SAT_LSTNG_EFF_LEDTS   DATE  NULL ,
	SAT_LSTNG_EFF_START   DATE  NULL ,
	SAT_LSTNG_EFF_END     DATE  NULL ,
CONSTRAINT  XPKSAT_LSTNG_EFFECTIVITY PRIMARY KEY (LIST_LBLCD_SQN,SAT_LSTNG_EFF_LDTS),
CONSTRAINT  R_39 FOREIGN KEY (LIST_LBLCD_SQN) REFERENCES LNK_LIST_LBLCODE(LIST_LBLCD_SQN)
);



CREATE TABLE HUB_DOSE_FORM_CODE
(
	DOSE_FORM_SQN         NUMBER(10)  NOT NULL ,
	DOSE_FORM_LDTS        DATE  NOT NULL ,
	DOSE_FORM_RSRC        VARCHAR2(15)  NULL ,
	DOSE_FORM_CODE        VARCHAR2(3)  NULL ,
CONSTRAINT  XPKHUB_DOSE_FORM_CODE PRIMARY KEY (DOSE_FORM_SQN)
);



CREATE TABLE LNK_LISTING_DOSAGE_FORM
(
	LIST_DSG_SQN          NUMBER(10)  NOT NULL ,
	LIST_DSG_LDTS         DATE  NOT NULL ,
	LIST_DSG_RSRC         VARCHAR2(15)  NULL ,
	DOSE_FORM_SQN         NUMBER(10)  NULL ,
	LIST_SQN              NUMBER(10)  NULL ,
CONSTRAINT  XPKLNK_LISTING_DOSAGE_FORM PRIMARY KEY (LIST_DSG_SQN),
CONSTRAINT  R_31 FOREIGN KEY (DOSE_FORM_SQN) REFERENCES HUB_DOSE_FORM_CODE(DOSE_FORM_SQN),
CONSTRAINT  R_32 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN)
);



CREATE TABLE HUB_PKG_SIZE
(
	PKG_SIZE_SQN          NUMBER(10)  NOT NULL ,
	PKG_SIZE_LDTS         DATE  NOT NULL ,
	PKG_SIZE_RSRC         VARCHAR2(15)  NULL ,
	PKG_SIZE              VARCHAR2(25)  NOT NULL ,
CONSTRAINT  XPKHUB_PKG_SIZE PRIMARY KEY (PKG_SIZE_SQN)
);



CREATE TABLE LNK_LISTING_PKG_SIZE
(
	LNK_LIST_PKG_SIZE_SQN  NUMBER(10)  NOT NULL ,
	LNK_LIST_PKG_SIZE_LDTS  DATE  NOT NULL ,
	LNK_LIST_PKG_SIZE_RSRC  VARCHAR2(15)  NULL ,
	LIST_SQN              NUMBER(10)  NOT NULL ,
	PKG_SIZE_SQN          NUMBER(10)  NOT NULL ,
CONSTRAINT  XPKLNK_LISTING_PKG_SIZE PRIMARY KEY (LNK_LIST_PKG_SIZE_SQN),
CONSTRAINT  R_40 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN),
CONSTRAINT  R_41 FOREIGN KEY (PKG_SIZE_SQN) REFERENCES HUB_PKG_SIZE(PKG_SIZE_SQN)
);



CREATE TABLE SAT_PACKAGES
(
	LNK_LIST_PKG_SIZE_SQN  NUMBER(10)  NOT NULL ,
	PKG_LDTS              DATE  NOT NULL ,
	PKG_LEDTS             DATE  NULL ,
	PKG_CODE              VARCHAR2(2)  NOT NULL ,
	PKG_TYPE              VARCHAR2(25)  NOT NULL ,
	PKG_RSRC              VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_PACKAGES__0425A276 PRIMARY KEY (LNK_LIST_PKG_SIZE_SQN,PKG_LDTS),
CONSTRAINT  R_42 FOREIGN KEY (LNK_LIST_PKG_SIZE_SQN) REFERENCES LNK_LISTING_PKG_SIZE(LNK_LIST_PKG_SIZE_SQN)
);



CREATE TABLE SAT_SCHEDULE
(
	LIST_SQN              NUMBER(10)  NOT NULL ,
	SCHDL_SUB_SQN         INTEGER  NOT NULL ,
	SCHDL_LDTS            DATE  NOT NULL ,
	SCHEDULE              NUMBER(1)  NOT NULL ,
	SCHDL_RSRC            VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_SCHEDULE__09DE7BCC PRIMARY KEY (LIST_SQN,SCHDL_SUB_SQN,SCHDL_LDTS),
CONSTRAINT  R_26 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN)
);



CREATE TABLE SAT_DOSE_FORM
(
	DOSE_FORM_SQN         NUMBER(10)  NOT NULL ,
	DOSAGE_LDTS           DATE  NOT NULL ,
	DOSAGE_LEDTS          DATE  NULL ,
	DOSAGE_NAME           VARCHAR2(240)  NULL ,
	DOSAGE_RSRC           VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_DOSE_FORM__0F975522 PRIMARY KEY (DOSE_FORM_SQN,DOSAGE_LDTS),
CONSTRAINT  R_30 FOREIGN KEY (DOSE_FORM_SQN) REFERENCES HUB_DOSE_FORM_CODE(DOSE_FORM_SQN)
);



CREATE INDEX STG_DOSE_FORM_UX_1 ON SAT_DOSE_FORM
(DOSAGE_NAME  ASC);



CREATE TABLE HUB_FIRM_NAME
(
	FIRM_SQN              NUMBER(10)  NOT NULL ,
	FIRM_LDTS             DATE  NOT NULL ,
	FIRM_RSRC             VARCHAR2(15)  NULL ,
	FIRM_NAME             VARCHAR2(150)  NOT NULL ,
CONSTRAINT  XPKFIRM_SITES PRIMARY KEY (FIRM_SQN)
);



CREATE TABLE HUB_FEI_NUMBER
(
	FEI_NUM_SQN           NUMBER(10)  NOT NULL ,
	FEI_NUM_LDTS          DATE  NOT NULL ,
	FEI_NUM_RSRC          VARCHAR2(15)  NULL ,
	FEI_NUMBER            VARCHAR2(10)  NOT NULL ,
CONSTRAINT  XPKHUB_FEI_NUMBER PRIMARY KEY (FEI_NUM_SQN)
);



CREATE TABLE HUB_REG_YEAR
(
	CUR_REG_YR_SQN        NUMBER(10)  NOT NULL ,
	CUR_REG_YR_LDTS       DATE  NOT NULL ,
	CUR_REG_YR_RSRC       VARCHAR2(15)  NULL ,
	CUR_REG_YEAR          INTEGER  NOT NULL ,
CONSTRAINT  XPKHUB_REG_YEAR PRIMARY KEY (CUR_REG_YR_SQN)
);



CREATE TABLE LNK_FIRM_FEI_YEAR
(
	LNK_FIRM_FEI_YR_SQN   NUMBER(10)  NOT NULL ,
	LNK_FIRM_FEI_YR_LDTS  DATE  NOT NULL ,
	LNK_FIRM_FEI_YR_RSRC  VARCHAR2(15)  NOT NULL ,
	FIRM_SQN              NUMBER(10)  NOT NULL ,
	FEI_NUM_SQN           NUMBER(10)  NOT NULL ,
	CUR_REG_YR_SQN        NUMBER(10)  NOT NULL ,
CONSTRAINT  XPKLNK_FIRM_FEI_YEAR PRIMARY KEY (LNK_FIRM_FEI_YR_SQN),
CONSTRAINT  R_47 FOREIGN KEY (FIRM_SQN) REFERENCES HUB_FIRM_NAME(FIRM_SQN),
CONSTRAINT  R_48 FOREIGN KEY (FEI_NUM_SQN) REFERENCES HUB_FEI_NUMBER(FEI_NUM_SQN),
CONSTRAINT  R_49 FOREIGN KEY (CUR_REG_YR_SQN) REFERENCES HUB_REG_YEAR(CUR_REG_YR_SQN)
);



CREATE TABLE SAT_REG_SITES
(
	LNK_FIRM_FEI_YR_SQN   NUMBER(10)  NOT NULL ,
	REG_SITE_LDTS         DATE  NOT NULL ,
	REG_SITE_LEDTS        DATE  NULL ,
	STREET                VARCHAR2(40)  NULL ,
	CITY                  VARCHAR2(40)  NULL ,
	STATE_ID              VARCHAR2(2)  NULL ,
	ZIP                   VARCHAR2(13)  NULL ,
	ISO_COUNTRY_CODE      VARCHAR2(2)  NULL ,
	COUNTRY_NAME          VARCHAR2(13)  NULL ,
	REG_SITE_RSRC         VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_REG_SITES__1367E606 PRIMARY KEY (LNK_FIRM_FEI_YR_SQN,REG_SITE_LDTS),
CONSTRAINT  R_50 FOREIGN KEY (LNK_FIRM_FEI_YR_SQN) REFERENCES LNK_FIRM_FEI_YEAR(LNK_FIRM_FEI_YR_SQN)
);



CREATE TABLE SAT_LBL_FIRMS
(
	LBLCODE_SQN           NUMBER(10)  NOT NULL ,
	FIRM_LDTS             DATE  NOT NULL ,
	FIRM_LEDTS            DATE  NULL ,
	FIRM_NAME             VARCHAR2(150)  NOT NULL ,
	ADDR_HEADER           VARCHAR2(40)  NULL ,
	STREET                VARCHAR2(40)  NULL ,
	PO_BOX                VARCHAR2(9)  NULL ,
	FOREIGN_ADDR          VARCHAR2(40)  NULL ,
	CITY                  VARCHAR2(30)  NULL ,
	STATE_CD              VARCHAR2(2)  NULL ,
	ZIP                   VARCHAR2(9)  NULL ,
	PROVINCE_NAME         VARCHAR2(30)  NULL ,
	COUNTRY               VARCHAR2(40)  NULL ,
	FIRM_RSRC             VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_FIRMS__7E6CC920 PRIMARY KEY (LBLCODE_SQN,FIRM_LDTS),
CONSTRAINT  R_18 FOREIGN KEY (LBLCODE_SQN) REFERENCES HUB_LBL_CODE(LBLCODE_SQN)
);



CREATE TABLE SAT_FORMULATION
(
	LIST_SQN              NUMBER(10)  NOT NULL ,
	FORM_SUB_SQN          NUMBER(5)  NOT NULL ,
	FORM_LDTS             DATE  NOT NULL ,
	UNIT_CODE             VARCHAR2(15)  NOT NULL ,
	STRENGTH              VARCHAR2(10)  NOT NULL ,
	INGREDIANT_NAME       VARCHAR2(100)  NOT NULL ,
	FORM_RSRC             VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_FORMULAT__00551192 PRIMARY KEY (LIST_SQN,FORM_SUB_SQN,FORM_LDTS),
CONSTRAINT  R_27 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN)
);



CREATE TABLE LNK_LBL_FIRM
(
	LNK_LBL_FIRM_SQN      NUMBER(10)  NOT NULL ,
	LBLCODE_SQN           NUMBER(10)  NOT NULL ,
	FIRM_SQN              NUMBER(10)  NOT NULL ,
	LNK_LBL_FIRM_LDTS     DATE  NOT NULL ,
	LNK_LBL_FIRM_RSRC     VARCHAR2(15)  NULL ,
CONSTRAINT  XPKLNK_LBL_FIRM PRIMARY KEY (LNK_LBL_FIRM_SQN),
CONSTRAINT  R_16 FOREIGN KEY (LBLCODE_SQN) REFERENCES HUB_LBL_CODE(LBLCODE_SQN),
CONSTRAINT  R_17 FOREIGN KEY (FIRM_SQN) REFERENCES HUB_FIRM_NAME(FIRM_SQN)
);



CREATE TABLE SAT_LISTINGS
(
	LIST_SQN              NUMBER(10)  NOT NULL ,
	LIST_LDTS             DATE  NOT NULL ,
	LIST_LEDTS            DATE  NULL ,
	PRODUCT_CD            VARCHAR2(4)  NULL ,
	STRENGTH              VARCHAR2(10)  NULL ,
	UNIT_CODE             VARCHAR2(15)  NULL ,
	RX_OTC                VARCHAR2(1)  NULL ,
	TRADENAME             VARCHAR2(100)  NULL ,
	LIST_RSRC             VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_LISTINGS__023D5A04 PRIMARY KEY (LIST_SQN,LIST_LDTS),
CONSTRAINT  R_19 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN)
);



CREATE TABLE LNK_APPLICATION_FIRM_PROD
(
	APPL_FIRM_PROD_SQN    NUMBER(10)  NOT NULL ,
	APPL_SQN              NUMBER(10)  NOT NULL ,
	PROD_NUM_SQN          NUMBER(10)  NOT NULL ,
	FIRM_SQN              NUMBER(10)  NOT NULL ,
	APPL_FIRM_PROD_LDTS   DATE  NOT NULL ,
	APPL_FIRM_PROD_RSRC   VARCHAR2(15)  NULL ,
CONSTRAINT  XPKLNK_APPLICATION_FIRM PRIMARY KEY (APPL_FIRM_PROD_SQN),
CONSTRAINT  R_33 FOREIGN KEY (APPL_SQN) REFERENCES HUB_NDA_APPLICATION(APPL_SQN),
CONSTRAINT  R_34 FOREIGN KEY (PROD_NUM_SQN) REFERENCES HUB_PROD_NUM(PROD_NUM_SQN),
CONSTRAINT  R_35 FOREIGN KEY (FIRM_SQN) REFERENCES HUB_FIRM_NAME(FIRM_SQN)
);



CREATE TABLE SAT_APPL_LIST_PROD
(
	APPL_FIRM_PROD_SQN    NUMBER(10)  NOT NULL ,
	APPL_PROD_LIST_LDTS   DATE  NOT NULL ,
	APPL_PROD_LIST_LEDTS  DATE  NULL ,
	APPL_INGREDIENT_NAME  VARCHAR2(255)  NULL ,
	APPL_DOSE_FORM_ROUTE  VARCHAR2(90)  NULL ,
	APPL_TRADENAME        VARCHAR2(155)  NULL ,
	APPL_FIRM_NAME        VARCHAR2(65)  NULL ,
	APPL_STRENGTH         VARCHAR2(155)  NULL ,
	APPL_THERAP_EQUIV_CODE  VARCHAR2(2)  NULL ,
	APPL_APPROVAL_DATE    VARCHAR2(35)  NULL ,
	APPL_REF_LISTED_DRUG_CODE  VARCHAR2(5)  NULL ,
	APPL_RX_OTC_TYPE_CODE  VARCHAR2(5)  NULL ,
	APPL_RSRC             VARCHAR2(15)  NULL ,
CONSTRAINT  XPKSAT_APPL_LIST_PRO PRIMARY KEY (APPL_FIRM_PROD_SQN,APPL_PROD_LIST_LDTS),
CONSTRAINT  R_29 FOREIGN KEY (APPL_FIRM_PROD_SQN) REFERENCES LNK_APPLICATION_FIRM_PROD(APPL_FIRM_PROD_SQN)
);



CREATE TABLE HUB_PATENT_NUMBER
(
	PAT_NUM_SQN           NUMBER(10)  NOT NULL ,
	PAT_NUM_LDTS          DATE  NOT NULL ,
	PAT_NUM_RSRC          VARCHAR2(15)  NULL ,
	PAT_NUMBER            VARCHAR2(25)  NULL ,
CONSTRAINT  XPKHUB_PATENT_NUMBER PRIMARY KEY (PAT_NUM_SQN)
);



CREATE TABLE HUB_PATENT_USE_CODE
(
	PAT_USE_CODE_SQN      NUMBER(10)  NOT NULL ,
	PAT_USE_CODE_LDTS     DATE  NOT NULL ,
	PAT_USE_CODE_RSRC     VARCHAR2(15)  NULL ,
	PAT_USE_CODE          VARCHAR2(15)  NOT NULL ,
CONSTRAINT  XPKHUB_PATENT_USE_CODE PRIMARY KEY (PAT_USE_CODE_SQN)
);



CREATE TABLE LNK_PAT_APPL_PROD
(
	PAT_APPL_PROD_SQN     NUMBER(10)  NOT NULL ,
	PAT_APPL_PROD_LDTS    DATE  NOT NULL ,
	PAT_APPL_PROD_RSRC    VARCHAR2(15)  NULL ,
	PAT_NUM_SQN           NUMBER(10)  NULL ,
	APPL_SQN              NUMBER(10)  NULL ,
	PROD_NUM_SQN          NUMBER(10)  NULL ,
	PAT_USE_CODE_SQN      NUMBER(10)  NULL ,
CONSTRAINT  XPKLNK_PAT_APPL_PROD PRIMARY KEY (PAT_APPL_PROD_SQN),
CONSTRAINT  R_34 FOREIGN KEY (PAT_NUM_SQN) REFERENCES HUB_PATENT_NUMBER(PAT_NUM_SQN),
CONSTRAINT  R_35 FOREIGN KEY (APPL_SQN) REFERENCES HUB_NDA_APPLICATION(APPL_SQN),
CONSTRAINT  R_36 FOREIGN KEY (PROD_NUM_SQN) REFERENCES HUB_PROD_NUM(PROD_NUM_SQN),
CONSTRAINT  R_38 FOREIGN KEY (PAT_USE_CODE_SQN) REFERENCES HUB_PATENT_USE_CODE(PAT_USE_CODE_SQN)
);



CREATE TABLE SAT_PATENT_APPL
(
	PAT_APPL_PROD_SQN     NUMBER(10)  NOT NULL ,
	PAT_LDTS              DATE  NOT NULL ,
	PAT_LEDTS             DATE  NULL ,
	PAT_EXPIRATION_DATE   VARCHAR2(29)  NULL ,
	PAT_DRUG_SUBSTANCE_FLG  char(1)  NULL ,
	PAT_DRUG_PROD_FLG     char(1)  NULL ,
	PAT_DELIST_FLG        char(1)  NULL ,
	PAT_RSRC              VARCHAR2(15)  NULL ,
CONSTRAINT  XPKSAT_PATENT_APPL PRIMARY KEY (PAT_APPL_PROD_SQN,PAT_LDTS),
CONSTRAINT  R_37 FOREIGN KEY (PAT_APPL_PROD_SQN) REFERENCES LNK_PAT_APPL_PROD(PAT_APPL_PROD_SQN)
);



CREATE TABLE LNK_APPLICATION_LISTING
(
	APPL_PROD_LIST_SQN    NUMBER(10)  NOT NULL ,
	LIST_SQN              NUMBER(10)  NOT NULL ,
	APPL_SQN              NUMBER(10)  NOT NULL ,
	PROD_NUM_SQN          NUMBER(10)  NOT NULL ,
	APPL_PROD_LIST_LDTS   DATE  NOT NULL ,
	APPL_PROD_LIST_RSRC   VARCHAR2(15)  NULL ,
CONSTRAINT  XPKLNK_APPLICATION PRIMARY KEY (APPL_PROD_LIST_SQN),
CONSTRAINT  R_30 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN),
CONSTRAINT  R_31 FOREIGN KEY (APPL_SQN) REFERENCES HUB_NDA_APPLICATION(APPL_SQN),
CONSTRAINT  R_32 FOREIGN KEY (PROD_NUM_SQN) REFERENCES HUB_PROD_NUM(PROD_NUM_SQN)
);



CREATE TABLE HUB_ROUTE_CD
(
	ROUTE_CD_SQN          NUMBER(10)  NOT NULL ,
	ROUTE_CD_LDTS         DATE  NOT NULL ,
	ROUTE_CD_RSRC         VARCHAR2(15)  NULL ,
	ROUTE_CODE            VARCHAR2(3)  NOT NULL ,
CONSTRAINT  XPKHUB_ROUTE_CD PRIMARY KEY (ROUTE_CD_SQN)
);



CREATE TABLE LNK_LISTING_ROUTE_CD
(
	LIST_ROUTE_CD_SQN     NUMBER(10)  NOT NULL ,
	LIST_ROUTE_CD_LDTS    DATE  NOT NULL ,
	LIST_ROUTE_CD_RSRC    VARCHAR2(15)  NULL ,
	LIST_SQN              NUMBER(10)  NOT NULL ,
	ROUTE_CD_SQN          NUMBER(10)  NOT NULL ,
CONSTRAINT  XPKLNK_LISTING_ROUTE_CD PRIMARY KEY (LIST_ROUTE_CD_SQN),
CONSTRAINT  R_51 FOREIGN KEY (LIST_SQN) REFERENCES HUB_LISTINGS(LIST_SQN),
CONSTRAINT  R_52 FOREIGN KEY (ROUTE_CD_SQN) REFERENCES HUB_ROUTE_CD(ROUTE_CD_SQN)
);



CREATE TABLE SAT_ROUTES
(
	LIST_ROUTE_CD_SQN     NUMBER(10)  NOT NULL ,
	ROUTE_LDTS            DATE  NOT NULL ,
	ROUTE_LEDTS           DATE  NULL ,
	ROUTE_NAME            VARCHAR2(240)  NULL ,
	ROUTE_RSRC            VARCHAR2(15)  NULL ,
CONSTRAINT  PK__STG_ROUTES__060DEAE8 PRIMARY KEY (LIST_ROUTE_CD_SQN,ROUTE_LDTS),
CONSTRAINT  R_53 FOREIGN KEY (LIST_ROUTE_CD_SQN) REFERENCES LNK_LISTING_ROUTE_CD(LIST_ROUTE_CD_SQN)
);


