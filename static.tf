provider "aws"{
    region =  "ap-south-1"
}

resource "aws_s3_bucket" "staticwebapp"{
    bucket =  "staticwebappbyabhi"
    acl = "public-read"

    website  {
        index_document = "index.html"
        error_document = "error.html"
    }
}
resource "aws_s3_bucket_object" "index" {
    bucket = "${aws_s3_bucket.staticwebapp.bucket}"
    key   =  "index.html"
    source = "index.html"
    content_type = "test/html"
    etag = "${md5(file("index.html"))}"
    acl = "public-read"


}

resource "aws_s3_bucket_object" "error"{
    bucket = "${aws_s3_bucket.staticwebapp.bucket}"
    key = "error.html"
    source = "error.html"
    content_type = "test/html"
    etag = "${md5(file("error.html"))}"
    acl = "public-read"
}