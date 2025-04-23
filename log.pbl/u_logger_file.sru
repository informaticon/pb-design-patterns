//objectcomments  
forward
global type u_logger_file from u_logger
end type
end forward

global type u_logger_file from u_logger
end type
global u_logger_file u_logger_file

forward prototypes
public subroutine of_log (string as_message)
end prototypes

public subroutine of_log (string as_message);int li_file
li_file = fileopen('out.log', linemode!, write!, lockwrite!, append!, encodingutf8!)
if li_file <= 0 then
	throw(gu_e.iu_as.of_re_io(gu_e.of_new_error('cannot open file') &
		.of_push('as_message', as_message) &
	))
end if
try
	filewriteex(li_file, as_message)
finally
	fileclose(li_file)
end try

end subroutine

on u_logger_file.create
call super::create
end on

on u_logger_file.destroy
call super::destroy
end on

