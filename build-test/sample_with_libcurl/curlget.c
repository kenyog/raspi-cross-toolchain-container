#include <stdio.h>
#include <stdlib.h>
#include <curl/curl.h>
 
int main(int argc, char *argv[]) {

  if (argc < 2) {
    exit(EXIT_FAILURE);
  }

  CURL *curl;
  curl = curl_easy_init();
  if (!curl) {
    exit(EXIT_FAILURE);
  }

  curl_easy_setopt(curl, CURLOPT_URL, argv[1]);
  curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
 
  CURLcode res = curl_easy_perform(curl);
  if(res != CURLE_OK)
    fprintf(stderr, "curl failed: %s\n", curl_easy_strerror(res));
 
  curl_easy_cleanup(curl);
  exit(EXIT_SUCCESS);
}
