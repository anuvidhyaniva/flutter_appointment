import 'package:flutter/material.dart';

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/sampleimage.jpg",
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, top: 16),
                    child: Icon(
                      Icons.verified,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("kdfjs"),
                  Text("kdfjs"),
                  Text("kdfjs"),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 0.5,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("dfsb    "),
                  Expanded(child: Text("vsvfsvdfvdfv"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("dfsb    "),
                  Expanded(child: Text("vsvfsvdfvdfv"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("dfsb    "),
                  Expanded(child: Text("vsvfsvdfvdfv"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("dfsb    "),
                  Expanded(child: Text("vsvfsvdfvdfv"))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
