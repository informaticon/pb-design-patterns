//objectcomments  
forward
global type u_logger from nonvisualobject
end type
end forward

global type u_logger from nonvisualobject
end type
global u_logger u_logger

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
private long pl_output_type

constant long CL_OUTPUT_TYPE_FILE = 1
constant long CL_OUTPUT_TYPE_STDOUT = 2




private long pl_stdout_handle
end variables

forward prototypes
public subroutine of_log (string as_message)
public subroutine of_set_output (long al_output_type)
end prototypes

public subroutine of_log (string as_message);int li_file
choose case pl_output_type
	case CL_OUTPUT_TYPE_FILE
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
	case CL_OUTPUT_TYPE_STDOUT
		long ll_result
		if handle(getapplication()) = 0 then
			// PB mode => no logging
			return
		end if
		if isnull(pl_stdout_handle) then
			throw(gu_e.iu_as.of_re_io(gu_e.of_new_error('no console attached')))
		end if
		as_message += '~r~n'
		pef_write_console(pl_stdout_handle, as_message, len(as_message), ll_result, 0)
end choose

end subroutine

public subroutine of_set_output (long al_output_type);pl_output_type = al_output_type
end subroutine

on u_logger.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_logger.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;// get stdout handle of parent process
setnull(pl_stdout_handle)
if handle(getapplication()) > 0 then
   if pef_attach_console(-1) then // -1=attach to parent process
      pl_stdout_handle = pef_get_std_handle(-11) // -11=stdout
   end if
end if

end event

event destructor;if not isnull(pl_stdout_handle) then
	pef_free_console()
end if

end event

