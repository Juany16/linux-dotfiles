#!/bin/bash

WAL="$HOME/.cache/wal/colors"
GTK="$HOME/.themes/Pywal/gtk-3.0/gtk.css"

# leer colores
mapfile -t colors < "$WAL"

bg="${colors[0]}"
fg="${colors[7]}"
accent="${colors[5]}"
button="${colors[1]}"
button_hover="${colors[8]}"

cat > "$GTK" <<EOF
/* ===== Colores base ===== */
@define-color bg_color $bg;
@define-color fg_color $fg;
@define-color accent_color $accent;
@define-color button_bg $button;
@define-color button_hover $button_hover;

/* ===== Ventanas ===== */
.view{
    background-color: @bg_color;
    color: @fg_color;
}

.view:selected {
    background-color: @accent_color;
    color: @bg_color;
}

toolbar {
    background-color: @bg_color;
    margin: 0px;
    border-radius: 0px;
}

treeview header button {
    background-color: @button_bg;
    color: @fg_color;
    margin: 0px;
    border-radius: 0px;
    border: 2px solid @button_bg;
}

treeview header button:hover {
    background-color: @button_hover;
    color: @fg_color;
    margin: 0px;
    border-radius: 0px;
    border: 2px solid @button_hover;
}

notebook tab {
    background-color: @bg_color;
    color: @bg_color;
    border-radius: 5px;
    border: 0px solid @accent_color;
    margin: 0px 5px 5px 5px;
    padding: 0px 5px 0px 10px;
}

notebook tab label {
    color: @fg_color;
}

notebook tab:checked label {
    color: @bg_color;
}

notebook tab:checked {
    background-color: @accent_color;
    color: @bg_color;
}

notebook tab:hover {
    background-color: @button_hover;
    border: 0px solid @button_hover;
}

notebook tab:hover label {
    color: @bg_color;
}

notebook header {
    background-color: @bg_color;
    color: @bg_color;
    border-bottom: 1px solid @bg_color;
}

notebook button {
    background-color: @accent_color;
    border: 2px solid @accent_color;
}

notebook button:hover {
    background-color: @button_bg;
    border: 2px solid @button_bg;
}

paned > separator {
    background-color: @bg_color;
}

/* ===== Texto ===== */
label {
    color: @fg_color;
}

/* ===== Entradas de texto ===== */
entry {
    background-color: @bg_color;
    color: @fg_color;
    border-radius: 5px;
    border: 2px solid @fg_color;
    margin: 5px 5px 5px 5px;
    padding: 6px;
}

/* ===== Botones ===== */
button {
    background-color: @button_bg;
    color: @bg_color;
    border-radius: 5px;
    border: 1px solid @button_bg;
    padding: 4px 8px;
    margin: 5px 5px 5px 5px;
}

button label {
  color: @bg_color;
}

button:hover {
    background-color: @button_hover;
    border: 1px solid @button_hover;
}

button:active {
    background-color: @bg_color;
    color: @fg_color;
}

/* ===== Selección / acento ===== */
selection {
    background-color: @accent_color;
    color: @bg_color;
}

menu {
    background-color: @bg_color;
    color: @fg_color;
    border: 1px solid @accent_color;
    margin: 8px;
    padding: 8px;
}

menubar {
    background-color: @bg_color;
    color: @fg_color;
}

menubar > menuitem {
    padding: 6px 12px;
    color: @fg_color;
}

menubar > menuitem:hover {
    background-color: @accent_color;
    color: @fg_color;
}

menuitem:hover {
    background-color: @accent_color;
    color: @bg_color;
}

menuitem:hover label {
    color: @fg_color;
}

separator {
    background-color: @fg_color;
}

statusbar {
    background-color: @bg_color;
    color: @fg_color;
    border-radius: 5px;
}

dialog {
    background-color: @bg_color;
}

checkbutton check {
    background-color: @button_bg;
    color: @bg_color;
    border: 2px solid @button_bg;
    border-radius: 5px;
}

checkbutton check:checked {
    background-color: @accent_color;
    border-color: @accent_color;
    border-radius: 5px;
}

checkbutton check:hover {
    background-color: @accent_color;
    border-color: @accent_color;
    border-radius: 5px;
}

checkbutton label {
    padding: 6px;
}

radiobutton radio {
    background-color: @button_bg;
    color: @bg_color;
    border: 2px solid @button_bg;
    border-radius: 100%;
}

radiobutton radio:checked {
    background-color: @accent_color;
    border-color: @accent_color;
}

radiobutton radio:hover {
    background-color: @accent_color;
    border-color: @accent_color;
}

radiobutton label {
    padding: 6px;
}

placessidebar {
    background-color: @bg_color;
    color: @fg_color;
}

placessidebar row {
    padding: 5px 5px 0px 0px;
}

placessidebar row image {
    margin: 8px;
}

tooltip {
    background-color: @bg_color;
    color: @fg_color;
    border-radius: 6px;
    border: 1px solid @bg_color;
}
EOF
