
ALTER TABLE CNTRL_DATE
	ADD  PRIMARY KEY (CNTRL_SQN)
;



ALTER TABLE STG_APPLICATION
	ADD  PRIMARY KEY (STG_SQN)
;



CREATE INDEX STG_APP_UX_1 ON STG_APPLICATION
(
	LISTING_SEQ_NO,
	APPL_NUM,
	PROD_NO
)
;



ALTER TABLE STG_DOSE_FORM
	ADD  PRIMARY KEY (STG_SQN)
;



CREATE INDEX STG_DOSE_FORM_UX_1 ON STG_DOSE_FORM
(
	LISTING_SEQ_NO,
	DOSEFORM,
	DOSAGE_NAME
)
;



ALTER TABLE STG_EXCLUSIVITY
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_FIRMS
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_FORMULAT
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_LISTINGS
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_PACKAGES
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_PATENT
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_PRODUCTS
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_REG_SITES
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_ROUTES
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_SCHEDULE
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_TBL_DOSAGE
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_TBL_ROUTE
	ADD  PRIMARY KEY (STG_SQN)
;



ALTER TABLE STG_TBL_UNIT
	ADD  PRIMARY KEY (STG_SQN)
;


