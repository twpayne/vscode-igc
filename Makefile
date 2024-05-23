syntaxes/igc.tmLanguage.json: igc.tmLanguage.cue tmlanguage.cue
	cue export -e tmlanguagespec -f -o $@ $+

.PHONY: fmt
fmt:
	cue fmt igc.tmLanguage.cue

.PHONY: vet
vet: syntaxes/igc.tmLanguage.json tmlanguage.cue
	cue vet -d "#TMLanguageSpec" tmlanguage.cue syntaxes/igc.tmLanguage.json

tmlanguage.cue: tmlanguage.json
	cue import -f -p tmlanguage -l '#TMLanguageSpec:' $<

tmlanguage.json:
	curl -L -o $@ https://raw.githubusercontent.com/martinring/tmlanguage/master/tmlanguage.json