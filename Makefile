TEMP_DIR = temp

download:
	./scripts/download.sh

upload:
	./scripts/upload.sh

clean:
	rm -rf $(TEMP_DIR)

.PHONY: clean download upload
