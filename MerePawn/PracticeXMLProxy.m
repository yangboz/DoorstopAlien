//
//  PracticeXMLProxy.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//XML file parse and store.

#import "PracticeXMLProxy.h"
#import "PracticeModel.h"

@implementation PracticeXMLProxy

@synthesize practiceVO,practiceVOs;

-(PracticeXMLProxy *)initXMLParser
{
	[super init];
	// init array of subject objects 
	practiceVOs = [[NSMutableArray alloc] init];	
	//
	return self;
}

//Custom public functions.
-(void)parseXMLFile:(NSString *)path
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:@"xml"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *fileData = [fileHandle readDataToEndOfFile];
    [fileHandle closeFile];
	// create and init NSXMLParser object
	NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:fileData];
	
	// create and init our delegate
	PracticeXMLProxy *parser = [[PracticeXMLProxy alloc] initXMLParser];
	//set delegate
	[nsXmlParser setDelegate:parser];
	//parsing...
	BOOL success = [nsXmlParser parse];
	if (success) {
		NSLog(@"No errors - practices count : %i", [[parser practiceVOs] count]);
		// get array of users here
		//  NSMutableArray *users = [parser users];
	}else {
		NSLog(@"Error parsing document!!!");
	}
    
	// release
	//[parser release];
	[nsXmlParser release];
	
	//store this results to singleton model.
	[PracticeModel setData:[[parser practiceVOs] copy]];
}


//NSXMLParse delegate functions here.
//  <title>What's time is this?</title>

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
	attributes:(NSDictionary *)attributeDict   
{
    if (qName) elementName = qName;
	if (elementName) [currentElementValue appendString:@""];
	//
	if ([elementName isEqualToString:@"ITEM"]) {
        NSLog(@"NAME attribute:%@",[attributeDict objectForKey:@"name"]);
		NSLog(@"PracticeVO element found – create a new instance of PracticeVO class...");
		practiceVO = [[PracticeVO alloc] init];
		//We do not have any attributes in the user elements, but if
		// you do, you can extract them here: 
		// subject.att = [[attributeDict objectForKey:@"<att name>"] ...];
        NSLog(@"attribute allKeys:%@",[attributeDict allKeys]);
        NSLog(@"attribute allValues:%@",[attributeDict allValues]);
        NSLog(@"attribute key_name:%@",[attributeDict objectForKey:@"name"]);
        //
        practiceVO.title = [attributeDict objectForKey:@"title"];
        practiceVO.selection = [attributeDict objectForKey:@"selection"];
        practiceVO.result = [attributeDict objectForKey:@"result"];
	}

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"GROUP"]) {
		// We reached the end of the XML document
		return;
	}
	if ([elementName isEqualToString:@"ITEM"]) {
		// We are done with user entry – add the parsed subject 
		// object to our user array
		[practiceVOs addObject:practiceVO];
		// release user object
		[practiceVO release];
		practiceVO = nil;
	} else {
		// The parser hit one of the element values. 
		// This syntax is possible because SubjectVO object 
		// property names match the XML subject element names   
		[practiceVO setValue:currentElementValue forKey:elementName];
	}
	
	[currentElementValue release];
	currentElementValue = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!currentElementValue) {
		// init the element string with the value     
		currentElementValue = [[NSMutableString alloc] initWithString:@""];
	} else {
		// append value to the element string   
		[currentElementValue appendString:string];
	}
//	NSLog(@"Processing value for : %@", string);
}

//
-(void) parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"parserDidStartDocument!!!"); 	
}

-(void) parserDidEndDocument: (NSXMLParser *)parser {
	NSLog(@"parserDidEndDocument!!!"); 
}

@end
