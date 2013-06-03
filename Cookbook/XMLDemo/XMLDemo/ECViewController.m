//
//  ECViewController.m
//  XMLDemo
//
//  Created by 陈 海涛 on 13-5-31.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import "XMLElement.h"

@interface ECViewController ()
@property (nonatomic,strong)NSXMLParser *xmlParser;

@property (nonatomic,strong) XMLElement *rootElement;
@property (nonatomic,strong) XMLElement *curentElementPointer;

@end

@implementation ECViewController
@synthesize xmlParser;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"MyXML" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    self.xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    self.xmlParser.delegate = self;
    if([self.xmlParser parse]){
        NSLog(@"The XML is parsered");
    }else{
        NSLog(@"Failed to parse the XML");
    }
}

/*
 parserDidStartDocument:解析开始的时候调用该方法。
 
 parserDidEndDocument:解析结束的时候调用该方法。
 
 parser:didStartElement:namespaceURI:qualifiedName:attributes:在 XML document 中,当解析器在解析的时候遇到了一个新的 element 时会被调用该
 方法。
 
  parser:didEndElement:namespaceURI:qualifiedName:当前节点结束之后会调用。
 
 
 parser:foundCharacters:当解析器在解析文档内容的时候被调用。
 */

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.rootElement = nil;
    self.curentElementPointer = nil;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([parser isEqual:self.xmlParser]) {
        if (self.rootElement == nil) {
            self.rootElement = [XMLElement new];
            self.curentElementPointer = self.rootElement;
        }else{
            XMLElement *newElement = [XMLElement new];
            newElement.parent = self.curentElementPointer;
            [self.curentElementPointer.subElements addObject:newElement];
            self.curentElementPointer = newElement;
        }
        self.curentElementPointer.name = elementName;
        self.curentElementPointer.attributes = attributeDict;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.curentElementPointer.text.length > 0) {
        [self.curentElementPointer.text stringByAppendingString:string];
    }else{
        self.curentElementPointer.text = string;
    }
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.curentElementPointer = self.curentElementPointer.parent;
}


-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    self.curentElementPointer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
























