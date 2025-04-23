//objectcomments  
forward
global type u_logger_stdout from u_logger
end type
end forward

global type u_logger_stdout from u_logger
end type
global u_logger_stdout u_logger_stdout

type prototypes

protected function boolean pef_attach_console( &
	long al_procid &
) library 'kernel32.dll' alias for 'AttachConsole'

protected function long pef_get_std_handle( &
	long nstdhandle &
) library 'kernel32.dll' alias for 'GetStdHandle'

protected function int pef_free_console() library 'kernel32.dll' alias for 'FreeConsole'

protected function ulong pef_write_console( &
	long al_handle, &
	string ps_output, &
	long pl_numcharstowrite, &
	ref long pl_numcharswritten, &
	long reserved &
) library 'kernel32.dll' alias for 'WriteConsoleW'

protected subroutine pef_keybd_event( &
	int pi_bvk, &
	int pi_bscan, &
	int pi_dwflags, &
	int pi_dwextrainfo &
) library 'user32.dll' alias for 'keybd_event'


end prototypes

type variables
private long pl_stdout_handle
end variables

forward prototypes
public subroutine of_log (string as_message)
end prototypes

public subroutine of_log (string as_message);long ll_result
if handle(getapplication()) = 0 then
	// PB mode => no logging
	return
end if
if isnull(pl_stdout_handle) then
	throw(gu_e.iu_as.of_re_io(gu_e.of_new_error('no console attached')))
end if
as_message += '~r~n'
pef_write_console(pl_stdout_handle, as_message, len(as_message), ll_result, 0)
end subroutine

on u_logger_stdout.create
call super::create
end on

on u_logger_stdout.destroy
call super::destroy
end on

event constructor;call super::constructor;// get stdout handle of parent process
setnull(pl_stdout_handle)
if handle(getapplication()) > 0 then
   if pef_attach_console(-1) then // -1=attach to parent process
      pl_stdout_handle = pef_get_std_handle(-11) // -11=stdout
   end if
end if

end event

event destructor;call super::destructor;if not isnull(pl_stdout_handle) then
	pef_free_console()
end if

end event

