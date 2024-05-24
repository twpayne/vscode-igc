color1: {
	name: "keyword.control.igc"
}
color2: {
	name: "string.quoted.igc"
}
color3: {
	name: "storage.type.igc"
}
color4: {
	name: "entity.name.igc"
}
color5: {
	name: "variable.name.igc"
}
invalid: {
	name: "invalid.igc"
}

tmlanguagespec: #TMLanguageSpec & {
	$schema: "https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json"
	name:    "IGC"
	patterns: [
		{
			include: "#records"
		},
	]
	repository: {
		records: {
			patterns: [
				{
					name:  "record.a.igc"
					match: "^(A)(...)(.*)$"
					captures: {
						"1": color1
						"2": color2
						"3": color3
					}
				},
				{
					name:  "record.b.igc"
					match: "^(B)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{3})([NS])(\\d{3})(\\d{2})(\\d{3})([EW])([AV])(\\d{5}|-\\d{4})(\\d{5}|-\\d{4})(.*)"
					captures: {
						"1":  color1
						"2":  color2
						"3":  color3
						"4":  color4
						"5":  color2
						"6":  color3
						"7":  color4
						"8":  color5
						"9":  color2
						"10": color3
						"11": color4
						"12": color5
						"13": color2
						"14": color3
						"15": color4
						"16": color5
						"17": color2
						"18": color3
						"19": color4
						"20": color5
						"21": color1
						"22": color2
					}
				},
				{
					name:  "record.h.hfdte.igc"
					match: "^(H)(F)(DTE)(\\d\\d)(\\d\\d)(\\d\\d)(.*)$"
					captures: {
						"1": color1
						"2": color2
						"3": color3
						"4": color4
						"5": color2
						"6": color3
						"7": invalid
					}
				},
				{
					name:  "record.h.hffxa.igc"
					match: "^(H)(F)(FXA)(\\d+)(.*)$"
					captures: {
						"1": color1
						"2": color2
						"3": color3
						"4": color4
						"5": invalid
					}
				},
				{
					name:  "record.h.igc"
					match: "^(H)(.)([0-9A-Z]{3})(.*?):(.*)$"
					captures: {
						"1": color1
						"2": color2
						"3": color3
						"4": color4
						"5": color2
					}
				},
				{
					name:  "record.g.igc"
					match: "^(G)(.*)$"
					captures: {
						"1": color1
						"2": color2
					}
				},
				{
					name:  "record.l.igc"
					match: "^(L)(.*)$"
					captures: {
						"1": color1
						"2": {name: "comment.igc"}
					}
				},
			]
		}
	}
	scopeName: "source.igc"
}
