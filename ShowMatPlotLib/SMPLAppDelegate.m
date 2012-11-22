//
//  SMPLAppDelegate.m
//  ShowMatPlotLib
//
//  Created by Helmut Strey on 4/23/12.
//  Copyright (c) 2012 Stony Brook University. All rights reserved.
//

#import "SMPLAppDelegate.h"
#include "Python/Python.h"

// Global pointer to app delegate
SMPLAppDelegate* myprogram;

// sendGraph function for sending graph through NSData
PyObject* sendGraph(PyObject* self, PyObject* pArgs)
{
    char* GraphStr = NULL;
    int length;
	if (!PyArg_ParseTuple(pArgs, "s#", &GraphStr,&length)) return NULL;
    
    NSLog(@"%i",length);
    [myprogram pythonOut: [NSData dataWithBytes: GraphStr length:length]];
    
	Py_INCREF(Py_None);
	return Py_None;
}

static PyMethodDef sendGraphMethods[] = {
	{"SendGraph", sendGraph, METH_VARARGS, "submit string"},
	{NULL, NULL, 0, NULL}
};


@implementation SMPLAppDelegate

@synthesize window = _window;
@synthesize matplotlibView = _matplotlibView;
@synthesize freq=_freq;

- (void)setFreq:(double)freq
{
    _freq=freq;
    NSString *mystring = [[NSString alloc] initWithFormat:@"drawplot(%f)\n" , freq];
    PyRun_SimpleString([mystring UTF8String]);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    myprogram=self;
    Py_Initialize();
    
	Py_InitModule("MPL", sendGraphMethods);
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"init" ofType:@"py"];
    
	// load the main script into the python runtime
	FILE *mainFile = fopen([scriptPath UTF8String], "r");
	PyRun_SimpleFile(mainFile, (char *)[[scriptPath lastPathComponent] UTF8String]);
    
    self.freq=50;
    
}

- (void)pythonOut: (NSData*)pngimage
{
    NSImage *matplotlibGraph = [[NSImage alloc] initWithData:pngimage];
    [self.matplotlibView setImage:matplotlibGraph];
    [self.matplotlibView setNeedsDisplay:YES];
}

@end
