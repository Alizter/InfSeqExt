opam init --yes --no-setup
eval $(opam config env)
opam repo add coq-released https://coq.inria.fr/opam/released
opam install coq.$COQ_VERSION --yes --verbose

./build.sh

case $DOWNSTREAM in
verdi)
  opam install coq-mathcomp-ssreflect.$SSREFLECT_VERSION --yes --verbose

  pushd ..
    git clone 'https://github.com/uwplse/StructTact.git'
    pushd StructTact
      ./build.sh
    popd

    git clone 'https://github.com/uwplse/verdi.git'
    pushd verdi
      ./build.sh
    popd
  popd
  ;;
esac
