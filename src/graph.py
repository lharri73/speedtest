#!/usr/bin/env python
import sys
from matplotlib import pyplot as plt
import numpy as np
import csv
from datetime import datetime, timezone
import pytz

def main():
    if len(sys.argv) != 2:
        print("usage: ./graph.py [path_to_csv]")
        exit(1);
    arr = np.empty((0,5), dtype="float")
    times = []

    with open(sys.argv[1], 'r') as f:
        reader = csv.reader(f, delimiter=',', quotechar='"')
        for row in reader:
            if row[2] == "N/A":
                row[2] = 0
            tmpArray = np.array(row, dtype="float")
            arr = np.vstack((arr, tmpArray))
            times.append(datetime.fromtimestamp(int(row[0]), pytz.timezone('US/Eastern')))

    arr[:,3] /= 1024**2
    arr[:,4] /= 1024**2
    
    plt.plot(times, arr[:,2], label="Packetloss")
    plt.plot(times, arr[:,3], label="Upload")
    plt.plot(times, arr[:,4], label="Download")
    plt.gcf().autofmt_xdate()
    plt.title("Quarry Trail Internet Speeds")
    plt.legend()
    plt.show()

if __name__ == "__main__":
    main()
