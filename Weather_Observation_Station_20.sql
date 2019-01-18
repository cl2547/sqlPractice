-- reference:https://www.benlcollins.com/sql/mysql-averages/
select round(avg(LAT_N),4) as median from
(
    select @counter:=@counter+1 as row_id, LAT_N
    from station, (select @counter:=0) t2
    order by LAT_N
) o1
join
(
    select count(*) as total_rows
    from station
) o2
where o1.row_id in (floor((o2.total_rows + 1)/2), floor((o2.total_rows + 2)/2))