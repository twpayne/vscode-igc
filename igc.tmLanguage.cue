// styles defines how fields are styled. The names are arbitrary because fields
// do not correspond to programming language constructs.
#styles: {
	// Named styles.
	"header": {name: "keyword.control.igc"}
	"comment": {name: "comment.igc"}
	"invalid": {name: "invalid.igc"}

	// Generic styles.
	"1": {name: "entity.name.igc"}
	"2": {name: "storage.type.igc"}
	"3": {name: "string.quoted.igc"}
	"4": {name: "variable.name.igc"}

	// Ordinate styles.
	"degree":      #styles["2"]
	"minute":      #styles["3"]
	"hemisphere":  #styles["1"]

	// Date and time styles.
	"year":   #styles["2"]
	"month":  #styles["3"]
	"day":    #styles["4"]
	"hour":   #styles["2"]
	"minute": #styles["3"]
	"second": #styles["4"]

}

// #simpleRecords are records with no nested structure.
#simpleRecords: [...{
	key!:   string
	name!:  string
	match!: string
	fields!: [...string]
}] & [
	{
		key:   "a"
		name:  "record.a.igc"
		match: "^(A)([A-Z]{3})([^\\-]*)(-.*)?$"
		fields: ["header", "1", "2", "3"]
	},
	{
		key:   "b"
		name:  "record.b.igc"
		match: "^(B)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{5})([NS])(\\d{3})(\\d{5})([EW])([AV])(\\d{5}|-\\d{4})(\\d{5}|-\\d{4})(.*)$"
		fields: ["header", "hour", "minute", "second", "degree", "minute", "hemisphere", "degree", "minute", "hemisphere", "2", "3", "4", "1"]
	},
	{
		key:   "cFirstLine"
		name:  "record.c.line1.igc"
		match: "^(C)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{4})(\\d{2})(.*)$"
		fields: ["header", "day", "month", "year", "hour", "minute", "second", "day", "month", "year", "1", "2"]
	},
	{
		key:   "cPoint"
		name:  "record.c.point.igc"
		match: "^(C)(\\d{2})(\\d{5})([NS])(\\d{3})(\\d{5})([EW])(.*)$"
		fields: ["header", "degree", "minute", "hemisphere", "degree", "minute", "hemisphere", "1"]
	},
	{
		key:   "e"
		name:  "record.e.igc"
		match: "^(E)(\\d{2})(\\d{2})(\\d{2})(.{3})(.*)$"
		fields: ["header", "hour", "minute", "second", "1", "2"]
	},
	{
		key:   "hfdte"
		name:  "record.h.hfdte.igc"
		match: "^(H)(F)(DTE)(\\d{2})(\\d{2})(\\d{2})(.*)$"
		fields: ["header", "1", "2", "day", "month", "year", "invalid"]
	},
	{
		key:   "hffxa"
		name:  "record.h.hffxa.igc"
		match: "^(H)(F)(FXA)(\\d+)(.*)$"
		fields: ["header", "1", "2", "3", "invalid"]
	},
	{
		key:   "h"
		name:  "record.h.igc"
		match: "^(H)([FO])([0-9A-Z]{3})([^:]*)(:)?(.*)$"
		fields: ["header", "1", "2", "3", "4", "2"]
	},
	{
		key:   "g"
		name:  "record.g.igc"
		match: "^(G)(.*)$"
		fields: ["header", "1"]
	},
	{
		key:   "k"
		name:  "record.k.igc"
		match: "^(K)(.*)$"
		fields: ["header", "1"]
	},
	{
		key:   "l"
		name:  "record.l.igc"
		match: "^(L)([A-Z]{3})(.*)$"
		fields: ["header", "1", "comment"]
	},
]

// #simpleRecordPatterns are the patterns for simple records.
#simpleRecordPatterns: {
	for i, simpleRecord in #simpleRecords {
		"\(simpleRecord.key)": #TMLanguageSpec.#pattern & {
			name:  simpleRecord.name
			match: simpleRecord.match
			captures: {
				for j, field in simpleRecord.fields {
					"\(j+1)": #styles[field]
				}
			}
		}
	}
}

// #fPattern is the pattern for F records.
#fPattern: #TMLanguageSpec.#pattern & {
	name:  "record.f.igc"
	begin: "^(F)(\\d{2})"
	end:   "$"
	beginCaptures: {
		for i, value in ["header", "1"] {
			"\(i+1)": #styles[value]
		}
	}
	patterns: [
		{
			match: "(\\d{2})(\\d{2})"
			captures: {
				for i, value in ["2", "3"] {
					"\(i+1)": #styles[value]
				}
			}
		},
		{
			match: "(\\d{2})"
			captures: {
				for i, value in ["2"] {
					"\(i+1)": #styles[value]
				}
			}
		},
		{
			match: "(.*)"
			captures: {
				for i, value in ["invalid"] {
					"\(i+1)": #styles[value]
				}
			}
		},
	]
}

// #ijPattern is the pattern for I and J records.
#ijPattern: #TMLanguageSpec.#pattern & {
	end: "$"
	beginCaptures: {
		for i, value in ["header", "1"] {
			"\(i+1)": #styles[value]
		}
	}
	patterns: [
		{
			include: "#ijFields"
		},
	]
}

// The top-level struct.
#TMLanguageSpec & {
	$schema: "https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json"
	name:    "IGC"
	patterns: [
		#simpleRecordPatterns.a,
		#simpleRecordPatterns.b,
		#simpleRecordPatterns.cFirstLine,
		#simpleRecordPatterns.cPoint,
		#simpleRecordPatterns.e,
		#fPattern,
		#simpleRecordPatterns.g,
		#simpleRecordPatterns.hfdte,
		#simpleRecordPatterns.hffxa,
		#simpleRecordPatterns.h,
		#ijPattern & {
			name:  "record.i.igc"
			begin: "^(I)(\\d{2})"
		},
		#ijPattern & {
			name:  "record.j.igc"
			begin: "^(J)(\\d{2})"
		},
		#simpleRecordPatterns.k,
		#simpleRecordPatterns.l,
		{
			name:  "record.invalid.igc"
			match: "^(.*)$"
			captures: {
				"1": #styles["invalid"]
			}
		},
	]
	repository: {
		ijFields: {
			patterns: [
				{
					match: "(\\d{2})(\\d{2})([A-Z]{3})"
					captures: {
						for i, value in ["2", "3", "4"] {
							"\(i+1)": #styles[value]
						}
					}
				},
				{
					match: "(.*)"
					captures: {
						"1": #styles["invalid"]
					}
				},
			]
		}
	}
	scopeName: "source.igc"
}
