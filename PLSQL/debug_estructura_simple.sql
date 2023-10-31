subtype debug is boolean;

procedure set_debug ( in_value debug );
function get_debug return debug;

procedure set_debug (
  in_value debug
)as
begin
  g_debug := in_value;
end set_debug;

function get_debug 
  return debug
is
begin
  return g_debug;
end get_debug;