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

end variables

forward prototypes
public subroutine of_log (string as_message)
end prototypes

public subroutine of_log (string as_message);throw(gu_e.iu_as.of_re_notimplemented(gu_e.of_new_error('this is an abstract function which must be overritten by its ancestors')))
end subroutine

on u_logger.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_logger.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

