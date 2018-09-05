################################################################################################################################################################

# @project        Library/Astrodynamics
# @file           tools/development/docker/Dockerfile
# @author         Lucas Brémond <lucas@loftorbital.com>
# @license        TBD

################################################################################################################################################################

FROM openspacecollective/library-physics:0.1.9

LABEL maintainer="lucas@loftorbital.com"

# Arguments

ARG cpu_count=1

# Dependencies

## SGP4 [master]

RUN pushd /tmp > /dev/null \
    && git clone https://github.com/dnwrnr/sgp4.git \
    && cd sgp4 \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_CXX_FLAGS="-fPIC" .. \
    && make -j ${cpu_count} \
    && mkdir /usr/local/include/sgp4 \
    && cp ../libsgp4/*.h /usr/local/include/sgp4/ \
    && cp libsgp4/*.a /usr/local/lib \
    && rm -rf /tmp/sgp4 \
    && popd > /dev/null

## Library :: Physics [0.1.6]

RUN mkdir -p /tmp/library-physics \
 && pushd /tmp/library-physics > /dev/null \
 && wget --quiet https://github.com/open-space-collective/library-physics/releases/download/0.1.6/library-physics-0.1.6-1.x86_64-runtime.rpm \
 && wget --quiet https://github.com/open-space-collective/library-physics/releases/download/0.1.6/library-physics-0.1.6-1.x86_64-devel.rpm \
 && dnf install -y ./*.rpm \
 && rm -rf /tmp/library-physics \
 && popd > /dev/null

# Labels

ARG version

ENV version ${version}

LABEL version="${version}"

# Execution

CMD ["/bin/bash"]

################################################################################################################################################################