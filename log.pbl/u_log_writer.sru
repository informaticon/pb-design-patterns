//objectcomments  
forward
global type u_log_writer from nonvisualobject
end type
end forward

global type u_log_writer from nonvisualobject
end type
global u_log_writer u_log_writer

forward prototypes
public subroutine of_write (string as_message)
end prototypes

public subroutine of_write (string as_message);throw(gu_e.iu_as.of_re_notimplemented(gu_e.of_new_error('this is an abstract function which must be overritten by its ancestors')))

end subroutine

on u_log_writer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_log_writer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

