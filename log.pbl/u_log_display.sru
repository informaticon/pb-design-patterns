forward
global type u_log_display from userobject
end type
type mle_log from multilineedit within u_log_display
end type
type iu_log_writer_adapter from u_log_writer_adapter within u_log_display
end type
end forward

global type u_log_display from userobject
integer width = 3200
integer height = 1512
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_log mle_log
iu_log_writer_adapter iu_log_writer_adapter
end type
global u_log_display u_log_display

forward prototypes
public subroutine pf_write (string as_message)
end prototypes

public subroutine pf_write (string as_message);mle_log.text += as_message + '~r~n'
end subroutine

on u_log_display.create
this.mle_log=create mle_log
this.iu_log_writer_adapter=create iu_log_writer_adapter
this.Control[]={this.mle_log}
end on

on u_log_display.destroy
destroy(this.mle_log)
destroy(this.iu_log_writer_adapter)
end on

type mle_log from multilineedit within u_log_display
integer width = 3227
integer height = 1516
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fira Code"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.width = parent.width
this.height = parent.height
end event

type iu_log_writer_adapter from u_log_writer_adapter within u_log_display descriptor "pb_nvo" = "true" 
end type

on iu_log_writer_adapter.create
call super::create
end on

on iu_log_writer_adapter.destroy
call super::destroy
end on

event ue_write;call super::ue_write;pf_write(as_message)
end event

