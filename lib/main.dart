import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class News {
  final String title;
  final String content;

  News({required this.title, required this.content});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: NewsHomePage(),
    );
  }
}

class NewsHomePage extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> with TickerProviderStateMixin {
  late TabController _tabControllerTop;
  int _currentIndex = 0;  // Track the current index for the bottom navigation
  late List<News> _newsData;

  @override
  void initState() {
    super.initState();
    _newsData = List.generate(
      20,
          (index) => News(
        title: '新闻标题 ${index + 1}',
        content: '新闻内容 ${index + 1} 这里是新闻详细内容。',
      ),
    );
    _tabControllerTop = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabControllerTop.dispose();
    super.dispose();
  }

  List<Widget> getTopTabsContent() {
    return [
      // 第一个页签显示新闻列表
      ListView.builder(
        itemCount: _newsData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_newsData[index].title),
            subtitle: Text(_newsData[index].content),
          );
        },
      ),
      // 其他页签显示简单文本，可以根据需要修改
      Center(child: Text('顶部页签页面 2')),
      Center(child: Text('顶部页签页面 3')),
      Center(child: Text('顶部页签页面 4')),
      Center(child: Text('顶部页签页面 5')),
    ];
  }


  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                controller: _tabControllerTop,
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                tabs: List.generate(5, (index) => Tab(text: 'Tab ${index + 1}')),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabControllerTop,
                children: getTopTabsContent(),
              ),
            ),
          ],
        );
      case 1:
        return Center(child: Text("业务页面"));
      case 2:
        return Center(child: Text("学校页面"));
      case 3:
        return Center(child: Text("设置页面"));
      case 4:
        return Center(child: Text("更多页面"));
      default:
        return Center(child: Text("首页"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,  // Set to 0 to effectively hide it
        elevation: 0,
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '业务'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '学校'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: '更多'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
