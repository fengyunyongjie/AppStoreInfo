build:
	swiftc -o appstoreinfo AppStoreInfo.swift

install:
	cp appstoreinfo /usr/local/bin

clean:
	rm -f appstoreinfo

