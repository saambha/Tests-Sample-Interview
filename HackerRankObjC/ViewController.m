//
//  ViewController.m
//  HackerRankObjC
//
//  Created by Sambha on 11/5/17.
//  Copyright © 2017 Sambha. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *numbersArray = [NSArray arrayWithObjects: @25626, @25757, @24367, @24267, @16, @100, @2, @7277, nil];
    NSLog(@"Delta : %@",[self calculateDeltaEncoding:numbersArray]);
    
    Person *person = [[Person alloc] init];
    person.firstName = @"anoop";
    person.lastName = @"sadasd";
    NSLog(@"%@", person.fullName);

    NSArray *poly = [NSArray arrayWithObjects: @"36 30 36 30", @"15 15 15 15", @"46 96 90 100", @"86 86 86 86",
                     @"100 200 100 200",
                     @"-100 200 -100 200", nil];
    
    NSLog(@"%@",[self polygonCountsFromLines:poly]);
    
    NSArray * stringList = [NSArray arrayWithObjects:@"pear",@"amleth", @"reap", @"dormitory",@"tinsel",@"dirty room",@"hamlet",@"listen",@"silent",  nil];
   // NSLog(@"%@", [self anagram: stringList]);
    NSLog(@"%@", [ViewController groupAnagrams: stringList]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray*) calculateDeltaEncoding: (NSArray*)numbers{
    
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    NSNumber *lastNumber = @0;
    if (numbers.count > 0) {
    
        for (NSNumber *number in numbers){
            
            if (number == numbers[0]){
                [resultArray addObject:number];
                lastNumber = number;
                continue;
            }
            int difference =  [number intValue] - [lastNumber intValue];
            if (difference >= 127 || difference <= -127){
                [resultArray addObject: [NSNumber numberWithInt:-128]];
            }
            [resultArray addObject:[NSNumber numberWithInt: difference]];
            lastNumber = number;
        }
    }
    return resultArray;
}

-(NSString*) polygonCountsFromLines:(NSArray*) lines{
    int squareResult = 0;
    int rectangeResult = 0;
    int PolygonResult = 0;

    NSString *resutlString = @"";
    
    for (NSString* sides in lines){
        
        NSArray* sideArray = [sides componentsSeparatedByString:@" "];
        if ([sideArray[0] intValue] <= 0 || [sideArray[1] intValue] <= 0 || [sideArray[2] intValue] <= 0 || [sideArray[3] intValue] <= 0){
            PolygonResult = PolygonResult + 1;
        }
        else if (([sideArray[0] intValue]  == [sideArray[1] intValue]) && ([sideArray[1] intValue] == [sideArray[2] intValue]) && ([sideArray[2] intValue] == [sideArray[3] intValue]) ){
            squareResult = squareResult + 1;
        }else if (([sideArray[0] intValue]  == [sideArray[2] intValue]) && ([sideArray[1] intValue] == [sideArray[3] intValue]) ){
            rectangeResult = rectangeResult + 1;
        }else{
            PolygonResult = PolygonResult + 1;
        }
    }
    
        resutlString = [NSString stringWithFormat:@"%i %i %i",squareResult,rectangeResult, PolygonResult ];
        return resutlString;
}


//-(NSArray*) anagram:(NSArray*) stringList{
//    
//    NSMutableArray* anagramList = [[NSMutableArray alloc] init];
//    
//    NSString* list =    stringList[0];
//    for (int i=0; i< stringList.count; i++ ){
//        
//        for (int j=1; j< stringList.count; j++) {
//            if ([self isStringAnagram: stringList[i] ofString:stringList[j]] ){
//                
//                if (list.length > 0) {
//                    list = [NSString stringWithFormat:@"%@,%@", list, stringList[j]];
//
//                }else{
//                    list = [NSString stringWithFormat:@"%@", stringList[j]];
//                }
//            }
//        }
//        if (![anagramList containsObject:list]){
//            [anagramList addObject:list];
//            
//        }
//        list = @"";
//    }
//    return anagramList;
//}

+ (NSArray *)groupAnagrams:(NSArray *)lines {
    //enter your solution here:
    NSMutableArray* anagramList = [[NSMutableArray alloc] init];
    
    NSString* list =    @"";
    for (int i=0; i< lines.count; i++ ){
        
        for (int j=0; j< lines.count; j++) {
            if ([self isStringAnagram: lines[i] ofString:lines[j]] ){
                
                if (list.length > 0) {
                    list = [NSString stringWithFormat:@"%@,%@", list, lines[j]];
                    
                }else{
                    list = [NSString stringWithFormat:@"%@", lines[j]];
                }
            }
        }
        if (![anagramList containsObject:list]){
            
            NSMutableArray* listArr = [NSMutableArray arrayWithArray:[list componentsSeparatedByString:@","]] ;
            [listArr sortUsingSelector:@selector(caseInsensitiveCompare:)];
            NSString *value = @"";
            for (NSString* str in listArr){
                if(value.length>0){
                    value = [NSString stringWithFormat:@"%@,%@",value,str];
                }else{
                    value = [NSString stringWithFormat:@"%@",str];
                }
            }
            if (![anagramList containsObject:value]){
                [anagramList addObject:value];
            }
            
            
        }
        list = @"";
    }
    
    [anagramList sortUsingSelector:@selector(caseInsensitiveCompare:)];
    return anagramList;
}

+ (BOOL)isStringAnagram:(NSString *)str1 ofString:(NSString *)str2{
    
    NSString *string1 = [str1 stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *string2 = [str2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    int len = string1.length;
    if (len != string2.length) {
        return NO;
    }
    
    for (int i=0; i < len; i++) {
        int h = 0;
        int q = 0;
        for (int k = 0;  k < len; k++) {
            if ([string1 characterAtIndex:i] == [string1 characterAtIndex:k]) {
                h++;
            }
            if ([string1 characterAtIndex:i] == [string2 characterAtIndex:k]) {
                q++;
            }
        }
        
        if (h != q) {
            return NO;
        }
    }
    
    return YES;
}

@end
