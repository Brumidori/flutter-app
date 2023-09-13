import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';
import 'package:trilhaapp/pages/card_detail.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    //initState nao aceita async
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {
      // nao aceita async
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: cardDetail == null
                ? const LinearProgressIndicator()
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardDetailPage(
                                    cardDetail: cardDetail!,
                                  )));
                    },
                    //efeito de transição
                    child: Hero(
                      tag: cardDetail!.id,
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    cardDetail!.url,
                                    height: 20,
                                  ),
                                  Text(
                                    cardDetail!.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                cardDetail!.text,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Ler Mais",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
      ],
    );
  }
}
