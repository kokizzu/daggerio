// Package consts exists to facilitate sharing values between our CI infra and
// dependent code (e.g. SDKs).
//
// These are kept separate from all other code to avoid breakage from
// backwards-incompatible changes (dev/ uses stable SDK, core/ uses dev).
package distconsts

const (
	EngineContainerName = "dagger-engine.dev"
)

const (
	RuncPath     = "/usr/local/bin/runc"
	DumbInitPath = "/usr/local/bin/dumb-init"

	EngineDefaultStateDir = "/var/lib/dagger"

	EngineContainerBuiltinContentDir   = "/usr/local/share/dagger/content"
	GoSDKManifestDigestEnvName         = "DAGGER_GO_SDK_MANIFEST_DIGEST"
	PythonSDKManifestDigestEnvName     = "DAGGER_PYTHON_SDK_MANIFEST_DIGEST"
	TypescriptSDKManifestDigestEnvName = "DAGGER_TYPESCRIPT_SDK_MANIFEST_DIGEST"
)

const (
	AlpineVersion = "3.20.1"
	AlpineImage   = "alpine:" + AlpineVersion

	GolangVersion = "1.22.5"
	GolangImage   = "golang:" + GolangVersion + "-alpine"
)
