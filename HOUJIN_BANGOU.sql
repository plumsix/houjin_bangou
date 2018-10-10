drop table HOUJIN_BANGOU;
create table HOUJIN_BANGOU
( SEQUENCE_NUMBER            number(9)
, CORPORATE_NUMBER           char(13)
, PROCESS                    char(2)
, CORRECT                    char(1)
, UPDATE_DATE                date
, CHANGE_DATE                date
, NAME                       varchar(600)
, NAME_IMAGE_ID              char(8)
, KIND                       char(3)
, PREFECTURE_NAME            varchar2(40)
, CITY_NAME                  varchar2(80)
, STREET_NUMBER              varchar2(1200)
, ADDRESS_IMAGE_ID           char(8)
, PREFECTURE_CODE            char(2)
, CITY_CODE                  char(3)
, POST_CODE                  char(7)
, ADDRESS_OUTSIDE            varchar2(1200)
, ADDRESS_OUTSIDE_IMAGE_ID   char(8)
, CLOSE_DATE                 date
, CLOSE_CAUSE                char(2)
, SUCCESSOR_CORPORATE_NUMBER char(13)
, CHANGE_CAUSE               varchar2(2000)
, ASSIGNMENT_DATE            date
, LATEST                     char(1)
, EN_NAME                    varchar2(300)
, EN_PREFECTURE_NAME         varchar2(9)
, EN_CITY_NAME               varchar2(600)
, EN_ADDRESS_OUTSIDE         varchar2(600)
, FURIGANA                   varchar2(2000)
, CONSTRAINT HOUJIN_BANGOU_PK PRIMARY KEY (CORPORATE_NUMBER)
)
partition by hash (PREFECTURE_CODE)
( partition p01
, partition p02
, partition p03
, partition p04
, partition p05
, partition p06
, partition p07
, partition p08
);
/*
 * To avoid ORA-14402. It makes rows moveable across each partition.
 */
ALTER TABLE HOUJIN_BANGOU ENABLE ROW MOVEMENT;
/*
 * 更新可能なビューと INSTEAD OF ビュートリガー
 */
drop table HOUJIN_BANGOU_VIEW;
create or replace view HOUJIN_BANGOU_VIEW as
select * from HOUJIN_BANGOU
with check option constraint HOUJIN_BANGOU_V
;
create or replace trigger TRG_HOUJIN_BANGOU_INS
instead of insert on HOUJIN_BANGOU_VIEW
begin
	update HOUJIN_BANGOU
	set SEQUENCE_NUMBER = :new.SEQUENCE_NUMBER
	  , CORPORATE_NUMBER = :new.CORPORATE_NUMBER
	  , PROCESS = :new.PROCESS
	  , CORRECT = :new.CORRECT
	  , UPDATE_DATE = :new.UPDATE_DATE
	  , CHANGE_DATE = :new.CHANGE_DATE
	  , NAME = :new.NAME
	  , NAME_IMAGE_ID = :new.NAME_IMAGE_ID
	  , KIND = :new.KIND
	  , PREFECTURE_NAME = :new.PREFECTURE_NAME
	  , CITY_NAME = :new.CITY_NAME
	  , STREET_NUMBER = :new.STREET_NUMBER
	  , ADDRESS_IMAGE_ID = :new.ADDRESS_IMAGE_ID
	  , PREFECTURE_CODE = :new.PREFECTURE_CODE
	  , CITY_CODE = :new.CITY_CODE
	  , POST_CODE = :new.POST_CODE
	  , ADDRESS_OUTSIDE = :new.ADDRESS_OUTSIDE
	  , ADDRESS_OUTSIDE_IMAGE_ID = :new.ADDRESS_OUTSIDE_IMAGE_ID
	  , CLOSE_DATE = :new.CLOSE_DATE
	  , CLOSE_CAUSE = :new.CLOSE_CAUSE
	  , SUCCESSOR_CORPORATE_NUMBER = :new.SUCCESSOR_CORPORATE_NUMBER
	  , CHANGE_CAUSE = :new.CHANGE_CAUSE
	  , ASSIGNMENT_DATE = :new.ASSIGNMENT_DATE
	  , LATEST = :new.LATEST
	  , EN_NAME = :new.EN_NAME
	  , EN_PREFECTURE_NAME = :new.EN_PREFECTURE_NAME
	  , EN_CITY_NAME = :new.EN_CITY_NAME
	  , EN_ADDRESS_OUTSIDE = :new.EN_ADDRESS_OUTSIDE
	  , FURIGANA = :new.FURIGANA
	where CORPORATE_NUMBER = :new.CORPORATE_NUMBER
	;
	if sql%notfound then
		insert into HOUJIN_BANGOU
		( SEQUENCE_NUMBER
		, CORPORATE_NUMBER
		, PROCESS
		, CORRECT
		, UPDATE_DATE
		, CHANGE_DATE
		, NAME
		, NAME_IMAGE_ID
		, KIND
		, PREFECTURE_NAME
		, CITY_NAME
		, STREET_NUMBER
		, ADDRESS_IMAGE_ID
		, PREFECTURE_CODE
		, CITY_CODE
		, POST_CODE
		, ADDRESS_OUTSIDE
		, ADDRESS_OUTSIDE_IMAGE_ID
		, CLOSE_DATE
		, CLOSE_CAUSE
		, SUCCESSOR_CORPORATE_NUMBER
		, CHANGE_CAUSE
		, ASSIGNMENT_DATE
		, LATEST
		, EN_NAME
		, EN_PREFECTURE_NAME
		, EN_CITY_NAME
		, EN_ADDRESS_OUTSIDE
		, FURIGANA
		) values
		( :new.SEQUENCE_NUMBER
		, :new.CORPORATE_NUMBER
		, :new.PROCESS
		, :new.CORRECT
		, :new.UPDATE_DATE
		, :new.CHANGE_DATE
		, :new.NAME
		, :new.NAME_IMAGE_ID
		, :new.KIND
		, :new.PREFECTURE_NAME
		, :new.CITY_NAME
		, :new.STREET_NUMBER
		, :new.ADDRESS_IMAGE_ID
		, :new.PREFECTURE_CODE
		, :new.CITY_CODE
		, :new.POST_CODE
		, :new.ADDRESS_OUTSIDE
		, :new.ADDRESS_OUTSIDE_IMAGE_ID
		, :new.CLOSE_DATE
		, :new.CLOSE_CAUSE
		, :new.SUCCESSOR_CORPORATE_NUMBER
		, :new.CHANGE_CAUSE
		, :new.ASSIGNMENT_DATE
		, :new.LATEST
		, :new.EN_NAME
		, :new.EN_PREFECTURE_NAME
		, :new.EN_CITY_NAME
		, :new.EN_ADDRESS_OUTSIDE
		, :new.FURIGANA
		);
	end if;
end;
/
