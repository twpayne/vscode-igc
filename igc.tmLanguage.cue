capture1: "keyword.control.igc"
capture2: "string.quoted.igc"
capture3: "storage.type.igc"
capture4: "enity.name.igc"
invalid: "invalid.igc"

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
			]
		}
	}
	scopeName: "source.igc"
}
