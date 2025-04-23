//objectcomments  
forward
global type u_logger from nonvisualobject
end type
end forward

global type u_logger from nonvisualobject
end type
global u_logger u_logger

type prototypes

end prototypes

type variables
private u_log_writer pu_writer
end variables

forward prototypes
public subroutine of_log (string as_message)
public subroutine of_set_writer (u_log_writer au_writer)
end prototypes

public subroutine of_log (string as_message);if isvalid(pu_writer) then
	pu_writer.of_write(as_message)
end if
end subroutine

public subroutine of_set_writer (u_log_writer au_writer);pu_writer = au_writer
end subroutine

on u_logger.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_logger.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

