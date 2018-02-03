@echo off
type building.frm | Util\VBFormDesignFilter > building.txt
type building.txt | VBFormDesignToXML building.frm > building.xml
