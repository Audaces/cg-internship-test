mkdir build-vs16
cd build-vs16

cmake -G"Visual Studio 16 2019" -DCMAKE_INSTALL_PREFIX=vs16-deploy ..

cd ..
pause