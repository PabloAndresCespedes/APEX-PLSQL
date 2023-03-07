declare

p_emp_no number;
p_max_sal varchar2(255);

begin

    select count(distinct empno), to_char(max(sal), '999G999G999G999G999G999G990')
    into p_emp_no, p_max_sal 
    from emp 
    where deptno=apex_application.g_x01
    fetch first row only;

    apex_json.open_object;
        apex_json.write('empno', p_emp_no);
        apex_json.write('sal', p_max_sal);
    apex_json.close_all;
    
    exception when no_data_found then
        p_emp_no := 0;
        p_max_sal := 0;
end;
