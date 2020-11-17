# Speedtest Automator
This project allows for the collection of upload/download speeds over time. 
This is just a simple script that runs the speedtest cli program provided
by [Ookla](https://www.speedtest.net/apps/cli). Note that the `speedtest` app 
does collect usage information and upload the results on Ookla's website. 

## Results
The results are stored in a csv that is formatted as follows:
| Unix Time (s) | Latency (ms) | Packetloss (num) | download (bytes/s) | Upload (bytes/s) |
|---------------|--------------|------------------|--------------------|------------------|

## Running
This project's setup has been simplified using Docker. 
1. Clone this repository
	```bash
	git clone https://github.com/lharri73/speedtest.git
	cd speedtest
	```

1. Build the docker image
	```bash
	docker build -t speedtest .
	```

1. Run the container
	A start script has been provided in `start.sh`. It takes two input arguments
	- The tag name of the image (in step 2, we tagged it as `speedtest`)
	- The complete path of the results directory.
	```bash
	./start.sh speedtest $/path/to/results/$
	```
	This will print the UUID of the spawned container


