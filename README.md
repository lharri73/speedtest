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


## Graph Creation
There is also a python script to create a simple graph of the speedtest results. 
This requires python3, and we'll install the dependencies in the following steps.

1. Install dependencies

	*You can also use a virtual environment, but since this requires so few dependencies
	I'm just using the system python installation.*
	```bash
	python3 -m pip install matplotlib numpy pytz
	```
1. Run the script

	This requires that you know the path to your results csv file. 
	You should have provided this as an argument to the `start.sh` script.
	If not, the csv is in the container under `/opt/results/values.csv`.
	
	The graph can be viewed by running the script:
	```bash
	./src/graph.py [path_to_csv]
	```
	
**Note:** `graph.py` converts uniz time to a human readable format. This requires a timezone
conversion. Currently, this converts it to US Eastern time. If you are not in the US Eastern
timezone, your time data will be offset. You can correct it by changing the timezone to the
correct value [here](https://github.com/lharri73/speedtest/blob/495926325df242f502b95856233a3867c7b6c68c/src/graph.py#L23).
