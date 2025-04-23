//objectcomments  
forward
global type u_log_writer_file from u_log_writer
end type
end forward

global type u_log_writer_file from u_log_writer
end type
global u_log_writer_file u_log_writer_file

forward prototypes
public subroutine of_write (string as_message)
end prototypes

public subroutine of_write (string as_message);int li_file
li_file = fileopen('out.log', linemode!, write!, lockwrite!, append!, encodingutf8!)
if li_file <= 0 then 
	throw(gu_e.iu_as.of_re_io(gu_e.of_new_error('cannot open log file')))
end if
try
	if filewriteex(li_file, as_message) < 0 then
		throw(gu_e.iu_as.of_re_io(gu_e.of_new_error('cannot open log file')))
	end if
finally
	fileclose(li_file)
end try
end subroutine

on u_log_writer_file.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_log_writer_file.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

