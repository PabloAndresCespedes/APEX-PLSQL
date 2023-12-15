procedure assert( in_condition boolean, in_msg in varchar2 )
as
begin
    if not coalesce(in_condition, false) then
        raise_application_error (-20000, regexp_replace(in_msg, 'ORA-[0-9]+: '));
    end if;
end assert;