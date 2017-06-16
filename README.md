# kernelCreator
## How to build and install a new kernel
### On your local computer
First build the image  
`docker build .`

Then run your image  
`docker run -v /Users/bcourbe/Desktop/kernelCreator:/extract -i IMAGE`

After running this 2 commands, you should have an archive in /Users/bcourbe/Desktop/kernelCreator which contains the kernel.

Note that you can modify the requirements.txt and add more dependencies before building the docker image.

### On your server (without access to internet)
```
tar -xvzf my_env_offline.tar.gz
rm -f my_env_offline.tar.gz
source activate my_env_offline
python -m ipykernel install --user --name my_env_offline --display-name my_env
source deactivate
```
