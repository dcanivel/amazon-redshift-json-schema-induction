create external table FHIR_TEST_DB.Claims(
	"resourceType" varchar(6),
	"id" varchar(43),
	"status" varchar(7),
	"use" varchar(9),
	"patient" struct<"reference": varchar(52)>,
	"billablePeriod" struct<"start": varchar(30),"end": varchar(30)>,
	"organization" struct<"reference": varchar(58)>,
	"diagnosis" array<struct<"sequence": double precision,"diagnosisReference": struct<"reference": varchar(55)>>>,
	"item" array<struct<"sequence": double precision,"encounter": array<varchar(55)>,"diagnosisLinkId": array<double precision>>>,
	"total" struct<"value": double precision,"system": varchar(24),"code": varchar(3)>
)
row format serde 'org.openx.data.jsonserde.JsonSerDe'
with serdeproperties ('dots.in.keys' = 'true','mapping.requesttime' = 'requesttimestamp','strip.outer.array' = 'true')
location 'target/tmp/json.json'
;
