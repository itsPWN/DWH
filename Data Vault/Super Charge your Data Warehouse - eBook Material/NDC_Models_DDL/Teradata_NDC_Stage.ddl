
CREATE TABLE STG_FORMULAT
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NO        numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NO'  ,
	STRENGTH              varchar(10)  
		TITLE 'STRENGTH'  ,
	UNIT                  varchar(5)  
		TITLE 'UNIT'  ,
	INGREDIANT_NAME       varchar(100)  
		TITLE 'INGREDIANT_NAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_FORMULAT__00551192
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_FIRMS
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LBLCODE               varchar(6)  NOT NULL 
		TITLE 'LBLCODE'  ,
	FIRM_NAME             varchar(65)  
		TITLE 'FIRM_NAME'  ,
	ADDR_HEADER           varchar(40)  
		TITLE 'ADDR_HEADER'  ,
	STREET                varchar(40)  
		TITLE 'STREET'  ,
	PO_BOX                varchar(9)  
		TITLE 'PO_BOX'  ,
	FOREIGN_ADDR          varchar(40)  
		TITLE 'FOREIGN_ADDR'  ,
	CITY                  varchar(30)  
		TITLE 'CITY'  ,
	STATE                 varchar(2)  
		TITLE 'STATE'  ,
	ZIP                   varchar(9)  
		TITLE 'ZIP'  ,
	PROVINCE_NAME         varchar(30)  
		TITLE 'PROVINCE_NAME'  ,
	COUNTRY               varchar(40)  
		TITLE 'COUNTRY'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_FIRMS__7E6CC920
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_APPLICATION
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NO        numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NO'  ,
	APPL_NUM              varchar(6)  
		TITLE 'APPL_NUM'  ,
	PROD_NO               varchar(3)  
		TITLE 'PROD_NO'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_APPLICATION__7C8480AE
	 (
			STG_SQN
	 )
;



CREATE INDEX STG_APP_UX_1
 (
		LISTING_SEQ_NO,
		APPL_NUM,
		PROD_NO
 ) ON STG_APPLICATION
;



CREATE TABLE CNTRL_DATE
(
	CNTRL_SQN             INTEGER  NOT NULL 
		TITLE 'CNTRL_SQN'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL  DEFAULT getdate()
		TITLE 'LOAD_DTS'  
)
	 UNIQUE PRIMARY INDEX PK__CNTRL_DATE__1ED998B2
	 (
			CNTRL_SQN
	 )
;



CREATE TABLE STG_PRODUCTS
(
	STG_SQN               INTEGER  NOT NULL 
		TITLE 'STG_SQN'  ,
	INGREDIENT            varchar(66)  
		TITLE 'INGREDIENT'  ,
	DOSE_FORM_ROUTE       varchar(45)  
		TITLE 'DOSE_FORM_ROUTE'  ,
	TRADENAME             varchar(85)  
		TITLE 'TRADENAME'  ,
	APPLICANT_FIRM_NAME   varchar(65)  
		TITLE 'APPLICANT_FIRM_NAME'  ,
	STRENGTH              varchar(155)  
		TITLE 'STRENGTH'  ,
	NDA_APPL_NUM          varchar(8)  
		TITLE 'NDA_APPL_NUM'  ,
	NDA_PROD_NUM          varchar(3)  
		TITLE 'NDA_PROD_NUM'  ,
	THERAP_EQUIV_CODE     varchar(2)  
		TITLE 'THERAP_EQUIV_CODE'  ,
	APPROVAL_DATE         varchar(35)  
		TITLE 'APPROVAL_DATE'  ,
	REF_LISTED_DRUG_CODE  varchar(5)  
		TITLE 'REF_LISTED_DRUG_CODE'  ,
	RX_OTC_TYPE_CODE      varchar(5)  
		TITLE 'RX_OTC_TYPE_CODE'  ,
	APPL_FULL_FIRM_NAME   varchar(150)  
		TITLE 'APPL_FULL_FIRM_NAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_PRODUCTS__1920BF5C
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_PATENT
(
	STG_SQN               INTEGER  NOT NULL 
		TITLE 'STG_SQN'  ,
	NDA_APPL_NUM          varchar(8)  
		TITLE 'NDA_APPL_NUM'  ,
	NDA_PROD_NUM          varchar(3)  
		TITLE 'NDA_PROD_NUM'  ,
	NDA_PATENT_NUM        varchar(25)  
		TITLE 'NDA_PATENT_NUM'  ,
	NDA_PATENT_EXP_DATE   varchar(29)  
		TITLE 'NDA_PATENT_EXP_DATE'  ,
	DRUG_SUBSTANCE_FLG    varchar(1)  
		TITLE 'DRUG_SUBSTANCE_FLG'  ,
	DRUG_PROD_FLG         varchar(1)  
		TITLE 'DRUG_PROD_FLG'  ,
	PATENT_USE_CODE       varchar(15)  
		TITLE 'PATENT_USE_CODE'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_PATENT__173876EA
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_EXCLUSIVITY
(
	STG_SQN               INTEGER  NOT NULL 
		TITLE 'STG_SQN'  ,
	NDA_APPL_NUM          varchar(8)  
		TITLE 'NDA_APPL_NUM'  ,
	NDA_PROD_NUM          varchar(3)  
		TITLE 'NDA_PROD_NUM'  ,
	EXCLUSIVITY_CODE      varchar(10)  
		TITLE 'EXCLUSIVITY_CODE'  ,
	EXCLUSIVITY_EXP_DATE  varchar(29)  
		TITLE 'EXCLUSIVITY_EXP_DATE'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_EXCLUSIVITY__15502E78
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_REG_SITES
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	FEI_NUMBER            varchar(10)  NOT NULL 
		TITLE 'FEI_NUMBER'  ,
	CURRENT_REGISTRATION_YEAR  varchar(18)  
		TITLE 'CURRENT_REGISTRATION_YEAR'  ,
	FIRM_NAME             varchar(65)  
		TITLE 'FIRM_NAME'  ,
	STREET                varchar(40)  
		TITLE 'STREET'  ,
	CITY                  varchar(40)  
		TITLE 'CITY'  ,
	STATE_ID              varchar(2)  
		TITLE 'STATE_ID'  ,
	ZIP                   varchar(13)  
		TITLE 'ZIP'  ,
	ISO_COUNTRY_CODE      varchar(2)  
		TITLE 'ISO_COUNTRY_CODE'  ,
	COUNTRY_NAME          varchar(13)  
		TITLE 'COUNTRY_NAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(10)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_REG_SITES__1367E606
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_DOSE_FORM
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NO        numeric(9)  NOT NULL 
		TITLE 'LISTING_SEQ_NO'  ,
	DOSEFORM              varchar(3)  
		TITLE 'DOSEFORM'  ,
	DOSAGE_NAME           varchar(240)  
		TITLE 'DOSAGE_NAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_DOSE_FORM__0F975522
	 (
			STG_SQN
	 )
;



CREATE INDEX STG_DOSE_FORM_UX_1
 (
		LISTING_SEQ_NO,
		DOSEFORM,
		DOSAGE_NAME
 ) ON STG_DOSE_FORM
;



CREATE TABLE STG_TBL_UNIT
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	UNIT                  varchar(15)  NOT NULL 
		TITLE 'UNIT'  ,
	TRANSLATION           varchar(240)  
		TITLE 'TRANSLATION'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_TBL_UNIT__0DAF0CB0
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_TBL_ROUTE
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	ROUTE_CHAR            varchar(3)  NOT NULL 
		TITLE 'ROUTE_CHAR'  ,
	TRANSLATION           varchar(240)  
		TITLE 'TRANSLATION'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_TBL_ROUTE__0BC6C43E
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_SCHEDULE
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NUM       numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NUM'  ,
	SCHEDULE              numeric(1)  
		TITLE 'SCHEDULE'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_SCHEDULE__09DE7BCC
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_TBL_DOSAGE
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	DOSE_FORM             varchar(3)  NOT NULL 
		TITLE 'DOSE_FORM'  ,
	TRANSLATION           varchar(240)  
		TITLE 'TRANSLATION'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_TBL_DOSAGE__07F6335A
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_ROUTES
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NUM       numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NUM'  ,
	ROUTE_CODE            varchar(3)  
		TITLE 'ROUTE_CODE'  ,
	ROUTE_NAME            varchar(240)  
		TITLE 'ROUTE_NAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_ROUTES__060DEAE8
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_PACKAGES
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NO        numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NO'  ,
	PKGCODE               varchar(2)  
		TITLE 'PKGCODE'  ,
	PKG_SIZE              varchar(25)  
		TITLE 'PKG_SIZE'  ,
	PKG_TYPE              varchar(25)  
		TITLE 'PKG_TYPE'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_PACKAGES__0425A276
	 (
			STG_SQN
	 )
;



CREATE TABLE STG_LISTINGS
(
	STG_SQN               numeric(10)  NOT NULL 
		TITLE 'STG_SQN'  ,
	LISTING_SEQ_NO        numeric(7)  NOT NULL 
		TITLE 'LISTING_SEQ_NO'  ,
	LBLCODE               varchar(6)  
		TITLE 'LBLCODE'  ,
	PRODUCT_CD            varchar(4)  
		TITLE 'PRODUCT_CD'  ,
	STRENGTH              varchar(10)  
		TITLE 'STRENGTH'  ,
	UNIT                  varchar(10)  
		TITLE 'UNIT'  ,
	RX_OTC                varchar(1)  
		TITLE 'RX_OTC'  ,
	TRADENAME             varchar(100)  
		TITLE 'TRADENAME'  ,
	LOAD_DTS              TIMESTAMP  NOT NULL 
		TITLE 'LOAD_DTS'  ,
	REC_SRC               varchar(15)  NOT NULL 
		TITLE 'REC_SRC'  
)
	 UNIQUE PRIMARY INDEX PK__STG_LISTINGS__023D5A04
	 (
			STG_SQN
	 )
;


