import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';

class Singlechatmassege extends StatefulWidget {
  const Singlechatmassege({super.key});

  @override
  State<Singlechatmassege> createState() => _SinglechatmassegeState();
}

class _SinglechatmassegeState extends State<Singlechatmassege> {
  @override
  void initState() {
    // var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    // BlocProvider.of<ReadChatCubit>(context).readChatList(a.agentId as String);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
  //  var user = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
 //   var senderid = user.uid;
return Scaffold(
  appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.05),
          child:const BusinessAppBarWidget(),
        ),
  body: Stack(
    alignment: Alignment.bottomCenter,
    children: [
      // const BackGroundGradientContainer(),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 70, top: 10),
            width: double.infinity,
            height: size.height,
            child: ListView.builder(
              
              padding: const EdgeInsets.symmetric(vertical: 8),
              scrollDirection: Axis.vertical,
              itemCount: 10, // Replace with actual message count
              itemBuilder: (ctx, index) {
                // Scroll to the bottom when items are added
                // if (scrollController.hasClients) {
                //   scrollController.animateTo(
                //     scrollController.position.maxScrollExtent,
                //     duration: const Duration(milliseconds: 300),
                //     curve: Curves.easeOut,
                //   );
                // }

                return BubbleSpecialThree(
                  delivered: true,
                  isSender: index % 2 == 0,
                  text: index % 2 == 0 ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                  color: index % 2 == 0 ? AppColors.links : Colors.grey,
                  tail: true,
                  textStyle:  Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ],
      ),
      const WriteMassege(), // Input area for writing messages
    ],
  ),
);
  }
}





class WriteMassege extends StatelessWidget {
  const WriteMassege({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        width: double.infinity,
        child: MessageBar(
          textFieldTextStyle: Theme.of(context).textTheme.titleSmall as TextStyle,
          messageBarColor: AppColors.links,
          sendButtonColor: Colors.black,
          onSend: (val) {
            // if (val.isEmpty) {
            //   return;
            // }
            // var userData =
            //     BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
            // DateTime time = DateTime.now();
            // String cretedAt = time.toUtc().toString();
            // ChatEntity chatEntity = ChatEntity(
            //     senderId: userData.agentId, createdAt: cretedAt, massege: val);

            // BlocProvider.of<WriteChatCubit>(context)
            //     .writeChat(chatEntity, userData.agentId as String);
          },
        ),
      );
  }
}