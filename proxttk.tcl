# Copyright (c) 2021 Proxlight <Proxlight02@gmail.com>



package require Tk 8.6

namespace eval ttk::theme::proxttk {

    variable version 1.3
    package provide ttk::theme::proxttk $version
    variable colors
    array set colors {
        -fg             "#000000"
        -bg             "#ffffff"
        -disabledfg     "#737373"
        -disabledbg     "#ffffff"
        -selectfg       "#ffffff"
        -selectbg       "#007fff"
    }

    proc LoadImages {imgdir} {
        variable I
        foreach file [glob -directory $imgdir *.gif] {
            set img [file tail [file rootname $file]]
            set I($img) [image create photo -file $file -format gif]
        }
    }

    LoadImages [file join [file dirname [info script]] proxttk]

    # Settings
    ttk::style theme create proxttk -parent default -settings {
        ttk::style configure . \
            -background $colors(-bg) \
            -foreground $colors(-fg) \
            -troughcolor $colors(-bg) \
            -focuscolor $colors(-selectbg) \
            -selectbackground $colors(-selectbg) \
            -selectforeground $colors(-selectfg) \
            -insertwidth 1 \
            -fieldbackground $colors(-selectbg) \
            -font TkDefaultFont \
            -borderwidth 1 \
            -relief flat

        ttk::style map . -foreground [list disabled $colors(-disabledfg)]

        tk_setPalette background [ttk::style lookup . -background] \
            foreground [ttk::style lookup . -foreground] \
            highlightColor [ttk::style lookup . -focuscolor] \
            selectBackground [ttk::style lookup . -selectbackground] \
            selectForeground [ttk::style lookup . -selectforeground] \
            activeBackground [ttk::style lookup . -selectbackground] \
            activeForeground [ttk::style lookup . -selectforeground]
        
        option add *font [ttk::style lookup . -font]


        # Layouts

        ttk::style layout AccentButton {
            AccentButton.button -children {
                AccentButton.padding -children {
                    AccentButton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TLabelframe {
            Labelframe.border {
                Labelframe.padding -expand 1 -children {
                    Labelframe.label -side right
                }
            }
        }
        
        # Elements
        # AccentButton
        ttk::style configure AccentButton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create AccentButton.button image \
            [list $I(rect-accent) \
            	{selected disabled} $I(rect-accent-hover) \
                disabled $I(rect-accent-hover) \
                selected $I(rect-accent) \
                pressed $I(rect-accent) \
                active $I(rect-accent-hover) \
            ] -border 4 -sticky ewns

        # Entry
        ttk::style element create Entry.field \
            image [list $I(box-basic) \
                {focus hover} $I(box-accent) \
                invalid $I(box-invalid) \
                disabled $I(box-basic) \
                focus $I(box-accent) \
                hover $I(box-hover) \
            ] -border 5 -padding {8} -sticky news

        # Labelframe
        ttk::style element create Labelframe.border image $I(card) \
            -border 5 -padding 4 -sticky news
    }
}
