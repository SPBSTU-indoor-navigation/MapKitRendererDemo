# MapKitRendererDemo

Run project and see the line from UK to Poland. This line renderer rasterize.

All code in MapkitTest/ViewController

### Tested on   
- iPad Pro. iOS 15.2, iOS 15.4
- iPhone 12. iOS 15.4
- Simulator

### Bad rendering
```swift
class CustomRederer: MKPolylineRenderer {
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        super.draw(mapRect, zoomScale: zoomScale, in: context)
    }
}
```

### Good rendering
```swift
class CustomRederer: MKPolylineRenderer {
    // override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) // {
    //     super.draw(mapRect, zoomScale: zoomScale, in: context)
    // }
}
```
