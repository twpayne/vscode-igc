names: {
	"header": {name: "keyword.control.igc"}
	"comment": {name: "comment.igc"}
	"invalid": {name: "invalid.igc"}

	"degree":      names["2"]
	"minute":      names["3"]
	"milliminute": names["4"]
	"hemisphere":  names["1"]

	"year":   names["2"]
	"month":  names["3"]
	"day":    names["4"]
	"hour":   names["2"]
	"minute": names["3"]
	"second": names["4"]

	"1": {name: "entity.name.igc"}
	"2": {name: "storage.type.igc"}
	"3": {name: "string.quoted.igc"}
	"4": {name: "variable.name.igc"}
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
					match: "^(A)([A-Z]{3})([^\\-]*)(-.*)?$"
					captures: {
						for i, value in ["header", "1", "2", "3"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.b.igc"
					match: "^(B)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{3})([NS])(\\d{3})(\\d{2})(\\d{3})([EW])([AV])(\\d{5}|-\\d{4})(\\d{5}|-\\d{4})(.*)$"
					captures: {
						for i, value in ["header", "hour", "minute", "second", "degree", "minute", "milliminute", "hemisphere", "degree", "minute", "milliminute", "hemisphere", "1", "2", "3", "4"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.c.line1.igc"
					match: "^(C)(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{4})(\\d{2})(.*)$"
					captures: {
						for i, value in ["header", "day", "month", "year", "hour", "minute", "second", "day", "month", "year", "1", "2"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.c.point.igc"
					match: "^(C)(\\d{2})(\\d{2})(\\d{3})([NS])(\\d{3})(\\d{2})(\\d{3})([EW])(.*)$"
					captures: {
						for i, value in ["header", "degree", "minute", "milliminute", "hemisphere", "degree", "minute", "milliminute", "hemisphere", "1"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.e.igc"
					match: "^(E)(\\d{2})(\\d{2})(\\d{2})(.{3})(.*)$"
					captures: {
						for i, value in ["header", "hour", "minute", "second", "1", "2"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.f.igc"
					begin: "^(F)(\\d{2})"
					beginCaptures: {
						for i, value in ["header", "1"] {
							"\(i+1)": names[value]
						}
					}
					patterns: [
						{
							match: "(\\d{2})(\\d{2})"
							captures: {
								for i, value in ["2", "3"] {
									"\(i+1)": names[value]
								}
							}
						},
						{
							match: "(\\d{2})"
							captures: {
								for i, value in ["2"] {
									"\(i+1)": names[value]
								}
							}
						},
						{
							match: "(.*)"
							captures: {
								for i, value in ["invalid"] {
									"\(i+1)": names[value]
								}
							}
						},
					]
					end: "$"
				},
				{
					name:  "record.h.hfdte.igc"
					match: "^(H)(F)(DTE)(\\d{2})(\\d{2})(\\d{2})(.*)$"
					captures: {
						for i, value in ["header", "1", "2", "day", "month", "year", "invalid"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.h.hffxa.igc"
					match: "^(H)(F)(FXA)(\\d+)(.*)$"
					captures: {
						for i, value in ["header", "1", "2", "3", "invalid"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.h.igc"
					match: "^(H)([FO])([0-9A-Z]{3})([^:]*)(:)?(.*)$"
					captures: {
						for i, value in ["header", "1", "2", "3", "4", "2"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.g.igc"
					match: "^(G)(.*)$"
					captures: {
						for i, value in ["header", "1"] {
							"\(i+1)": names[value]
						}
					}
				},
				ijrecord & {
					name:  "record.i.igc"
					begin: "^(I)(\\d{2})"
				},
				ijrecord & {
					name:  "record.j.igc"
					begin: "^(J)(\\d{2})"
				},
				{
					name:  "record.k.igc"
					match: "^(K)(.*)$"
					captures: {
						for i, value in ["header", "1"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.l.igc"
					match: "^(L)([A-Z]{3})(.*)$"
					captures: {
						for i, value in ["header", "1", "comment"] {
							"\(i+1)": names[value]
						}
					}
				},
				{
					name:  "record.invalid.igc"
					match: "^(.*)$"
					captures: {
						for i, value in ["invalid"] {
							"\(i+1)": names[value]
						}
					}
				},
			]
		}
	}
	scopeName: "source.igc"
}

ijrecord: {
	beginCaptures: {
		for i, value in ["header", "1"] {
			"\(i+1)": names[value]
		}
	}
	patterns: [
		{
			match: "(\\d{2})(\\d{2})([A-Z]{3})"
			captures: {
				for i, value in ["2", "3", "4"] {
					"\(i+1)": names[value]
				}
			}
		},
		{
			match: "(.*)"
			captures: {
				for i, value in ["invalid"] {
					"\(i+1)": names[value]
				}
			}
		},
	]
	end: "$"
}
