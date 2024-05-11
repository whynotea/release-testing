.PHONY: default
default: all

.PHONY: all
all:

.PHONY: release-pr
release-pr:
	release-please release-pr --token=${GH_TOKEN} --repo-url=whynotea/release-testing --target-branch=main

.PHONY: release-pr-dry-run
release-pr-dry-run:
	release-please --dry-run=true release-pr --token=${GH_TOKEN} --repo-url=whynotea/release-testing --target-branch=main

.PHONY: github-release
github-release:
	release-please github-release --token=${GH_TOKEN} --repo-url=whynotea/release-testing --target-branch=main

.PHONY: github-release-dry-run
github-release-dry-run:
	release-please --dry-run=true github-release --token=${GH_TOKEN} --repo-url=whynotea/release-testing --target-branch=main

.PHONY: create-release
create-release:
ifdef TAG 
	@echo "Creating release: ${TAG}"
	@git commit --allow-empty -m "chore: release ${TAG}" -m "Release-As: ${TAG}"
else
	@echo "NO TAG provided"
endif

.PHONY: goreleaser-release-snapshot
goreleaser-release-snapshot:
	goreleaser release --snapshot --clean
