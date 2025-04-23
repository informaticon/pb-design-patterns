//objectcomments  
forward
global type w_main from window
end type
type iu_log from u_log_display within w_main
end type
type cb_send from commandbutton within w_main
end type
type sle_message from singlelineedit within w_main
end type
end forward

global type w_main from window
integer width = 2267
integer height = 1324
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
iu_log iu_log
cb_send cb_send
sle_message sle_message
end type
global w_main w_main

type variables

end variables

on w_main.create
this.iu_log=create iu_log
this.cb_send=create cb_send
this.sle_message=create sle_message
this.Control[]={this.iu_log,&
this.cb_send,&
this.sle_message}
end on

on w_main.destroy
destroy(this.iu_log)
destroy(this.cb_send)
destroy(this.sle_message)
end on

event open;gf_get_logger().of_set_writer(iu_log.iu_log_writer_adapter)
end event

type sle_message from singlelineedit within w_main
integer x = 27
integer y = 72
integer width = 1710
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "hello world"
borderstyle borderstyle = stylelowered!
end type

type cb_send from commandbutton within w_main
integer x = 1765
integer y = 72
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send"
boolean default = true
end type

event clicked;gf_get_logger().of_log(sle_message.text)
end event

type iu_log from u_log_display within w_main
integer x = 32
integer y = 212
integer width = 2153
integer height = 996
integer taborder = 30
end type

on iu_log.destroy
call u_log_display::destroy
end on

