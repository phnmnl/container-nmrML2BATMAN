# container-nmrML2BATMAN
convert zipped nmrML files into tabulated txt file for BATMAN


## How to buile a Docker image

in the folder where Dockerfile is hosted and run
`docker build -t <your_docker_image_name>:latest .`

## Test
Download the test data from test_data and unzip it into <path/to/data/folder>

Change work dir to <path/to/data/folder> and run

`docker run -v $PWD:/data -ti <your_docker_image_name> -i /data/`