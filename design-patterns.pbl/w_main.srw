//objectcomments  
forward
global type w_main from window
end type
type cb_send from commandbutton within w_main
end type
type sle_message from singlelineedit within w_main
end type
end forward

global type w_main from window
integer width = 2254
integer height = 340
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_send cb_send
sle_message sle_message
end type
global w_main w_main

type variables

end variables

on w_main.create
this.cb_send=create cb_send
this.sle_message=create sle_message
this.Control[]={this.cb_send,&
this.sle_message}
end on

on w_main.destroy
destroy(this.cb_send)
destroy(this.sle_message)
end on

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

