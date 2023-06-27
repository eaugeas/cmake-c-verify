CMAKE_BUILD_TYPE ?= Debug
CMAKE_BUILD_GENERATOR ?= Ninja
BUILD_BINARY_DIR=build-$(shell echo $(CMAKE_BUILD_TYPE) | tr A-Z a-z)

all: build

$(BUILD_BINARY_DIR):
	cmake -B $(BUILD_BINARY_DIR) -S . -G $(CMAKE_BUILD_GENERATOR) -DCMAKE_BUILD_TYPE=$(CMAKE_BUILD_TYPE)

build: $(BUILD_BINARY_DIR)
	cmake --build $(BUILD_BINARY_DIR) --target all

install: build
	cmake --build ${BUILD_BINARY_DIR} --target install

test: build
	cmake --build $(BUILD_BINARY_DIR) --target test

check: build
	cmake --build $(BUILD_BINARY_DIR) --target check

fix: build
	cmake --build $(BUILD_BINARY_DIR) --target fix

clean:
	@rm -rf $(BUILD_BINARY_DIR)

tests:
	make -C tests
