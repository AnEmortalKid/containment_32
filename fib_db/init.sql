-- the classic fibonacci
create or replace function fib_compute(n_in in number) return number deterministic
is answer number;
begin
if n_in < 1 then answer := 1;
else
 answer := fib_compute(n_in-1)+fib_compute(n_in-2);
end if;
return answer;
end;
/
-- use a virtual column
create table fib_mem(n number,ans number generated always as (fib_compute(n)) virtual);
/
-- api that can memoize stuff
create or replace procedure fibonacci(q in number) as
answer number;
begin
  begin
  select ans into answer from fib_mem where n=q;
    exception
      when no_data_found then
        insert into fib_mem(n) values(q);
  end;
select ans into answer from fib_mem where n=q;
dbms_output.put_line('Answer:' || answer);
end;
/