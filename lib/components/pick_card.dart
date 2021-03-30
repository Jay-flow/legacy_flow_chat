import 'package:flutter/material.dart';

class PickCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 13.0,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholder: 'res/images/loding_spinner.gif',
          image:
              'https://image.chosun.com/sitedata/image/201905/19/2019051900415_0.jpg',
        ),
      ),
    );
  }
}
