cmake_minimum_required(VERSION 3.16)
project(curlget LANGUAGES C)

#add_compile_options(-Wall -Wextra -pedantic -Werror)
add_compile_options(-Wall)

find_package(CURL REQUIRED)

add_executable(curlget)
target_sources(curlget PRIVATE curlget.c)
target_link_libraries(curlget PRIVATE CURL::libcurl)

install(TARGETS curlget DESTINATION bin)
