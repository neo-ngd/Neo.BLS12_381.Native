echo "build osx architecture ....."
cargo build --release --target x86_64-apple-darwin
echo "build linux architecture ....."
export CC_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-gcc   
export CXX_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-g++   
export AR_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-ar   
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc  
cargo build --release --target x86_64-unknown-linux-gnu
echo "build windows architecture ....."
cargo build --release --target x86_64-pc-windows-gnu
echo "build nuget packge ....."
mkdir -p ./runtimes/osx-x64/native/lib
mkdir -p ./runtimes/osx-arm64/native/lib
mkdir -p ./runtimes/win10-x64/native/lib/uap10.0
mkdir -p ./runtimes/win10-x86/native/lib/uap10.0
mkdir -p ./runtimes/alpine-x64/native/lib
mkdir -p ./runtimes/linux-x64/native/lib
mkdir -p ./runtimes/linux-arm64/native/lib
mkdir -p ./runtimes/mips64/native/lib
cp ./target/x86_64-apple-darwin/release/libNeo_Cryptography_BLS12_381_Native.dylib ./runtimes/osx-x64/native/lib
cp ./target/x86_64-apple-darwin/release/libNeo_Cryptography_BLS12_381_Native.dylib ./runtimes/osx-arm64/native/lib
cp ./target/x86_64-pc-windows-gnu/release/Neo_Cryptography_BLS12_381_Native.dll ./runtimes/win10-x64/native/lib/uap10.0
cp ./target/x86_64-pc-windows-gnu/release/Neo_Cryptography_BLS12_381_Native.dll ./runtimes/win10-x86/native/lib/uap10.0
cp ./target/x86_64-unknown-linux-gnu/release/libNeo_Cryptography_BLS12_381_Native.so ./runtimes/alpine-x64/native/lib
cp ./target/x86_64-unknown-linux-gnu/release/libNeo_Cryptography_BLS12_381_Native.so ./runtimes/linux-x64/native/lib
cp ./target/x86_64-unknown-linux-gnu/release/libNeo_Cryptography_BLS12_381_Native.so ./runtimes/linux-arm64/native/lib
cp ./target/x86_64-unknown-linux-gnu/release/libNeo_Cryptography_BLS12_381_Native.so ./runtimes/mips64/native/lib
nuget pack