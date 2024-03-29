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
		"rect" : [ 197.0, 107.0, 1214.0, 1187.0 ],
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
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 957.0, 945.0, 37.0, 22.0 ],
					"text" : "serial"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 149.0, 438.0, 110.0, 22.0 ],
					"text" : "scale 36. 38. 30 68"
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
					"patching_rect" : [ 510.0, 486.0, 415.0, 156.0 ],
					"prototypename" : "pixl",
					"varname" : "sdelayr",
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
					"patching_rect" : [ 510.0, 284.0, 430.0, 142.0 ],
					"prototypename" : "pixl",
					"varname" : "fmodr",
					"viewvisibility" : 1
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
					"patching_rect" : [ 510.0, 836.0, 71.0, 277.0 ],
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
					"patching_rect" : [ 510.0, 686.0, 189.0, 111.0 ],
					"prototypename" : "pixl",
					"varname" : "reverber8r",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 250.0, 226.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 149.0, 378.0, 34.0, 22.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-12",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 43.0, 277.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 43.0, 205.0, 61.0, 22.0 ],
					"text" : "change 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 173.0, 136.0, 189.0, 23.0 ],
					"text" : "print receivedmess @popup 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 145.0, 69.0, 22.0 ],
					"text" : "route /temp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 43.0, 82.0, 97.0, 22.0 ],
					"text" : "udpreceive 8000"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-12", 0 ]
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
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 1 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
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
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-14::obj-10" : [ "feedback", "feedback", 0 ],
			"obj-14::obj-13" : [ "rotate", "rotate", 0 ],
			"obj-14::obj-18" : [ "multislider", "multislider", 0 ],
			"obj-14::obj-20" : [ "pictctrl[14]", "pictctrl[1]", 0 ],
			"obj-14::obj-37" : [ "pictctrl[26]", "pictctrl[1]", 0 ],
			"obj-14::obj-40" : [ "maxtime", "maxtime", 0 ],
			"obj-14::obj-43" : [ "pictctrl[42]", "pictctrl[1]", 0 ],
			"obj-14::obj-45" : [ "wetdry[1]", "wetdry", 0 ],
			"obj-14::obj-53" : [ "pictctrl[43]", "pictctrl", 0 ],
			"obj-14::obj-64" : [ "pictctrl[27]", "pictctrl[1]", 0 ],
			"obj-14::obj-7" : [ "onoff[1]", "onoff", 0 ],
			"obj-24::obj-102" : [ "pictctrl[284]", "pictctrl[1]", 0 ],
			"obj-24::obj-16" : [ "output", "output", 0 ],
			"obj-24::obj-86" : [ "textbutton[1]", "textbutton", 0 ],
			"obj-25::obj-102" : [ "pictctrl[8]", "pictctrl[3]", 0 ],
			"obj-25::obj-105" : [ "pictctrl[13]", "pictctrl[3]", 0 ],
			"obj-25::obj-111" : [ "polyphony-menu", "polyphony-menu", 0 ],
			"obj-25::obj-12" : [ "resetpan[1]", "resetpan", 0 ],
			"obj-25::obj-121" : [ "bend", "bend", 0 ],
			"obj-25::obj-122" : [ "pan[1]", "pan", 0 ],
			"obj-25::obj-127" : [ "vib rate[1]", "rate", 0 ],
			"obj-25::obj-128" : [ "vib depth[1]", "depth", 0 ],
			"obj-25::obj-13" : [ "carrier-waveform", "carwav", 0 ],
			"obj-25::obj-16" : [ "release", "R", 0 ],
			"obj-25::obj-21" : [ "modulation-index", "index", 0 ],
			"obj-25::obj-24" : [ "portamento", "port", 0 ],
			"obj-25::obj-265" : [ "pictctrl[18]", "pictctrl[3]", 0 ],
			"obj-25::obj-269" : [ "pictctrl[39]", "pictctrl[3]", 0 ],
			"obj-25::obj-276" : [ "FreqMode[1]", "FreqMode", 0 ],
			"obj-25::obj-278" : [ "textbutton[3]", "textbutton[1]", 0 ],
			"obj-25::obj-32" : [ "resetbend", "resetbend", 0 ],
			"obj-25::obj-33" : [ "pictctrl[23]", "pictctrl[3]", 0 ],
			"obj-25::obj-5" : [ "attack", "A", 0 ],
			"obj-25::obj-51" : [ "polyphony-val", "polyphony-val", 0 ],
			"obj-25::obj-52" : [ "pictctrl[22]", "pictctrl[3]", 0 ],
			"obj-25::obj-58" : [ "modulator-waveform", "modwav", 0 ],
			"obj-25::obj-6" : [ "decay[1]", "D", 0 ],
			"obj-25::obj-63" : [ "pictctrl[24]", "pictctrl[3]", 0 ],
			"obj-25::obj-66" : [ "pictctrl[17]", "pictctrl[3]", 0 ],
			"obj-25::obj-68" : [ "pictctrl[21]", "pictctrl[3]", 0 ],
			"obj-25::obj-75" : [ "harmonicity-float", "harm", 0 ],
			"obj-25::obj-79" : [ "pictctrl[4]", "pictctrl[3]", 0 ],
			"obj-25::obj-8" : [ "sustain", "S", 0 ],
			"obj-25::obj-82" : [ "harmonicity-int", "harm", 0 ],
			"obj-25::obj-83" : [ "integer-harm-mode", "integer-mode", 0 ],
			"obj-25::obj-88" : [ "pictctrl[41]", "pictctrl[3]", 0 ],
			"obj-25::obj-9" : [ "LFOwave[1]", "LFOwave", 0 ],
			"obj-25::obj-96" : [ "pictctrl[6]", "pictctrl[3]", 0 ],
			"obj-25::obj-99" : [ "pictctrl[20]", "pictctrl[3]", 0 ],
			"obj-9::obj-18" : [ "decay", "decay", 0 ],
			"obj-9::obj-20" : [ "pictctrl[1]", "pictctrl[1]", 0 ],
			"obj-9::obj-26" : [ "cutoff", "cutoff", 0 ],
			"obj-9::obj-31" : [ "wetdry", "wetdry", 0 ],
			"obj-9::obj-4" : [ "pictctrl[3]", "pictctrl[1]", 0 ],
			"obj-9::obj-48" : [ "pictctrl[2]", "pictctrl[2]", 0 ],
			"obj-9::obj-5" : [ "size", "size", 0 ],
			"obj-9::obj-53" : [ "pictctrl", "pictctrl", 0 ],
			"obj-9::obj-7" : [ "onoff", "onoff", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-14::obj-20" : 				{
					"parameter_longname" : "pictctrl[14]"
				}
,
				"obj-14::obj-37" : 				{
					"parameter_longname" : "pictctrl[26]"
				}
,
				"obj-14::obj-43" : 				{
					"parameter_longname" : "pictctrl[42]"
				}
,
				"obj-14::obj-45" : 				{
					"parameter_longname" : "wetdry[1]"
				}
,
				"obj-14::obj-53" : 				{
					"parameter_longname" : "pictctrl[43]"
				}
,
				"obj-14::obj-64" : 				{
					"parameter_longname" : "pictctrl[27]"
				}
,
				"obj-25::obj-105" : 				{
					"parameter_longname" : "pictctrl[13]"
				}
,
				"obj-25::obj-12" : 				{
					"parameter_longname" : "resetpan[1]"
				}
,
				"obj-25::obj-122" : 				{
					"parameter_longname" : "pan[1]"
				}
,
				"obj-25::obj-127" : 				{
					"parameter_longname" : "vib rate[1]"
				}
,
				"obj-25::obj-128" : 				{
					"parameter_longname" : "vib depth[1]"
				}
,
				"obj-25::obj-265" : 				{
					"parameter_longname" : "pictctrl[18]"
				}
,
				"obj-25::obj-276" : 				{
					"parameter_longname" : "FreqMode[1]"
				}
,
				"obj-25::obj-33" : 				{
					"parameter_longname" : "pictctrl[23]"
				}
,
				"obj-25::obj-52" : 				{
					"parameter_longname" : "pictctrl[22]"
				}
,
				"obj-25::obj-6" : 				{
					"parameter_longname" : "decay[1]"
				}
,
				"obj-25::obj-63" : 				{
					"parameter_longname" : "pictctrl[24]"
				}
,
				"obj-25::obj-66" : 				{
					"parameter_longname" : "pictctrl[17]"
				}
,
				"obj-25::obj-68" : 				{
					"parameter_longname" : "pictctrl[21]"
				}
,
				"obj-25::obj-88" : 				{
					"parameter_longname" : "pictctrl[41]"
				}
,
				"obj-25::obj-9" : 				{
					"parameter_longname" : "LFOwave[1]"
				}
,
				"obj-25::obj-99" : 				{
					"parameter_longname" : "pictctrl[20]"
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
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/utils",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.data-handler.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/utils",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/utils",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.fmodr~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.out~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.reverber8r~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sdelayr~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers",
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
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-fm-multivoice~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/poly",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/poly",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-fm~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-listconform.js",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/javascript",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-simpleFM~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-wavetables2~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-wavetables~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-xfade~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.sub-yafr2~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/patchers/sub",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/patchers/sub",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sawdown.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sawup.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-sine.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-square.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "az.wave-triangle.svg",
				"bootpath" : "~/Documents/Max 8/Packages/Auzzie/media",
				"patcherrelativepath" : "../../Documents/Max 8/Packages/Auzzie/media",
				"type" : "svg",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
