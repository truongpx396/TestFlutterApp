import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:swagger/api.dart';
import 'package:url_launcher/url_launcher.dart';

const tmp = '''
 ![Flutter logo](https://techshare.o2f-it.com/static/images/articles/24/ttemplate.jpg)

![Flutter logo](https://24hstore.vn/upload_images/images/2019/11/14/anh-gif-1-min.gif)

![Flutter logo](/static/images/articles/24/ttemplate.jpg)

 
''';

//![Flutter logo](/static/images/articles/24/ttemplate.jpg)

//![Flutter logo](https://techshare.o2f-it.com/static/images/articles/24/samebutdiff.gif)

//https://techshare.o2f-it.com/static/images/articles/24/samebutdiff.gif

//![Flutter logo](/static/images/articles/24/samebutdiff.gif)

//![Flutter logo](/dart-lang/site-shared/master/src/_assets/image/flutter/icon/64.png)

class ArticleDetail extends StatelessWidget {
  //const ArticleDetail({Key key}) : super(key: key);

  final controller = ScrollController();

  final ReadPost _data;

  ArticleDetail(this._data);

  @override
  Widget build(BuildContext context) {
    void _onTapLink(href) async {
      if (await canLaunch(href)) {
        launch(href);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong address: $href'),
          ),
        );
      }
    }

    String path =
        "https://techshare.o2f-it.com/static/images/articles/24/samebutdiff.gif";

    Uri uri = Uri.parse(path);

    // return Image(
    //   image: NetworkImageWithRetry(path),
    // );

    // return CachedNetworkImage(
    //     imageUrl: path,
    //     placeholder: (context, url) => CircularProgressIndicator(),
    //     errorWidget: (context, url, error) {
    //       return Icon(Icons.error);
    //     });

    // return Container(
    //   width: 100.0,
    //   height: 100.0,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(3.0),
    //     color: const Color(0xff7c94b6),
    //     image: DecorationImage(
    //       image: NetworkImage(path),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );

    // return Image.network(
    //   uri.toString(),
    //   width: null,
    //   height: null,
    //   // frameBuilder: (BuildContext context, Widget child, int frame,
    //   //     bool wasSynchronouslyLoaded) {
    //   //   if (wasSynchronouslyLoaded) {
    //   //     return child;
    //   //   }
    //   //   return AnimatedOpacity(
    //   //     child: child,
    //   //     opacity: frame == null ? 0 : 1,
    //   //     duration: const Duration(seconds: 1),
    //   //     curve: Curves.easeOut,
    //   //   );
    //   // },
    //   // loadingBuilder: (BuildContext context, Widget child,
    //   //     ImageChunkEvent loadingProgress) {
    //   //   if (loadingProgress == null) return child;
    //   //   return Center(
    //   //     child: CircularProgressIndicator(
    //   //       value: loadingProgress.expectedTotalBytes != null
    //   //           ? loadingProgress.cumulativeBytesLoaded /
    //   //               loadingProgress.expectedTotalBytes
    //   //           : null,
    //   //     ),
    //   //   );
    //   // },
    // );

    return Container(
        color: Colors.white,
        child: Markdown(
          controller: controller,
          // data: newData,
          data: _data.content,
          //imageDirectory: 'https://raw.githubusercontent.com',
          imageDirectory: 'https://qatechshare.o2f-it.com',

          onTapLink: _onTapLink,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            blockquote: TextStyle(color: Colors.orange),
            code: TextStyle(color: Colors.brown),
            h1: TextStyle(color: Colors.red),
            h2: TextStyle(color: Colors.green),
            h3: TextStyle(color: Colors.blue),
            h4: TextStyle(color: Colors.cyan),
            h5: TextStyle(color: Colors.yellow),
            h6: TextStyle(color: Colors.orange),
          ),
        ));
  }
}
