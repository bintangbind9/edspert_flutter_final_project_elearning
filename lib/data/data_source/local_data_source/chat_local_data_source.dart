import '../../model/chat_item.dart';

class ChatLocalDataSource {
  Future<List<ChatItem>> getMessages() async {
    final first = DateTime.now();
    final second = first.add(const Duration(minutes: -1));
    final third = second.add(const Duration(minutes: -1));
    final four = third.add(const Duration(minutes: -1));
    final five = four.add(const Duration(minutes: -1));
    final six = five.add(const Duration(minutes: -1));

    final List<ChatItem> messages = [
      ChatItem(
        content: 'Halo semua saya Naufal dari SMAN 1 Yogyakarta.',
        id: 3,
        name: 'Naufal',
        dateTime: third,
      ),
      ChatItem(
        content: 'Halo semua saya Bayu dari SMAN 3 Yogyakarta.',
        id: 5,
        name: 'Bayu',
        dateTime: third,
      ),
      ChatItem(
        content: 'Halo semua saya Karina dari SMAN 1 Surabaya.',
        id: 2,
        name: 'Karina',
        dateTime: third,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 3 Yogyakarta.',
        id: 4,
        name: 'Andy',
        dateTime: four,
      ),
      ChatItem(
        content:
            'Halo, Perkenalkan saya Arin yang akan menjadi pembimbing kalian di grub ini.',
        id: 6,
        name: 'Arin',
        dateTime: six,
        isTutor: true,
      )
    ];

    return messages;
  }
}