enum CRUDTab {
  create('Create'),
  read('Read'),
  update('Update'),
  delete('Delete');

  final String value;
  const CRUDTab(this.value);
}