BINARY := wayshot
BUILDFLAGS := --release
TARGET_DIR := $(DESTDIR)/usr/bin
SOURCE_DIR := ./target/release
MAN1_DIR := /usr/share/man/man1
MAN7_DIR := /usr/share/man/man7

all: build

build:
	@cargo build $(BUILDFLAGS)

run:
	@cargo run

install: build
	@mkdir -p $(TARGET_DIR)
	@cp $(SOURCE_DIR)/$(BINARY) $(TARGET_DIR)
	@chmod +x $(TARGET_DIR)/$(BINARY)
	@find ./docs -type f -iname "*.1.gz" -exec cp {} $(MAN1_DIR) \;
	@find ./docs -type f -iname "*.7.gz" -exec cp {} $(MAN7_DIR) \;

uninstall:
	@rm -f $(TARGET_DIR)/$(BINARY)
	@rm -f /usr/share/man/**/wayshot.*

.PHONY: all install build
