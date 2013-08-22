/***************************************************
 *  ____              ___   ____                   *
 * |  _ \ __ _ _ __  ( _ ) / ___|  ___ __ _ _ __   *
 * | |_) / _` | '_ \ / _ \/\___ \ / __/ _` | '_ \  *
 * |  __/ (_| | | | | (_>  <___) | (_| (_| | | | | *
 * |_|   \__,_|_| |_|\___/\/____/ \___\__,_|_| |_| *
 *                                                 *
 ***************************************************/

#import "TRSDialView.h"

NSString * const kTRSDialViewDefaultFont = @"HelveticaNeue";

const NSInteger kTRSDialViewDefautLabelFontSize = 30;

const CGFloat kTRSDialViewDefaultMinorTickDistance = 16.0f;
const CGFloat kTRSDialViewDefaultMinorTickLength   = 10.0f;
const CGFloat KTRSDialViewDefaultMinorTickWidth    =  2.0f;

const NSInteger kTRSDialViewDefaultMajorTickDivisions = 10;
const CGFloat kTRSDialViewDefaultMajorTickLength      = 20.0f;
const CGFloat kTRSDialViewDefaultMajorTickWidth       = 4.0f;


@interface TRSDialView ()

@end

@implementation TRSDialView{
    
    int _verticalOffset;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _minimum = 0;
        _maximum = 0;

        _minorTicksPerMajorTick = kTRSDialViewDefaultMajorTickDivisions;
        _minorTickDistance = kTRSDialViewDefaultMinorTickDistance;

        _backgroundColor = [UIColor grayColor];

        _labelStrokeColor = [UIColor colorWithRed:0.482 green:0.008 blue:0.027 alpha:1.000];
        _labelFillColor = [UIColor whiteColor];
        _labelStrokeWidth = 1.0;

        _labelFont = [UIFont fontWithName:kTRSDialViewDefaultFont
                                     size:kTRSDialViewDefautLabelFontSize];
        _minorTickColor = [UIColor yellowColor];
        _minorTickLength = kTRSDialViewDefaultMinorTickLength;
        _minorTickWidth = KTRSDialViewDefaultMinorTickWidth;

        _majorTickColor = [UIColor whiteColor];
        _majorTickLength = kTRSDialViewDefaultMajorTickLength;
        _majorTickWidth = kTRSDialViewDefaultMajorTickWidth;

        _shadowColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        _shadowOffset = CGSizeMake(1, 1);
        _shadowBlur = 0.9f;
        
        _verticalOffset = 10;

    }

    return self;
}

- (void)setDialRangeFrom:(NSInteger)from to:(NSInteger)to {

    _minimum = from;
    _maximum = to;
    
    // Resize the frame of the view
    CGRect frame = self.frame;
    //jmead frame.size.width = (_maximum - _minimum) * _minorTickDistance + self.superview.frame.size.width;
    frame.size.width = (_maximum - _minimum) * _minorTickDistance + [[UIScreen mainScreen] bounds].size.width;
        
    self.frame = frame;
}

#pragma mark - Drawing

- (void)drawLabelWithContext:(CGContextRef)context
                     atPoint:(CGPoint)point
                        text:(NSString *)text
                   fillColor:(UIColor *)fillColor
                 strokeColor:(UIColor *)strokeColor {
    
    // manage max case that gets a plus sign
    if ([text integerValue] == self.maximum){
        text = [text stringByAppendingString:@"+"];
    }
    
    CGSize boundingBox = [text sizeWithFont:self.labelFont];
    CGFloat label_y_offset = 10 + (boundingBox.height / 2);

    // We want the label to be centered on the specified x value
    NSInteger label_x = point.x - (boundingBox.width / 2);

    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);

    CGContextSetLineWidth(context, self.labelStrokeWidth);
    
    // Set the drawing mode based on the presence of the file and stroke colors
    CGTextDrawingMode mode = kCGTextFillStroke;
    
    if ((fillColor == nil) && (strokeColor == nil))
        mode = kCGTextInvisible;
        
    else if (fillColor == nil)
        mode = kCGTextStroke;
    
    else if (strokeColor == nil)
        mode = kCGTextFill;
    
    CGContextSetTextDrawingMode(context, mode);

    [text drawInRect:CGRectMake(label_x, point.y + label_y_offset, boundingBox.width, boundingBox.height)
            withFont:self.labelFont
       lineBreakMode:NSLineBreakByTruncatingTail
           alignment:NSTextAlignmentCenter];

}

- (void)drawMinorTickWithContext:(CGContextRef)context
                         atPoint:(CGPoint)point
                       withColor:(UIColor *)color
                           width:(CGFloat)width
                          length:(CGFloat)length {

    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);

    CGContextMoveToPoint(context, point.x, point.y + _verticalOffset);
    CGContextAddLineToPoint(context, point.x, point.y + length + (_verticalOffset / 2));

    CGContextStrokePath(context);
}

- (void)drawMajorTickWithContext:(CGContextRef)context
                         atPoint:(CGPoint)point
                       withColor:(UIColor *)color
                           width:(CGFloat)width
                          length:(CGFloat)length {

    // Draw the line
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, kCGLineCapRound);

    CGContextMoveToPoint(context, point.x, point.y + _verticalOffset);
    CGContextAddLineToPoint(context, point.x, point.y + length + (_verticalOffset / 2));

    CGContextStrokePath(context);

}

- (void)drawTicksWithContext:(CGContextRef)context atX:(int)x
{

    CGPoint point = CGPointMake(x, 0);
    CGContextSetShadowWithColor(
        context,
        self.shadowOffset,
        self.shadowBlur,
        self.shadowColor.CGColor);

    if ([self isMajorTick:x]) {

        [self drawMajorTickWithContext:context
                               atPoint:point
                             withColor:self.majorTickColor
                                 width:self.majorTickWidth
                                length:self.majorTickLength];

        // Draw the text
        //
        // 1) Take the existing position and subtract off the lead spacing
        // 2) Divide by the minor ticks to get the major number
        // 3) Add the minimum to get the current value
        //
        int value = (point.x - self.leading) / self.minorTickDistance + _minimum;

        NSString *text = [NSString stringWithFormat:@"%i", value];
        [self drawLabelWithContext:context
                           atPoint:point
                              text:text
                         fillColor:self.labelFillColor
                       strokeColor:self.labelStrokeColor];

    } else {

        // Save the current context so we revert some of the changes laster
        CGContextSaveGState(context);

        [self drawMinorTickWithContext:context
                               atPoint:point
                             withColor:self.minorTickColor
                                 width:self.minorTickWidth
                                length:self.minorTickLength];

        // Restore the context
        CGContextRestoreGState(context);
    }
}

/**
 * The number of pixels that need to be prepended to the begining and ending
 * of the dial to make sure that the center mark is able to reach all available
 * values on the range of the dial.
 */
- (NSInteger)leading
{
    return self.superview.frame.size.width / 2;
}

/**
 * Perform Custom drawing
 */
- (void)drawRect:(CGRect)rect
{
    // Drawing code
   // NSLog(@"frame = %@\n", NSStringFromCGRect(rect));

    CGContextRef context = UIGraphicsGetCurrentContext();

    // Fill the background
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);

    CGContextFillRect(context, rect);
    
    // Add the tick Marks
    for (int i = self.leading; i < rect.size.width; i += self.minorTickDistance) {

        // After
        if (i > (self.frame.size.width - self.leading))
            break;

        // Middle
        else
            [self drawTicksWithContext:context atX:i];

    }
}

/**
 * Method to check if there is a major tick and the specified point offset
 * @param x [in] the pixel offset
 */
- (BOOL)isMajorTick:(int)x {

    int tick_number = (x - self.leading) / self.minorTickDistance;

    return (tick_number % self.minorTicksPerMajorTick) == 0;
}

@end

