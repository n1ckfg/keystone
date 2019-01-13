@echo off

cd %cd%
javac -cp "C:\Program Files\processing\core\library\core.jar" keystone\*.java
move /y keystone\*.class build\keystone\
cd build
jar cvfm ..\..\keystone.jar manifest.txt keystone\*.class

@pause