package main

import (
	"bytes"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"unicode"
)

func main() {
	u := "http://www.unicode.org/Public/" + unicode.Version + "/ucd/UCD.zip"
	res, err := http.Get(u)
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()
	var buf bytes.Buffer
	io.Copy(&buf, res.Body)
	ioutil.WriteFile("ucd.zip", buf.Bytes(), 0600)
}
