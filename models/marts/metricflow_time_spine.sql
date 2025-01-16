
-- metricflow_time_spine.sql
with 

days as (
    
    --for BQ adapters use "DATE('01/01/2000','mm/dd/yyyy')"
    {{ dbt_date.get_base_dates(start_date="2016-01-01", end_date="2017-09-01", datepart="day") }}

),

cast_to_date as (

    select 
        cast(date_day as date) as date_day,
        date_trunc('quarter', date_day) as almost_fiscal_quarter
    
    from days

)

select * from cast_to_date
