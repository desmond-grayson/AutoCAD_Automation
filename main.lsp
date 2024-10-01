; ================================================================================================
; ============ Personal Preferences for workspace ================================================
; ================================================================================================

(setvar "cmdecho" 0)         ; suppresses dialouge boxes within commandline
(setvar "acadlspasdoc" 0)    ; controls how ACAD will load the lisp file
(setvar "layerevalctl" 0)    ; disables evaluation and notification of new layers
(setvar "ltscale" 0.375)     ; sets line type scale
(setvar "celtscale" 1)       ; sets object lintype scaling factor
(setvar "msltscale" 1)       ; model space linetypes scaled by annotation type
(setvar "defaultgizmo" 3)    ; disables gizmo when object selected in 3d visual mode
(setvar "refpathtype" 2)     ; full file path names by default
(setvar "dimadec" 0)         ; disables decimils when displaying angluar dimensions (independant of dimdec)
(setvar "pdmode" 3)          ; controls how point objects are displayed 
(setvar "constraintinfer" 0) ; this causes unintended line stickage if enabled
(setvar "gridmode" 0)        ; disables background grid
(setvar "angdir" 1)          ; clockwise rotational values

(command "commandlinehide")
;(command "commandline")

; Ensure these layers exist within all documents opened
(command "-layer" "m" "lines" "c" "230" "lines" "lt" "continuous" "" "")          ; 111 Lines Layer
(command "-layer" "m" "deets" "c" "2" "deets" "lt" "continuous" "" "")            ; 222 Deets Layer
(command "-layer" "m" "green" "c" "3" "green" "lt" "continuous" "" "")            ; 333 Green Layer
(command "-layer" "m" "tops" "c" "4" "tops" "lt" "continuous" "" "")              ; 444 Tops Layer
(command "-layer" "m" "wall" "c" "150" "wall" "lt" "continuous" "" "")            ; 555 Wall Layer
(command "-layer" "m" "splash" "c" "30" "splash" "lt" "continuous" "" "")         ; 666 Special Layer
(command "-layer" "m" "cases" "c" "7" "cases" "lt" "continuous" "" "")            ; 777 Cases Layer
(command "-layer" "m" "hidden" "c" "8" "hidden" "lt" "hidden" "" "")              ; 888 Hidden Layer
(command "-layer" "m" "phantom" "c" "230" "phantom" "lt" "phantom2" "phantom" "") ; 999 Phantom Layer
(command "-layer" "m" "defpoints" "c" "7" "defpoints" "lt" "continuous" "" "")    ; ``` Defpoints Layer
(command "-layer" "m" "glass" "c" "111" "glass" "lt" "continuous" "" "")          ; ggg Glass Layer
(command "-layer" "m" "dim" "c" "3" "dim" "lt" "continuous" "" "")                ; ddd Dim Layer
(command "-layer" "m" "hatch" "c" "11" "hatch" "lt" "continuous" "" "")           ; hhh Hatch Layer
(command "-layer" "m" "defdrawing" "c" "10" "defdrawing" "lt" "continuous" "" "") ; my xline hatches


; ================================================================================================
; ============ General Commands && Utilities =====================================================
; ================================================================================================


(defun c:d () ; dimension , use command aliases in autocad to associate this
	(command "-layer" "set" "dim" "")
  (command "dimlinear" pause pause pause))

(defun c:dv () ; divide, one handed shortcut. note - overwrites builtin dv(iew) shortcut
  (command "divide"))

(defun c:eng () ; Sets dims to decimal output plus metric
	(command "dimunit" 2)
	(command "dimdec" 4)
	(command "dimtih" "off")
	(command "dimalt" 1)
	(command "dimfrac" 2)
	(command "dimzin" 12)
	(command "dim" "update"))

(defun c:drft () ; Sets dims to fractional output
	(command "dimunit" 5)
	(command "dimdec" 6)
	(command "dimtih" "on")
	(command "dimalt" 0)
	(command "dimfrac" 2)
	(command "dim" "update"))

(defun c:f` () ; remove arc from lines
  (command "fillet" "r" 0)
  (command "fillet"))

(defun c:f`1 () ; fillet 0.0625" rad
  (command "fillet" "r" 0.0625)
  (command "fillet"))

(defun c:f125 () ; fillet 0.125" rad
	(command "fillet" "r" 0.125)
  (command "fillet"))

(defun c:f25 () ; fillet 0.25" rad
	(command "fillet" "r" 0.25)
  (command "fillet"))

(defun c:f5 () ; fillet 0.5" rad
	(command "fillet" "r" 0.5)
  (command "fillet"))

(defun c:f75 () ; fillet 0.75" rad
	(command "fillet" "r" 0.75)
  (command "fillet"))

(defun c:f1 () ; fillet 1" rad
	(command "fillet" "r" 1)
  (command "fillet"))

(defun c:f15 () ; fillet 1.5" rad
	(command "fillet" "r" 1.5)
  (command "fillet"))

(defun c:f2 () ; fillet 2" rad
	(command "fillet" "r" 2)
  (command "fillet"))

(defun c:cpt () ; copy current layout
	(command "layout" "_c" "" ""))

(defun c:ctd () ; delete current layout
	(command "layout" "_d" ""))

(defun c:drwf () ; bring to front
	(command "draworder" "front"))

(defun c:drwb () ; bring to back
	(command "draworder" "back"))

(defun c:drwa () ; bring above
	(command "draworder" "above"))

(defun c:drwu () ; bring under
	(command "draworder" "under"))

(defun c:fr23 () ; freeze typical layers
	(command "-layer" "freeze" "2d_item" "f" "2d_text" "f" "3d_item" "f" "3d_product" "f" "2d_dim" "f" "2d_dim" "f" "2d_hatch" "f" "2d_division" ""))

(defun c:th23 () ; thaw typical layers
	(command "-layer" "thaw" "2d_item" "f" "2d_text" "f" "3d_item" "f" "3d_product" "f" "2d_dim" "f" "2d_dim" "f" "2d_hatch" "f" "2d_division" ""))

(defun c:deseqq () ; apply personal settings to drafting drawing
  (c:fr23)
	(command "wipeoutframe" "2")
	(c:sty3-8)
	(c:destemplate))

(defun c:desegg () ; apply personal settings to new drawing
	(c:fr23)
	(command "wipeoutframe" "2")
	(c:sty1-2)
  (c:destemplate)
  (while t;rue
      (c:xx)))

(defun c:destemplate () ; my engineering template
	(command "layout" "_t" "00_Desmond_Test_Room.dwt" "000" ""))

(defun c:bmask (/ ss1 num cnt obj ent) ; background mask text
	(setq ss1 (ssget '((0 . "MULTILEADER,MTEXT")))
		num (sslength ss1)
		cnt 0)
	  (repeat num
	(setq obj (vlax-ename->vla-object (ssname ss1 cnt)))
	(setq nam (vlax-get-property obj 'objectname))
	(if(= nam "AcDbMText")
	 (progn
		  (if(= (vlax-get-property obj 'BackgroundFill):vlax-false)	(progn(vlax-put-property obj 'BackgroundFill :vlax-true)))))
	(if(= nam "AcDbMLeader")
		(progn
		  (if(= (vlax-get-property obj 'TextBackgroundFill):VLAX-FALSE)
			(progn
			(vlax-put-property obj 'TextBackgroundFill "-1")))))
	(setq cnt (1+ cnt))); repeat
	(vl-cmdf "_draworder" ss1 "" "f")
		(princ))

(defun c:dimbmask (/ CNT ENT ENTDATA NEWENTDATA NUM SS1) ; backfill dimensions
  (vl-load-com)
  (setq	ss1 (ssget '((0 . "Dimension")))
	num (sslength ss1)
	cnt 0)
  (repeat num
    (setq ent (entget (ssname ss1 cnt)))
    (setq entdata '((-3 ("ACAD" (1000 . "DSTYLE") (1002 . "{") (1070 . 69) (1070 . 1) (1002 . "}")))))
    (setq newentdata (append ent entdata))
    (entmod newentdata)
    (setq cnt (1+ cnt)))
  (vl-cmdf "_draworder" ss1 "" "f"))

(defun c:dimbackfill () ; toggle default backfill of dimensions
	(setq cl (getvar "dimtfill"))
	(if 1
		(command "dimtfill" "0"))
	(if 0
		(command "dimtfill" "1")))

(defun c:desdrafttemplate () ; personal drafting template
	(command "layout" "_t" "00_desmond_drafting_template.dwt" "x_x_x" ""))

(defun c:viewtop () ; reset view to top down view
	(command-s "-view" "_top"))

(defun c:zoomout () ; zoom out to full view
	(command "zoom" "a"))

(defun c:snapreset () ; snap reset my preferences
	(command "osmode" "14847"))

(defun c:snapmid () ; snap only to midpoints
	(command "osmode" "2"))

(defun c:snapcircle () ; snap only to center of circle
  (command "osmode" "4"))

(defun c:sm () ; set to current dimstyle by picking an object on desired dimstyle.
	(prompt "\select desired dimstyle...")
	(command "-dimstyle" "_r" "")
	(princ))

(defun c:byobomb () ; optimize drawing data
	(command "-purge" "blocks" "*" "n") ; purge all blocks within drawing
	(command "-audit" "y")
	(princ))

(defun c:aqq () ; appload onehanded shortcut
	(command "appload"))

(defun c:+9 () ; draw infinite line vertical phantom layer
  (command "-layer" "set" "defdrawing" "")
  (command "xline" "v"))

(defun c:-9 () ; draw infinite line horizontal phantom layer
  (command "-layer" "set" "defdrawing" "")
  (command "xline" "h"))

(defun c:cxz () ; one handed shortcut for enabling commandline
  (command "commandline"))

(defun c:woff () ; offset used for wall default thickness
  (command "offset" "5"))

(defun c:ucsreset () ; resets ucs to default
  (command "ucs" "w"))

(defun c:ccc () ; one hand shortcut for closing current tab
  (command "close"))

(defun usercancel () ; utility meant to cancel out of partial lisp functions
  (command)
  (command))


; ================================================================================================
; ============ Hatching ==========================================================================
; ================================================================================================


(defun defaultHatch ()
  ; Previous hatch commands assumed certain settings were enabled. Special hatches may interfere with this.
  ; TODO: properly reset hatching to defaul on all hatches when there's available time
	(command "-layer" "set" "hatch" "") ; will use current layer for color set later, set color last to avoid issues
  (command "-hatch" "p" "line" "" "") ; while this could be completed in less lines, my hope is that multiple lines may make future debugging simpler
  (usercancel) ; after settings are reset we're left waiting for user input, cancel that & resume
  (command "-hatch" "t" 0)
  (usercancel)
  (command "-hatch" "a" "i" "y" "a" "y" "")
  (usercancel)
  (command "-hatch" "co" "." ".") ; ensure a non-solid hatch is chosen so we can change background colorbugs
  (usercancel))

(defun c:ct0 () ; hatch walls
	(command "-layer" "set" "hatch" "")
  (command "-hatch" "p" "line" 12 45 pause ""))

(defun c:pl0 () ; hatch plywood horizontal
	(command "-layer" "set" "hatch" "")
  (command "-hatch" "p" "cork" 2 0 pause ""))

(defun c:pl9 () ; hatch plywood vertical
	(command "-layer" "set" "hatch" "")
  (command"-hatch" "p" "cork" 2 90 pause ""))

(defun c:tb0 () ; hatch tackboard
	(command "-layer" "set" "hatch" "")
  (command "-hatch" "p" "ar-sand" 2.5 0 pause ""))

(defun c:ss0 () ; hatch solid surface stone
	(command "-layer" "set" "hatch" "")
  (command "-hatch" "p" "ar-conc" ".125" "0" pause ""))

(defun c:hl0 () ; yellow highlight hatching
	(command "-layer" "set" "hatch" ""),
	(command "-hatch" "p" "solid" "t" 90 "dr" "b" "a" "s" "i" "a" "y" "" "co" 51 51)
	(usercancel) ; sometime the background color causes issues, this is a failsafe to prevent it crashing things
	(command "-hatch" pause "")
	(defaultHatch))


; ================================================================================================
; ============ Blocks ============================================================================
; ================================================================================================


(defun c:xx () ; cross off
	(command "osnap" "int,end,perp,quad,mid,cen,node")
  (command "-insert" "trick/xx" pause pause "" 0))

(defun c:brkt () ; block elevation view brackets
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_brktElev.dwg" pause "" "" "")
  (command "explode" "last")
	(command "-layer" "set" "dim" "")
  (command "qleader" "near" pause pause "" "IN-WALL" "BRACKET TYP" ""))

(defun c:brktt () ; block plan view bracket
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_brktPlanview.dwg" pause "" "" pause)
  (command "explode" "last")
  (command "move" "last" "" pause pause))

(defun c:brktl () ; block section view bracket
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_brktSectionLeft.dwg" pause "" "" 0)
  (command "explode" "last"))

(defun c:cv1 () ; block ceiling height callout aff
	(setq ds (getvar "dimscale"))
	(command "attdia" "1")
	(command "-layer" "set" "dim" "")
  (command "-insert" "elev vif" pause ds ds 0))

(defun c:graindes () ; block grain bug
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "grain_bug.dwg" pause ds ds pause)
	(command "-layer" "set" cl ""))

(defun c:fe () ; text insert finished end fe
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "annotations/fe" pause ds ds 0)
  (command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:plu () ; block plumbing
	(command "attdia" "0")
	(command "-layer" "set" "deets" "")
  (command "-insert" "blocks/des_dynamicPLU.dwg" pause "" "" pause)
  (command "explode" "last")
  (command "move" "last" "" pause pause))

(defun c:wmi () ; block text white melamine
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "annotations/white melamine interior tag" pause ds ds 0)
  (command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:bmi () ; block text black melamine
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "annotations/black melamine interior tag" pause ds ds 0)
  (ccommand "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:2rl () ; block radius left countertop
	(command "-insert" "trick/2rl" "end" pause "1" "" "" pause))

(defun c:2rr () ; block radius right countertop
	(command "-insert" "trick/2rr" "end" pause "1" "" "" pause))

(defun c:1rl () ; block radius left countertop
	(command "-insert" "trick/1rl" "end" pause "1" "" "" pause))

(defun c:1rr () ; block radius right countertop
	(command "-insert" "trick/1rr" "end" pause "" "" 0))

(defun c:acs () ; block textbox available clear space
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "misc/available clear space" pause ds ds 0)
  (command "explode" "last"))

(defun c:drain () ; block drain pipe section view
	(command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/drain line/sink drain" pause "" "" 0)
	(command "explode" "last")
	(command "stretch"))

(defun c:trash () ; block trash can elevation section
	(command "-layer" "set" "deets" "")
  (command "-insert" "trash/trash - dynamic" pause "" "" 0)
	(command "explode" "last")
	(command "stretch"))

(defun c:pps() ; Please provide sink model bug
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-insert" "pps" pause "" "" 0)
	(command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:e1 () ; Elevation / Plan / Section bug label
	(setq ds (getvar "dimscale"))
	(command "attdia" "1")
	(command "-layer" "set" "deets" "")
  (command "-insert" "elev1" pause ds ds 0))

(defun c:vr () ; callout box
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "vrboxcentered" pause ds ds 0)
	(command "explode" "last"))

(defun c:eqp () ; callout equipment
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "blocks/eqp list.dwg" pause ds ds 0)
  (command "explode" "last"))

(defun c:ppl () ; callout please provide plastic laminate plam
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "misc/plamnote" pause ds ds 0)
  (command "explode" "last"))

(defun c:opn () ; bug for open openings
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "opn_bug_des.dwg" pause ds ds 0)
	(command "-layer" "set" cl ""))

(defun c:glass () ; Add glass-glare decroative bug
  (insertColorBug "des_glass bug.dwg"))

(defun c:earr () ; block elevation arrow 
	(command "attdia" "0")
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "elev_arrow_des.dwg" pause ds ds 0)
	(command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:numboxd () ; block product number box
	(command "attdia" "0")
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "product_numbox_des.dwg" pause ds ds 0)
	(command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:rguide () ; block routing guide for 2d part editting
  (command "attdia" "0")
	(command "-layer" "set" "0" "")
  (command "-insert" "desmond_route_in_out_guide.dwg" pause "" "" 0))

(defun c:hingedes () ; block section view hinges
	(command "attdia" "0")
	(command "-layer" "set" "deets" "")
  (c:snapcircle)
  (command "-insert" "hinge_section_desmond.dwg" pause "" "" 0)
  (c:snapreset)
  (command "explode" "last"))

(defun c:keku () ; block keku clip
	(command "attdia" "0")
	(command "-layer" "set" "deets" "")
  (c:snapcircle)
  (command "-insert" "des_kekuclip.dwg" pause "" "" 0)
  (c:snapreset)
  (command "explode" "last"))

(defun c:5khngdes () ; block section view hinges
	(command "attdia" "0")
	(command "-layer" "set" "deets" "")
  (c:snapcircle)
  (command "-insert" "des_5kHinge.dwg" pause "" "" 0)
  (c:snapreset)
  (command "explode" "last"))

(defun c:doorpdes () ; block door swing plan view
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "door_plan_desmond.dwg" pause "" "" 0)
	(command "explode" "last")
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "ADA CLR" ""))

(defun c:dooredes () ; block door elevation view
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "door_elev_desmond.dwg" pause "" "" 0)
	(command "explode" "last"))

(defun c:windowpdes () ; block plan view window
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "window_plan_desmond.dwg" pause "" "" 0)
	(command "explode" "last"))

(defun c:breakdes () ; block break at 5"
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "breakline_desmond.dwg" pause "" "" pause)
  (command "explode" "last"))

(defun c:brkhorz () ; block break no legs horizontal
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "breakline_horz_part.dwg" pause "" "" pause)
	(command "explode" "last"))

(defun c:brkvert () ; block break no legs vertical
	(command "attdia" "0")
	(command "-layer" "set" "wall" "")
  (command "-insert" "breakline_vert_part.dwg" pause "" "" pause)
	(command "explode" "last"))

(defun c:adan () ; block textbox 28 ada clear note
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "annotations/28 ada note" pause ds ds 0))

(defun c:plums () ; block textbox plam undermount sink note
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "misc/plam undermount sink note" pause ds ds 0)
	(command "explode" "last"))

(defun c:s1p () ; block generic sink plan drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink14x14" pause "" "" pause))

(defun c:s1e () ; block generic sink elev drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink14frnt" pause "" "" 0))

(defun c:s2p () ; block generic sink plan drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink24plan" pause "" "" pause))

(defun c:s2e () ; block generic sink elev drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink24" pause "" "" 0))

(defun c:s3p () ; block generic sink plan drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink30plan" pause "" 0))

(defun c:s3e () ; block generic sink elev drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sink30side" pause "" "" 0))

(defun c:s4p () ; block generic sink plan drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sinklavp" pause "" "" 0))

(defun c:s4e () ; block generic sink elev drop in
  (command "-layer" "set" "deets" "")
  (command "-insert" "plumbing/sink/sinklav" pause "" "" 0))

(defun c:alrt () ; block alignment bug
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" "blocks/des_alignbug.dwg" pause ds ds pause)
  (command "explode" "last"))

(defun c:lkb () ; lockgroup label elevation view
  (command "-layer" "set" "dim" "")
  (command "-insert" "annotations/lockgroup" pause "" "" ""))

(defun c:tjb () ; tightjoint bolts plan view
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_tightbolts.dwg" pause "" "" pause))

(defun c:pbp () ; pocketbore plan view, dynamic block
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_pocketbore planview.dwg" pause "" "" pause))

(defun c:ftp () ; gooseneck faucet plan view
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_faucet plan view.dwg" pause "" "" pause))

(defun c:fte () ; gooseneck faucet elevation view
	(command "-layer" "set" "deets" "")
  (command "-insert" "des_faucet elev view.dwg" pause "" "" 0))

(defun c:out2 () ; electrical outlet 2 port elevation view
  (command "-insert" "electrical/outlet2" pause "" "" 0))

(defun c:out4 () ; electrical outlet 4 port elevation view
  (command "-insert" "electrical/outlet4" pause "" "" 0))

(defun c:dat2 () ; data outlet 2 port elevation view
  (command "-insert" "electrical/data out" pause "" "" 0))

(defun c:dat4 () ; data outlet 4 port elevation view
  (command "-insert" "electrical/data out 4" pause "" "" 0))

(defun c:335 () ; CT to 33.5" AFF for ADA drop in sink
  (setq ds (getvar "dimscale"))
  (command "-layer" "set" "dim" "")
  (command "-insert" "blocks/335sinknote.dwg" pause ds ds 0)
  (command "explode" "last"))

(defun c:clt () ; Centerline tag
  (command "-layer" "set" "dim" "")
  (setq ds (getvar "dimscale"))
  (command "-insert" "trick/cltag" pause ds ds 0))

(defun c:sbd () ; Section Bug Dynamic
  (command "-layer" "set" "dim" "")
  (setq ds (getvar "dimscale"))
  (command "-insert" "blocks/des_sbd.dwg" pause ds ds 0)
  (command "explode" "last"))

(defun c:faae () ; block faucet elevation view
  (command "-layer" "set" "deets" "")
  (command "-insert" "blocks/des_faucetElev.dwg" pause 1 1 0)
  (command "explode" "last"))

(defun c:faaf () ; block faucet plan view
  (command "-layer" "set" "deets" "")
  (command "-insert" "blocks/des_faucetPlan.dwg" pause 1 1 pause)
  (command "explode" "last"))

(defun c:mag () ; block magcatch
  (command "-layer" "set" "deets" "")
  (command "-insert" "des_magcatch.dwg" pause 1 1 0)
  (command "explode" "last"))


; ================================================================================================
; ============ Views & Dimstyles =================================================================
; ================================================================================================


(defun c:sty1-8()
	(command "-dimstyle" "r" "1-8"))

(defun c:sty3-16()
	(command "-dimstyle" "r" "3-16"))

(defun c:sty1-4()
	(command "-dimstyle" "r" "1-4"))

(defun c:sty3-8()
	(command "-dimstyle" "r" "3-8"))

(defun c:sty3-8dat()
	(command "-dimstyle" "r" "3-8 DATUM"))

(defun c:sty1-2()
	(command "-dimstyle" "r" "1-2"))

(defun c:sty3-4()
	(command "-dimstyle" "r" "3-4"))

(defun c:sty1()
	(command "-dimstyle" "r" "1"))

(defun c:sty1-1-2()
	(command "-dimstyle" "r" "1 1-2"))

(defun c:sty2()
	(command "-dimstyle" "r" "2"))

(defun c:sty3()
	(command "-dimstyle" "r" "3"))

(defun c:sty6()
	(command "-dimstyle" "r" "6"))

(defun c:sty12()
	(command "-dimstyle" "r" "12"))

(defun c:z96 () ; .125"
	(command "zoom" "s" "1/96xp"))

(defun c:z72 ()
	(command "zoom" "s" "1/72xp"))

(defun c:z64 () ; .1875"
	(command "zoom" "s" "1/64xp"))

(defun c:z48 () ; .25"
	(command "zoom" "s" "1/48xp"))

(defun c:z32 () ; .375"
	(command "zoom" "s" "1/32xp"))

(defun c:z24 () ; .5"
	(command "zoom" "s" "1/24xp"))

(defun c:z16 () ; .75"
	(command "zoom" "s" "1/16xp"))

(defun c:z12 () ; 1"
	(command "zoom" "s" "1/12xp"))

(defun c:z8 () ; 1.5"
	(command "zoom" "s" "1/8xp"))

(defun c:z6 () ; 2
	(command "zoom" "s" "1/6xp"))

(defun c:z4 () ; 3
	(command "zoom" "s" "1/4xp"))

(defun c:z2 () ; 6
	(command "zoom" "s" "1/2xp"))

(defun c:z1 () ; 12
	(command "zoom" "1xp"))


; ================================================================================================
; ============ Dimension Modifiers ===============================================================
; ================================================================================================


(defun c:ed1 ()
	(command "dimedit" "n" "<>"))

(defun c:edm ()
	(command "dimedit" "n" "<> MIN"))

(defun c:edmm ()
	(command "dimedit" "n" "<>\nMIN"))

(defun c:edg ()
	(command "dimedit" "n" "<> GAP"))

(defun c:edgg ()
	(command "dimedit" "n" "<>\nGAP"))

(defun c:ede ()
	(command "dimedit" "n" "<> EQ"))

(defun c:edee ()
	(command "dimedit" "n" "<>\nEQ"))

(defun c:edleg ()
	(command "dimedit" "n" "<> LEG"))

(defun c:edlegg ()
	(command "dimedit" "n" "<>\nLEG"))

(defun c:edk ()
	(command "dimedit" "n" "<> KICK"))

(defun c:eddeck ()
	(command "dimedit" "n" "<> DECK"))

(defun c:eddeckk ()
	(command "dimedit" "n" "<>\nDECK"))

(defun c:edsub ()
	(command "dimedit" "n" "<> SUBTOP"))

(defun c:edsubb ()
	(command "dimedit" "n" "<>\nSUB\nTOP"))

(defun c:edsof ()
	(command "dimedit" "n" "<> SOFFIT"))

(defun c:edsoff ()
	(command "dimedit" "n" "<>\nSOFFIT"))

(defun c:edsv () 
  (command "dimedit" "n" "<> VIF SOFFIT"))

(defun c:edsvv ()
  (command "dimedit" "n" "<>\nVIF\nSOFFIT"))

(defun c:edov ()
	(command "dimedit" "n" "<> OVERALL"))

(defun c:edovv ()
	(command "dimedit" "n" "<>\nOVER\nALL"))

(defun c:edtyp ()
	(command "dimedit" "n" "<> TYP."))

(defun c:edtypp ()
	(command "dimedit" "n" "<>\nTYP."))

(defun c:edshelf ()
	(command "dimedit" "n" "<> SHELVES"))

(defun c:edshelff ()
	(command "dimedit" "n" "<>\nSHELVES"))

(defun c:edapron ()
	(command "dimedit" "n" "<> APRON"))

(defun c:edapronn ()
	(command "dimedit" "n" "<>\nAPRON"))

(defun c:edt ()
	(command "dimedit" "n" "<> TOP"))

(defun c:edtt ()
	(command "dimedit" "n" "<>\nTOP"))

(defun c:edv ()
	(command "dimedit" "n" "<> VIF"))

(defun c:edvv ()
	(command "dimedit" "n" "<>\nVIF"))

(defun c:edc ()
	(command "dimedit" "n" "<> CLR"))

(defun c:edcc ()
	(command "dimedit" "n" "<>\nCLR"))

(defun c:eds ()
	(command "dimedit" "n" "<> SCRIBE"))

(defun c:edws ()
	(command "dimedit" "n" "<>\nWINDOW\nSILL"))


; ================================================================================================
; ============ Leaders ===========================================================================
; ================================================================================================


(defun c:rbt () ; leader rubber base
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "BASE BY OTHERS," "AS SCHEDULED" ""))

(defun c:pbt () ; leader plam base
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "PLAM TOE\nBASE" ""))

(defun c:bst () ; leader typical base cabinets
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "24 DEEP" "BASE" "CABINETS" ""))

(defun c:ut () ; leader typical upper cabinets
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "14 DEEP" "UPPER" "CABINETS" ""))

(defun c:cst () ; leader typical countertop
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "25-1/4 DEEP" "COUNTERTOP" ""))

(defun c:pst () ; leader soffit
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "SOFFIT" ""))

(defun c:flst () ; leader flush soffit
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "FLUSH" "SOFFIT" ""))

(defun c:ast () ; adjustable shelf
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "ADJ. SHELF" "")):was

(defun c:astt () ; adjustable shelf stacked
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "ADJ.\nSHELF" ""))

(defun c:lv () ; light valance & callout standard 3 inch
	(command "osnap" "int,end,mid")
  (command "-layer" "set" "hidden" "")
  (command "line" pause pause "")
  (command "-layer" "set" "dim" "")
  (command "move" "l" "" "0,0" "0,3")
  (command "qleader" pause pause "" "3 LIGHT" "VALANCE" ""))

(defun c:lkt () ; leader lock
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "LOCK, TYP." ""))

(defun c:fb () ; leader finished bottom
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "FB" ""))

(defun c:iwt () ; leader in wall bracket
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "IN-WALL" "SUPPORT" ""))

(defun c:4scs () ; leader smartclip splash
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "4 SMARTCLIP" "SPLASH" ""))

(defun c:4is () ; leader integral splash
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "4 INTEGRAL" "SPLASH" ""))

(defun c:4st () ; leader typical topset splash
	(command "-layer" "set" "dim" "")
  (command "qleader" pause pause "" "4 TOPSET" "SPLASH" ""))


; ================================================================================================
; ============ Color Bugs ========================================================================
; ================================================================================================


(defun insertColorBug (filepath) ; function insert color bug
	(command "attdia" "0")
	(setq cl (getvar "clayer"))
	(setq ds (getvar "dimscale"))
	(command "-layer" "set" "dim" "")
  (command "-insert" filepath pause ds ds "")
  (command "explode" "last")
	(command "-layer" "set" cl ""))

(defun c:/0 () ; plam blank
	(insertColorBug "colorbugs/colorbug_des_0.dwg"))

(defun c:/1 () ; plam 1
	(insertColorBug "colorbugs/colorbug_des_1.dwg"))

(defun c:/2 ()
	(insertColorBug "colorbugs/colorbug_des_2.dwg"))

(defun c:/3 ()
	(insertColorBug "colorbugs/colorbug_des_3.dwg"))

(defun c:/4 ()
	(insertColorBug "colorbugs/colorbug_des_4.dwg"))

(defun c:/5 ()
	(insertColorBug "colorbugs/colorbug_des_5.dwg"))

(defun c:/6 ()
	(insertColorBug "colorbugs/colorbug_des_6.dwg"))

(defun c:/7 ()
	(insertColorBug "colorbugs/colorbug_des_7.dwg"))

(defun c:/8 ()
	(insertColorBug "colorbugs/colorbug_des_8.dwg"))

(defun c:/9 ()
	(insertColorBug "colorbugs/colorbug_des_9.dwg"))

(defun c:/10 ()
	(insertColorBug "colorbugs/colorbug_des_10.dwg"))

(defun c://0 ()
	(insertColorBug "colorbugs/colorbug_des_ss0.dwg"))

(defun c://1 ()
	(insertColorBug "colorbugs/colorbug_des_ss1.dwg"))

(defun c://2 () 
	(insertColorBug "colorbugs/colorbug_des_ss2.dwg"))

(defun c://3 () 
	(insertColorBug "COLOR BUGS/-SS3"))

(defun c://4 () 
	(insertColorBug "COLOR BUGS/-SS4"))

(defun c://5 () 
	(insertColorBug "COLOR BUGS/-SS5"))

(defun c://6 () 
	(insertColorBug "COLOR BUGS/-SS6"))

(defun c:/qtz () 
	(insertColorBug "color bugs/-qt"))


; ================================================================================================
; ============ Layer Changes =====================================================================
; ================================================================================================


(defun ChangeColor (color trueColorValue) ; color change function
  (if (setq p1 (cadr (ssgetfirst)))
      (if (/= color "T")
        (progn (sssetfirst) (command "chprop" p1 "" "C" color ""))
        (progn (sssetfirst) (command "chprop" p1 "" "C" color trueColorValue "")))
      (princ)))

(defun desLayerChange (layerName / sel)
  (if (setq sel (ssget "_:L"))
    (command "_.chprop" sel "" "_la" layerName "")
    (print "\nNo objects found.")))

(defun c:111 () ; solid purple layer
	(desLayerChange "lines"))

(defun c:222 () ; solid yellow layer, hardware
	(desLayerChange "deets"))

(defun c:333 () ; solid green Layer
	(desLayerChange "green"))

(defun c:444 () ; solid light blue layer, countertops
	(desLayerChange "tops"))

(defun c:555 () ; solid blue layer, walls
  (desLayerChange "wall"))

(defun c:666 () ; solid orange layer, special
  (desLayerChange "splash"))

(defun c:777 () ; solid white layer, casework
	(desLayerChange "cases"))

(defun c:888 () ; dashed grey layer, hidden
	(desLayerChange "hidden"))

(defun c:999 () ; dashed purple layer, phantom
	(desLayerChange "phantom"))

(defun c:``` () ; solid invisible layer, defpoints
	(desLayerChange "defpoints"))

(defun c:ggg () ; solid teal layer, glass
	(desLayerChange "glass"))

(defun c:clrred () ; change color to red
  (ChangeColor 1 NULL))

(defun c:clryellow () ; change color to yellow
  (ChangeColor 2 NULL))

(defun c:clrblue () ; change color to blue
  (ChangeColor 5 NULL))

(defun c:clrgreen () ; change color to green
  (ChangeColor 3 NULL))

(defun c:clrblack () ; change color to black
  (ChangeColor "T" "0,0,0"))

(defun c:clreset () ; reset color to by layer
  (ChangeColor "bylayer" NULL))

(defun c:clrvanish () ; change target to defpoints & make match background color
  (c:```)
  (c:clrblack))
