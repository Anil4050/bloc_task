abstract class LocalCrudEvent {}

class AddItem extends LocalCrudEvent{
  final String title, description;

  AddItem(this.title, this.description);
}