
PROTO_SWIFT_OUT = Sources/SwiftAPI

-include .makefiles/Makefile
-include .makefiles/pkg/protobuf/v2/Makefile

GENERATED_FILES += $(foreach f,$(PROTO_FILES:.proto=.pb.swift),$(if $(findstring /_,/$f),,$(PROTO_SWIFT_OUT)/$f))
GENERATED_FILES += $(foreach f,$(PROTO_GRPC_FILES:.proto=.grpc.swift),$(if $(findstring /_,/$f),,$(PROTO_SWIFT_OUT)/$f))

.makefiles/%:
	@curl -sfL https://makefiles.dev/v1 | bash /dev/stdin "$@"
