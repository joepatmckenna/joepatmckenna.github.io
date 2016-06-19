#include <stdlib.h>     /* atoi, system */
#include <string>
#include <fstream>      /* ifstream, ofstream */
using namespace std;

int main() {

	string line, lastLine, labelLine, brnchStr, ptStr;
	int brnchInt, lastBrnchInt = 0, ptInt = 0, lastPtInt = 0;
	bool isStable, switchedBrnch, switchedStability, wroteStableData=false, wroteUnstableData=false;

	ifstream uncleanData;
	uncleanData.open("b.snp", ios::in);
	ofstream stableData("tex/gnuplot/stable.dat", ios::out | ios::trunc);
	ofstream unstableData("tex/gnuplot/unstable.dat", ios::out | ios::trunc);

	if (uncleanData.is_open()) {
		while (getline(uncleanData, line)) {

			brnchStr = line.substr(0, 4);
			brnchInt = atoi(brnchStr.c_str());
			if (brnchInt != lastBrnchInt) {
				switchedBrnch = true;
				if (lastBrnchInt == 0)
					labelLine = "#" + lastLine.substr(21);
				lastBrnchInt = brnchInt;
			}

			ptStr = line.substr(4, 6);
			ptInt = atoi(ptStr.c_str());
			if (lastPtInt * ptInt < 0) {
				switchedStability = true;
			}

			if (brnchInt != 0) {

				isStable = (ptInt < 0) ? true : false;
				if (isStable) {
					if (switchedBrnch || switchedStability) {
						if(wroteStableData) stableData << endl;
						stableData << labelLine << endl;
						wroteStableData = true;
					}
					stableData << line.substr(19) << endl;
				} else if (!isStable) {
					if (switchedBrnch || switchedStability) {
						if(wroteUnstableData) unstableData << endl;
						unstableData << labelLine << endl;
						wroteUnstableData = true;
					}
					unstableData << line.substr(19) << endl;
				}
			}
			switchedBrnch = false;
			switchedStability = false;
			lastLine = line;
			lastPtInt = ptInt;
		}
		uncleanData.close();
		unstableData.close();
		stableData.close();
	}

	return 0;
}

