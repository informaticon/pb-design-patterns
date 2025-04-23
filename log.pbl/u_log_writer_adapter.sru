forward
global type u_log_writer_adapter from u_log_writer
end type
end forward

global type u_log_writer_adapter from u_log_writer
event ue_write ( string as_message )
end type
global u_log_writer_adapter u_log_writer_adapter

forward prototypes
public subroutine of_write (string as_message)
end prototypes

event ue_write(string as_message);// must be implemented by user
end event

public subroutine of_write (string as_message);this.event ue_write(as_message)
end subroutine

on u_log_writer_adapter.create
call super::create
end on

on u_log_writer_adapter.destroy
call super::destroy
end on

