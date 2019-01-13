@echo off

cd %cd%
javac -cp "C:\Program Files\processing\core\library\core.jar" deadpixel\keystone\*.java
move /y deadpixel\keystone\*.class build\deadpixel\keystone\
cd build
jar cvfm ..\..\keystone.jar manifest.txt deadpixel\keystone\*.class

@pause