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
		"rect" : [ 726.0, 118.0, 663.0, 1132.0 ],
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
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 265.0, 168.0, 97.0, 22.0 ],
					"text" : "scale 30 38 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.0, 125.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 98.0, 529.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 265.0, 68.0, 40.0, 22.0 ],
					"text" : "ctlin"
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
					"patching_rect" : [ 94.0, 233.0, 430.0, 142.0 ],
					"prototypename" : "pixl",
					"varname" : "fmodr",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 94.0, 125.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 94.0, 68.0, 41.0, 22.0 ],
					"text" : "notein"
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
					"patching_rect" : [ 94.0, 426.0, 415.0, 156.0 ],
					"prototypename" : "pixl",
					"varname" : "sdelayr",
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
					"patching_rect" : [ 94.0, 775.0, 71.0, 277.0 ],
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
					"patching_rect" : [ 94.0, 626.0, 189.0, 111.0 ],
					"prototypename" : "pixl",
					"varname" : "reverber8r",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 94.0, 168.0, 34.0, 22.0 ],
					"text" : "pack"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-20", 0 ]
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
					"destination" : [ "obj-20", 1 ],
					"midpoints" : [ 114.5, 111.0, 152.75, 111.0, 152.75, 162.0, 118.5, 162.0 ],
					"source" : [ "obj-42", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 5 ],
					"source" : [ "obj-56", 0 ]
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
			"obj-14::obj-20" : [ "pictctrl[17]", "pictctrl[1]", 0 ],
			"obj-14::obj-37" : [ "pictctrl[18]", "pictctrl[1]", 0 ],
			"obj-14::obj-40" : [ "maxtime", "maxtime", 0 ],
			"obj-14::obj-43" : [ "pictctrl[19]", "pictctrl[1]", 0 ],
			"obj-14::obj-45" : [ "wetdry[1]", "wetdry", 0 ],
			"obj-14::obj-53" : [ "pictctrl[16]", "pictctrl", 0 ],
			"obj-14::obj-64" : [ "pictctrl[15]", "pictctrl[1]", 0 ],
			"obj-14::obj-7" : [ "onoff[1]", "onoff", 0 ],
			"obj-24::obj-102" : [ "pictctrl[284]", "pictctrl[1]", 0 ],
			"obj-24::obj-16" : [ "output", "output", 0 ],
			"obj-24::obj-86" : [ "textbutton[1]", "textbutton", 0 ],
			"obj-25::obj-102" : [ "pictctrl[8]", "pictctrl[3]", 0 ],
			"obj-25::obj-105" : [ "pictctrl[14]", "pictctrl[3]", 0 ],
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
			"obj-25::obj-33" : [ "pictctrl[6]", "pictctrl[3]", 0 ],
			"obj-25::obj-5" : [ "attack", "A", 0 ],
			"obj-25::obj-51" : [ "polyphony-val", "polyphony-val", 0 ],
			"obj-25::obj-52" : [ "pictctrl[10]", "pictctrl[3]", 0 ],
			"obj-25::obj-58" : [ "modulator-waveform", "modwav", 0 ],
			"obj-25::obj-6" : [ "decay[1]", "D", 0 ],
			"obj-25::obj-63" : [ "pictctrl[9]", "pictctrl[3]", 0 ],
			"obj-25::obj-66" : [ "pictctrl[11]", "pictctrl[3]", 0 ],
			"obj-25::obj-68" : [ "pictctrl[13]", "pictctrl[3]", 0 ],
			"obj-25::obj-75" : [ "harmonicity-float", "harm", 0 ],
			"obj-25::obj-79" : [ "pictctrl[4]", "pictctrl[3]", 0 ],
			"obj-25::obj-8" : [ "sustain", "S", 0 ],
			"obj-25::obj-82" : [ "harmonicity-int", "harm", 0 ],
			"obj-25::obj-83" : [ "integer-harm-mode", "integer-mode", 0 ],
			"obj-25::obj-88" : [ "pictctrl[5]", "pictctrl[3]", 0 ],
			"obj-25::obj-9" : [ "LFOwave", "LFOwave", 0 ],
			"obj-25::obj-96" : [ "pictctrl[12]", "pictctrl[3]", 0 ],
			"obj-25::obj-99" : [ "pictctrl[7]", "pictctrl[3]", 0 ],
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
					"parameter_longname" : "pictctrl[17]"
				}
,
				"obj-14::obj-37" : 				{
					"parameter_longname" : "pictctrl[18]"
				}
,
				"obj-14::obj-43" : 				{
					"parameter_longname" : "pictctrl[19]"
				}
,
				"obj-14::obj-45" : 				{
					"parameter_longname" : "wetdry[1]"
				}
,
				"obj-14::obj-53" : 				{
					"parameter_longname" : "pictctrl[16]"
				}
,
				"obj-14::obj-64" : 				{
					"parameter_longname" : "pictctrl[15]"
				}
,
				"obj-25::obj-105" : 				{
					"parameter_longname" : "pictctrl[14]"
				}
,
				"obj-25::obj-33" : 				{
					"parameter_longname" : "pictctrl[6]"
				}
,
				"obj-25::obj-6" : 				{
					"parameter_longname" : "decay[1]"
				}
,
				"obj-25::obj-63" : 				{
					"parameter_longname" : "pictctrl[9]"
				}
,
				"obj-25::obj-68" : 				{
					"parameter_longname" : "pictctrl[13]"
				}
,
				"obj-25::obj-96" : 				{
					"parameter_longname" : "pictctrl[12]"
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
