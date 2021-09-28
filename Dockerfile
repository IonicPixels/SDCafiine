FROM devkitpro/devkitppc

RUN apt-get update && apt-get install p7zip-full -y && apt-get install xxd -y

RUN git clone https://github.com/Maschell/dynamic_libs.git -b lib && 7z x -y ./dynamic_libs/libs/portlibs.zip -o${DEVKITPRO} && cd dynamic_libs && make && make install && cd ../ && rm -r dynamic_libs

RUN git clone https://github.com/dimok789/libiosuhax.git && cd libiosuhax && make -j8 && make install && cd ../ && rm -r libiosuhax

RUN git clone https://github.com/MetallicPixels/libfat.git && cd libfat && make wiiu-release && make wiiu-install && cd ../ && rm -r libfat

RUN git clone https://github.com/Maschell/libntfs-wiiu.git && cd libntfs-wiiu && make wiiu-release && make wiiu-install && cd ../ && rm -r libntfs-wiiu

RUN git clone https://github.com/Maschell/libutils.git && cd libutils && make && make install && cd ../ && rm -r libutils

RUN git clone https://github.com/Maschell/fs_wrapper.git && cd fs_wrapper && make && make install && cd ../ && rm -r fs_wrapper

RUN mkdir SDCafiine

WORKDIR /SDCafiine

COPY . .