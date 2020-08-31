# Speedtest Automator
This project allows for the collection of upload/download speeds over time. 
This is just a simple script that runs the speedtest cli program provided
by [Ookla](https://www.speedtest.net/apps/cli). Note that the `speedtest` app 
does collect usage information and upload the results on Ookla's website. 
The results are stored in a csv that is formatted as follows:
| Unix Time (s) | Latency (ms) | Packetloss (num) | download (bytes/s) | Upload (bytes/s) |
|---------------|--------------|------------------|--------------------|------------------|
