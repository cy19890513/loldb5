//
//  ViewController.m
//  loldb
//
//  Created by Yang Chen on 5/22/15.
//  Copyright (c) 2015 Yang Chen. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Cell.h"

@interface ViewController (){


}
@end
NSString *kDetailedViewControllerID = @"DetailView";    // view controller storyboard id
NSString *kCellID = @"cellID";                          // UICollectionViewCell storyboard id
NSMutableArray *champions;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    champions = [[NSMutableArray alloc] initWithObjects:@"Aatrox",@"Ahri",@"Akali",@"Amumu",@"Anivia",@"Annie",@"Ashe",@"Azir",@"Bard",
@"Blitzcrank",@"Brand",@"Braum",@"Caitlyn",@"Cassiopeia",@"Cho'Gath",@"Corki",@"Darius",@"Diana",@"Dr.Mundo",@"Draven",@"Elise",
@"Evelynn",@"Ezreal",@"Fiddlesticks",@"Fiora",@"Fizz",@"Galio",@"Gangplank",@"Garen",@"Gnar",@"Gragas",@"Graves",@"Hecarim",@"Heimerdinger",
@"Irelia",@"Janna",@"Jarven IV",@"Jax",@"Jayce",@"Jinx",@"Kalista",@"Karma",@"Karthus",@"Kassadin",@"Katarina",@"Kayle",@"Kennen",
@"Kha'Zix",@"Kog'Maw",@"LeBlanc",@"Lee Sin",@"Leona",@"Lissandra",@"Lucian",@"Lulu",@"Lux",@"Malphite",@"Malzahar",@"Maokai",@"Master Yi",
@"Miss Fortune",@"Mordekaiser",@"Morgana",@"Nami",@"Nasus",@"Nautilus",@"Nidalee",@"Nocturne",@"Nunu",@"Olaf",@"Orianna",@"Pantheon",
@"Poppy",@"Quinn",@"Rammus",@"Rek'Sai",@"Renekton",@"Rengar",@"Riven",@"Rumble",@"Ryze",@"Sejuani",@"Shaco",@"Shen",@"Shyvana",@"Singed",
@"Sion",@"Sivir",@"Skarner",@"Sona",@"Soraka",@"Swain",@"Syndra",@"Talon",@"Taric",@"Teemo",@"Thresh",@"Tristana",@"Trundle",@"Tryndamere",@"Twisted Fate",
@"Twitch",@"Udyr",@"Urgot",@"Varus",@"Vayne",@"Veigar",@"Vel'Koz",@"Vi",@"Viktor",@"Vladimir",@"Volibear",@"Warwick",@"Wukong",@"Xerath",@"Xin Zhao",
@"Yasuo",@"Yorick",@"Zac",@"Zed",@"Ziggs",@"Zilean",@"Zyra",nil];
//    [champions addObject:@"Annie"];
//    [champions addObject:@"Braum"];
//    [champions addObject:@"Fiddlesticks"];
//    [champions addObject:@"Gangplank"];
//    [champions addObject:@"Gargas"];
//    [champions addObject:@"Heimerdinger"];
//    [champions addObject:@"Nasus"];
//    [champions addObject:@"Nidalee"];
//    [champions addObject:@"Udyr"];
//    [champions addObject:@"Xin Zhao"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [champions count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
    //cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
    cell.label.text = [champions objectAtIndex:indexPath.row];
    
    // load the image for this cell
    //NSString *imageToLoad = [NSString stringWithFormat:@"%d.JPG", indexPath.row];
    NSString *imageToLoad = [NSString stringWithFormat:@"%@.jpg", cell.label.text];
    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}

// the user tapped a collection item, load and set the image on the detail view controller
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        // load the image, to prevent it from being cached we use 'initWithContentsOfFile'
        NSString *imageNameToLoad = [NSString stringWithFormat:@"%@", [champions objectAtIndex:selectedIndexPath.row]];
        NSString *pathToImage = [[NSBundle mainBundle] pathForResource:imageNameToLoad ofType:@"jpg"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathToImage];
        
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.image = image;
        detailViewController.name=[champions objectAtIndex:selectedIndexPath.row];
    }
}








@end
