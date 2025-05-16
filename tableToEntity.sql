-- create ENTITY or DTO from table
call tableToEntity(1, 'ms_api_yearly_hit', 'go4gst_gsp'); -- 1 --> FOR --> ENTITY
call tableToEntity(2, 'ms_api_yearly_hit', 'go4gst_gsp'); -- 2 --> FOR --> DTO

CREATE  PROCEDURE `tableToEntity`(in type int,in t_table_name varchar(200),in t_schema_name varchar(200))
BEGIN
set @tname=replace(CONCAT(UCASE(LEFT(t_table_name, 1)),SUBSTRING(t_table_name, 2)),'_','');
if(type<=1) then 

select concat(' import java.io.Serializable;\r\n import javax.persistence.Column;\r\n import javax.persistence.Entity;\r\n import javax.persistence.Table;\r\n\r\n/**\r\n*\r\n* @author lal.kumar\r\n* @Date  ',current_timestamp,' \r\n*\r\n*/\r\n') as dto from dual
union all
select concat('@Entity\r\n@Table(name="',t_table_name,'")\r\npublic class ',@tname,' implements Serializable {\r\n    private static final long serialVersionUID = 1L;\r\n') as dto from dual
union all
select concat('    @Column(name = "',column_name,'")\r\n    private ',DATA_TYPE,fieldName1,';\r\n\r\n    public ',DATA_TYPE, 'get',fieldName,'() {\r\n        return ',fieldName1,';\r\n    }\r\n\r\n    public void set',fieldName,'(',DATA_TYPE,fieldName1,') {\r\n        this.',fieldName1,'=',fieldName1,';\r\n    }\r\n') as dto from ( select x.column_name, replace(replace(replace(CONCAT(UCASE(LEFT(x.column_name, 1)),SUBSTRING(x.column_name, 2)),'_',''),' ',''),'-','')  as fieldName,  replace(replace(replace(x.column_name,'_',''),' ',''),'-','')  as fieldName1,  DATA_TYPE  from (select lcase(COLUMN_NAME) as column_name,  case when lower(DATA_TYPE)='int' then 'Integer ' when lower(DATA_TYPE)='double' then 'Double ' when lower(DATA_TYPE)='float' then 'Float ' when lower(DATA_TYPE)='decimal' then 'Double ' when lower(DATA_TYPE) in ('number','bigint') then 'Long ' when lower(DATA_TYPE)='varchar' then 'String ' when lower(DATA_TYPE)='timestamp' then 'Timestamp ' when lower(DATA_TYPE)='time' then 'Time ' when lower(DATA_TYPE)='date' then 'Date ' else 'String ' end as DATA_TYPE FROM INFORMATION_SCHEMA.columns WHERE TABLE_NAME = t_table_name and TABLE_SCHEMA=t_schema_name ORDER BY ORDINAL_POSITION) x ) xx 
union all
select '}' as dto from dual;

else
select concat('import java.io.Serializable;\r\n\r\n/**\r\n*\r\n* @author lal.kumar\r\n* @Date  ',current_timestamp,' \r\n*\r\n*/\r\n') as dto from dual
union all
select concat('public class ',@tname,'  implements Serializable {\r\n    private static final long serialVersionUID = 1L;\r\n') as dto from dual
union all
select concat('    private ',DATA_TYPE,fieldName1,';\r\n\r\n    public ',DATA_TYPE, 'get',fieldName,'() {\r\n        return ',fieldName1,';\r\n    }\r\n\r\n    public void set',fieldName,'(',DATA_TYPE,fieldName1,'){\r\n        this.',fieldName1,'=',fieldName1,';\r\n    }\r\n') as dto from ( select x.column_name, replace(replace(replace(CONCAT(UCASE(LEFT(x.column_name, 1)),SUBSTRING(x.column_name, 2)),'_',''),' ',''),'-','')  as fieldName,  replace(replace(replace(x.column_name,'_',''),' ',''),'-','')  as fieldName1,  DATA_TYPE  from (select lcase(COLUMN_NAME) as column_name,  case when lower(DATA_TYPE)='int' then 'Integer ' when lower(DATA_TYPE)='double' then 'Double ' when lower(DATA_TYPE)='float' then 'Float ' when lower(DATA_TYPE)='decimal' then 'Double ' when lower(DATA_TYPE) in ('number','bigint') then 'Long ' when lower(DATA_TYPE)='varchar' then 'String ' when lower(DATA_TYPE)='timestamp' then 'Timestamp ' when lower(DATA_TYPE)='time' then 'Time ' when lower(DATA_TYPE)='date' then 'Date ' else 'String ' end as DATA_TYPE FROM INFORMATION_SCHEMA.columns WHERE TABLE_NAME = t_table_name and TABLE_SCHEMA=t_schema_name ORDER BY ORDINAL_POSITION) x ) xx 
union all
select '}' as dto from dual;

end if;
END

