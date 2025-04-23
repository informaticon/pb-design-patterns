//objectcomments  
forward
global type u_log_writer_file from u_log_writer
end type
end forward

global type u_log_writer_file from u_log_writer
end type
global u_log_writer_file u_log_writer_file

type variables
protected string ps_file
protected ulong pul_max_file_size
end variables

forward prototypes
public subroutine of_write (string as_message)
public function u_log_writer_file of_set_file (string as_filepath)
public function u_log_writer_file of_set_max_file_size (unsignedlong aul_byte)
protected subroutine pf_rotate_log ()
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

pf_rotate_log()
end subroutine

public function u_log_writer_file of_set_file (string as_filepath);ps_file = as_filepath

return this
end function

public function u_log_writer_file of_set_max_file_size (unsignedlong aul_byte);pul_max_file_size = aul_byte

return this
end function

protected subroutine pf_rotate_log ();//TODO
end subroutine

on u_log_writer_file.create
call super::create
end on

on u_log_writer_file.destroy
call super::destroy
end on

