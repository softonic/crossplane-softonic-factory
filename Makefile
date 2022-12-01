version = $$(yq -r '.version' Chart.yaml)

test:
	rm -rf charts/*
	helm dep update .
	helm template -f values.test.yaml --namespace test-deleteme test-deleteme .

publish: test
	git tag $(version)
	git push origin $(version)
	helm cm-push . softonic-public
