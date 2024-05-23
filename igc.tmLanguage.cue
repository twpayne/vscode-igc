capture1: "keyword.control.igc"
capture2: "string.quoted.igc"
capture3: "storage.type.igc"
capture4: "entity.name.igc"
capture5: "variable.name.igc"
invalid:  "invalid.igc"

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
						"1": {name: capture1}
						"2": {name: capture2}
						"3": {name: capture3}
					}
				},
				{
					name:  "record.h.hfdte.igc"
					match: "^(H)(F)(DTE)(\\d\\d)(\\d\\d)(\\d\\d)(.*)$"
					captures: {
						"1": {name: capture1}
						"2": {name: capture2}
						"3": {name: capture3}
						"4": {name: capture4}
						"5": {name: capture2}
						"6": {name: capture3}
						"7": {name: invalid}
					}
				},
				{
					name:  "record.h.hffxa.igc"
					match: "^(H)(F)(FXA)(\\d+)(.*)$"
					captures: {
						"1": {name: capture1}
						"2": {name: capture2}
						"3": {name: capture3}
						"4": {name: capture4}
						"5": {name: invalid}
					}
				},
				{
					name:  "record.h.igc"
					match: "^(H)(.)([0-9A-Z]{3})(.*?):(.*)$"
					captures: {
						"1": {name: capture1}
						"2": {name: capture2}
						"3": {name: capture3}
						"4": {name: capture4}
						"5": {name: capture2}
					}
				},
				{
					name:  "record.b.igc"
					match: "^(B)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{3})([NS])(\\d{3})(\\d{2})(\\d{3})([EW])([AV])(\\d{5}|-\\d{4})(\\d{5}|-\\d{4})(.*)"
					captures: {
						"1": {name: capture1}
						"2": {name: capture2}
						"3": {name: capture3}
						"4": {name: capture4}
						"5": {name: capture2}
						"6": {name: capture3}
						"7": {name: capture4}
						"8": {name: capture5}
						"9": {name: capture2}
						"10": {name: capture3}
						"11": {name: capture4}
						"12": {name: capture5}
						"13": {name: capture2}
						"14": {name: capture3}
						"15": {name: capture4}
						"16": {name: capture5}
						"17": {name: capture2}
						"18": {name: capture3}
						"19": {name: capture4}
						"20": {name: capture5}
						"21": {name: capture1}
						"22": {name: capture2}
					}
				},
				{
					name:  "record.l.igc"
					match: "^(L)(.*)$"
					captures: {
						"1": {name: capture1}
						"2": {name: "comment.igc"}
					}
				},
			]
		}
	}
	scopeName: "source.igc"
}
