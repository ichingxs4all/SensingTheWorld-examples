{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 204.0, 125.0, 1240.0, 868.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 187.0, 34.0, 22.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 421.0, 136.5, 41.0, 22.0 ],
					"text" : "notein"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.0, 105.5, 34.0, 22.0 ],
					"text" : "flush"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.0,
					"id" : "obj-16",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 59.0, 216.5, 278.0, 37.0 ],
					"text" : "This packs the MIDI note number and velocity into a list, which is what NOISR wants to see."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 2,
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 69.0, 97.0, 234.0, 39.0 ],
					"text" : "Click to play a note; click again to stop it.",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.0, 210.5, 34.0, 22.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : 48,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 18.0, 136.5, 336.0, 53.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "## Output fader ##",
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-24",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "az.out~.maxpat",
					"numinlets" : 2,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 886.0, 575.0, 71.0, 277.0 ],
					"prototypename" : "pixl",
					"varname" : "out",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "## A simple reverberator ##",
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-9",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "az.reverber8r~.maxpat",
					"numinlets" : 5,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 422.0, 757.0, 189.0, 111.0 ],
					"prototypename" : "pixl",
					"varname" : "reverber8r",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "## A spectral delay effect ##",
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-14",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "az.sdelayr~.maxpat",
					"numinlets" : 6,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 422.0, 575.0, 415.0, 156.0 ],
					"prototypename" : "pixl",
					"varname" : "sdelayr",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "## A filter with resonance ##",
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-11",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "az.rezfiltr~.maxpat",
					"numinlets" : 4,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 422.0, 414.0, 215.0, 143.0 ],
					"prototypename" : "pixl",
					"varname" : "rezfiltr",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "## A polyphonic FM synthesizer ##",
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-25",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "az.fmodr~.maxpat",
					"numinlets" : 13,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 422.0, 230.0, 430.0, 142.0 ],
					"prototypename" : "pixl",
					"varname" : "fmodr",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 1.0, 0.639256198347107, 0.1, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 1,
					"fontsize" : 16.0,
					"hint" : "",
					"id" : "obj-5",
					"ignoreclick" : 1,
					"legacytextcolor" : 1,
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 99.0, 20.0, 20.0 ],
					"rounded" : 60.0,
					"text" : "2",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textovercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"usebgoncolor" : 1,
					"usetextovercolor" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"midpoints" : [ 27.5, 264.0, 408.0, 264.0, 408.0, 225.0, 431.5, 225.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"midpoints" : [ 441.5, 183.0, 445.5, 183.0 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.988235294117647, 0.431372549019608, 0.031372549019608, 1.0 ],
					"destination" : [ "obj-10", 1 ],
					"midpoints" : [ 344.5, 201.0, 42.5, 201.0 ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.989417433738708, 0.429457008838654, 0.031975548714399, 1.0 ],
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 431.5, 879.0, 873.0, 879.0, 873.0, 570.0, 895.5, 570.0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-11::obj-14" : [ "res", "res", 0 ],
			"obj-11::obj-20" : [ "pictctrl[12]", "pictctrl[1]", 0 ],
			"obj-11::obj-23" : [ "filtermode", "filtermode", 0 ],
			"obj-11::obj-4" : [ "pictctrl[13]", "pictctrl[1]", 0 ],
			"obj-11::obj-5" : [ "freq", "freq", 0 ],
			"obj-11::obj-53" : [ "pictctrl", "pictctrl", 0 ],
			"obj-11::obj-7" : [ "onoff", "onoff", 0 ],
			"obj-14::obj-10" : [ "feedback", "feedback", 0 ],
			"obj-14::obj-13" : [ "rotate", "rotate", 0 ],
			"obj-14::obj-18" : [ "multislider", "multislider", 0 ],
			"obj-14::obj-20" : [ "pictctrl[14]", "pictctrl[1]", 0 ],
			"obj-14::obj-37" : [ "pictctrl[15]", "pictctrl[1]", 0 ],
			"obj-14::obj-40" : [ "maxtime", "maxtime", 0 ],
			"obj-14::obj-43" : [ "pictctrl[16]", "pictctrl[1]", 0 ],
			"obj-14::obj-45" : [ "wetdry", "wetdry", 0 ],
			"obj-14::obj-53" : [ "pictctrl[18]", "pictctrl", 0 ],
			"obj-14::obj-64" : [ "pictctrl[17]", "pictctrl[1]", 0 ],
			"obj-14::obj-7" : [ "onoff[1]", "onoff", 0 ],
			"obj-24::obj-102" : [ "pictctrl[284]", "pictctrl[1]", 0 ],
			"obj-24::obj-16" : [ "output", "output", 0 ],
			"obj-24::obj-86" : [ "textbutton[1]", "textbutton", 0 ],
			"obj-25::obj-102" : [ "pictctrl[8]", "pictctrl[3]", 0 ],
			"obj-25::obj-105" : [ "pictctrl[9]", "pictctrl[3]", 0 ],
			"obj-25::obj-111" : [ "polyphony-menu", "polyphony-menu", 0 ],
			"obj-25::obj-12" : [ "resetpan", "resetpan", 0 ],
			"obj-25::obj-121" : [ "bend", "bend", 0 ],
			"obj-25::obj-122" : [ "pan", "pan", 0 ],
			"obj-25::obj-127" : [ "vib rate", "rate", 0 ],
			"obj-25::obj-128" : [ "vib depth", "depth", 0 ],
			"obj-25::obj-13" : [ "carrier-waveform", "carwav", 0 ],
			"obj-25::obj-16" : [ "release", "R", 0 ],
			"obj-25::obj-21" : [ "modulation-index", "index", 0 ],
			"obj-25::obj-24" : [ "portamento", "port", 0 ],
			"obj-25::obj-265" : [ "pictctrl[40]", "pictctrl[3]", 0 ],
			"obj-25::obj-269" : [ "pictctrl[39]", "pictctrl[3]", 0 ],
			"obj-25::obj-276" : [ "FreqMode[4]", "FreqMode", 0 ],
			"obj-25::obj-278" : [ "textbutton[3]", "textbutton[1]", 0 ],
			"obj-25::obj-32" : [ "resetbend", "resetbend", 0 ],
			"obj-25::obj-33" : [ "pictctrl[1]", "pictctrl[3]", 0 ],
			"obj-25::obj-5" : [ "attack", "A", 0 ],
			"obj-25::obj-51" : [ "polyphony-val", "polyphony-val", 0 ],
			"obj-25::obj-52" : [ "pictctrl[10]", "pictctrl[3]", 0 ],
			"obj-25::obj-58" : [ "modulator-waveform", "modwav", 0 ],
			"obj-25::obj-6" : [ "decay", "D", 0 ],
			"obj-25::obj-63" : [ "pictctrl[2]", "pictctrl[3]", 0 ],
			"obj-25::obj-66" : [ "pictctrl[11]", "pictctrl[3]", 0 ],
			"obj-25::obj-68" : [ "pictctrl[3]", "pictctrl[3]", 0 ],
			"obj-25::obj-75" : [ "harmonicity-float", "harm", 0 ],
			"obj-25::obj-79" : [ "pictctrl[4]", "pictctrl[3]", 0 ],
			"obj-25::obj-8" : [ "sustain", "S", 0 ],
			"obj-25::obj-82" : [ "harmonicity-int", "harm", 0 ],
			"obj-25::obj-83" : [ "integer-harm-mode", "integer-mode", 0 ],
			"obj-25::obj-88" : [ "pictctrl[5]", "pictctrl[3]", 0 ],
			"obj-25::obj-9" : [ "LFOwave", "LFOwave", 0 ],
			"obj-25::obj-96" : [ "pictctrl[6]", "pictctrl[3]", 0 ],
			"obj-25::obj-99" : [ "pictctrl[7]", "pictctrl[3]", 0 ],
			"obj-9::obj-18" : [ "decay[1]", "decay", 0 ],
			"obj-9::obj-20" : [ "pictctrl[19]", "pictctrl[1]", 0 ],
			"obj-9::obj-26" : [ "cutoff", "cutoff", 0 ],
			"obj-9::obj-31" : [ "wetdry[1]", "wetdry", 0 ],
			"obj-9::obj-4" : [ "pictctrl[20]", "pictctrl[1]", 0 ],
			"obj-9::obj-48" : [ "pictctrl[22]", "pictctrl[2]", 0 ],
			"obj-9::obj-5" : [ "size", "size", 0 ],
			"obj-9::obj-53" : [ "pictctrl[21]", "pictctrl", 0 ],
			"obj-9::obj-7" : [ "onoff[2]", "onoff", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-11::obj-20" : 				{
					"parameter_longname" : "pictctrl[12]"
				}
,
				"obj-11::obj-4" : 				{
					"parameter_longname" : "pictctrl[13]"
				}
,
				"obj-14::obj-20" : 				{
					"parameter_longname" : "pictctrl[14]"
				}
,
				"obj-14::obj-37" : 				{
					"parameter_longname" : "pictctrl[15]"
				}
,
				"obj-14::obj-43" : 				{
					"parameter_longname" : "pictctrl[16]"
				}
,
				"obj-14::obj-53" : 				{
					"parameter_longname" : "pictctrl[18]"
				}
,
				"obj-14::obj-64" : 				{
					"parameter_longname" : "pictctrl[17]"
				}
,
				"obj-9::obj-18" : 				{
					"parameter_longname" : "decay[1]"
				}
,
				"obj-9::obj-20" : 				{
					"parameter_longname" : "pictctrl[19]"
				}
,
				"obj-9::obj-31" : 				{
					"parameter_longname" : "wetdry[1]"
				}
,
				"obj-9::obj-4" : 				{
					"parameter_longname" : "pictctrl[20]"
				}
,
				"obj-9::obj-48" : 				{
					"parameter_longname" : "pictctrl[22]"
				}
,
				"obj-9::obj-53" : 				{
					"parameter_longname" : "pictctrl[21]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "M4L.pan1~.maxpat",
				"bootpath" : "C74:/patchers/m4l/Tools resources",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.audio-left-handler.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/utils",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/utils",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.data-handler.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/utils",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/utils",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.fmodr~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.out~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.reverber8r~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.rezfiltr~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sdelayr~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.spectdelay~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "az.sub-fm-monovoice~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-fm-multivoice~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/poly",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/poly",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-fm~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-listconform.js",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/javascript",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-simpleFM~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-wavetables2~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-wavetables~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-xfade~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-yafr2~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sawdown.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sawup.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sine.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-square.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-triangle.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
