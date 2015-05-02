explain (analyze, verbose, format text)
select *
    from users
    where team = 'yellow'
    and id = (
        select max(id)
            from users
            where team = 'yellow'
    );

explain (analyze, verbose, format text)
select *
    from users as a
    where a.team = 'yellow'
    and not exists (
        select *
            from users as b
            where b.team = 'yellow'
            and a.id < b.id
    );

explain (analyze, verbose, format text)
select A.*
    from users as A
    inner join (
        select B.team,max(B.id) as maxval
        from users as B
        group by B.team
    ) as C
    on A.team = C.team and A.id = C.maxval
    where A.team = 'yellow';

