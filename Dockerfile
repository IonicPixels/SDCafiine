FROM devkitpro/devkitppc

RUN apt-get update && apt-get install p7zip-full -y

RUN git clone https://github.com/Maschell/dynamic_libs.git -b lib && 7z x -y ./dynamic_libs/libs/portlibs.zip -o${DEVKITPRO} && rm -r dynamic_libs

RUN git clone https://github.com/dimok789/libiosuhax.git && cd libiosuhax && make -j8 && make install && cd ../ && rm -r libiosuhax

COPY --from=wiiulegacy/libfat:latest /artifacts $DEVKITPRO/portlibs

COPY --from=wiiulegacy/libntfs:latest /artifacts $DEVKITPRO/portlibs

COPY --from=wiiulegacy/libutils:0.1 /artifacts $DEVKITPRO/portlibs

RUN git clone https://github.com/Maschell/fs_wrapper.git && cd fs_wrapper && make && make install && cd ../ && rm -r fs_wrapper

RUN mkdir SDCafiine

WORKDIR /SDCafiine

COPY . .

# Not running the below until I figure out how to CMAKE

#RUN mkdir build

#WORKDIR /SDCafiine/build

#RUN cmake -DCMAKE_TOOLCHAIN_FILE=$DEVKITPRO/wut/share/wut.toolchain.cmake ../