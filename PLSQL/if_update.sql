function if_update(
   in_new in varchar2
 , in_old in varchar2
 ) return boolean is
  begin
    <<opt_upd>>
    case
      when in_new is null and in_old is null then
        return (false);
      when in_new = in_old then
        return(false);
      when in_new != in_old then
        return(true);
      when in_new is not null and in_old is null then
        return(true);
      when in_new is null and in_old is not null then
        return(true);
    end case opt_upd;
  end if_update;