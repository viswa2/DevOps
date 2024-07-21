resource "local_file" "foo" {
  content  = "NEW CONTENT"
  filename = "terraform2.txt"
}