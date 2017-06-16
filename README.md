# kernelCreator

`docker build .`

`docker run -v /Users/bcourbe/Desktop/kernelCreator:/extract -i IMAGE`

```
tar -xvzf my_env_offline.tar.gz
rm -f my_env_offline.tar.gz
source activate my_env_offline
python -m ipykernel install --user --name my_env_offline --display-name my_env
source deactivate
```
