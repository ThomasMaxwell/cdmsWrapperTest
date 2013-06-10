/*
 * main.c
 *
 *  Created on: Jun 9, 2013
 *      Author: tpmaxwell
 */

#include "uvcdatWrappers.h"

int main(int argc, char *argv[]) {

	pythonInitialize();

	char* dataset_path = "/Users/tpmaxwell/data/AConaty/comp-ECMWF/ecmwf.xml";
	char* var_name = "Temperature";
	char* roi = "lon=0,180;lat=-45,45";

	void* var = getVariable( dataset_path, var_name, roi );

	int vsize = getSize( var );

//	printf( " Variable size = %d ", vsize );

	pythonFinalize();


}

