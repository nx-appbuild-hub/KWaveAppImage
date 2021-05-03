# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all: clean
	mkdir --parents $(PWD)/build/Boilerplate.AppDir

	wget --output-document=$(PWD)/build/build.deb http://ppa.launchpad.net/audio-recorder/ppa/ubuntu/pool/main/a/audio-recorder/audio-recorder_3.2.3~hirsute_amd64.deb
	dpkg -x $(PWD)/build/build.deb $(PWD)/build

	cp --force --recursive $(PWD)/build/usr/* $(PWD)/build/Boilerplate.AppDir

	apprepo --destination=$(PWD)/build appdir boilerplate libatk1.0-0 libatk-bridge2.0-0 libgtk2.0-0 breeze-gtk-theme


	echo '' 																				>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' 																				>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'exec $${APPDIR}/bin/audio-recorder $${@}' >> $(PWD)/build/Boilerplate.AppDir/AppRun


clean:
	rm -rf $(PWD)/build
