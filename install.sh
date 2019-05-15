clang_ling=http://releases.llvm.org/5.0.0/clang+llvm-5.0.0-linux-x86_64-ubuntu16.04.tar.xz

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)
        clang_ling=http://releases.llvm.org/5.0.0/clang%2bllvm-5.0.0-x86_64-apple-darwin.tar.xz;;
esac

echo $clang_ling
wget $(echo $clang_ling)
tar xvf clang+llvm*.tar.*

rm clang+llvm*.tar.*
mv clang+llvm* clang5
