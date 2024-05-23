#TMLanguageSpec & {
	$schema: "https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json"
	name:    "IGC"
	patterns: [
		{
			include: "#keywords"
		},
		{
			include: "#strings"
		},
	]
	repository: {
		keywords: {
			patterns: [{
				name:  "keyword.control.igc"
				match: "\\b(if|while|for|return)\\b"
			}]
		}
		strings: {
			name:  "string.quoted.double.igc"
			begin: "\""
			end:   "\""
			patterns: [{
				name:  "constant.character.escape.igc"
				match: "\\\\."
			}]
		}
	}
	scopeName: "source.igc"
}
