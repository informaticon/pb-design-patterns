//objectcomments Generated Application Object
forward
global type design-patterns from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
u_logger gu_logger
u_exf_error_manager gu_e
end variables

global type design-patterns from application
string appname = "design-patterns"

string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 25.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "25.0.0.3674"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global design-patterns design-patterns

type prototypes
protected subroutine gef_exit_process( &
	ulong uexitcode &
) library 'kernel32.dll' alias for 'ExitProcess'

end prototypes

type variables

end variables

on design-patterns.create
appname="design-patterns"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on design-patterns.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gu_e = create u_exf_error_manager
gu_logger = create u_logger
gu_logger.of_set_output(u_logger.CL_OUTPUT_TYPE_FILE)

open(w_main)
end event

event close;if handle(getapplication()) > 0 then
   gef_exit_process(0)
end if
end event

event systemerror;gu_e.of_display(gu_e.of_new_error() &
	.of_set_nested_error(gu_e.of_get_last_error()) &
	.of_push(1 /*populateerror()-Return*/) &
	.of_set_message('systemerror occured') &
	.of_push('Hinweis', 'Achtung: eventuell eingebettete Exceptions müssen nicht zwingend etwas mit diesem Fehler zu tun haben.') &
	.of_set_type('u_exf_re_systemerror') &
)
end event

