cmake_minimum_required(VERSION 3.0.0)
project(demo13-list VERSION 0.1.0)

# list 用法
# LENGTH
set(my_list_var aaa bbb ccc ddd)
message("my list var: ${my_list_var}")

list(LENGTH my_list_var my_len_out)
message("list length out: ${my_len_out}")

list(GET my_list_var 1 2 my_get_out)
message("list get out: ${my_get_out}")

list(APPEND my_list_var "eee")
message("list append out: ${my_list_var}")

list(FIND my_list_var "bbb" my_find_out)
message("list find out: ${my_find_out}")

list(INSERT my_list_var 1 "ggg" "sss")
message("list insert out: ${my_list_var}")

list(REMOVE_ITEM my_list_var "ggg" "sss")
message("list remove item out: ${my_list_var}")

list(REMOVE_AT my_list_var 1 2)
message("list remove at out: ${my_list_var}")

list(INSERT my_list_var 2 "eee" "ddd" "fff")
list(REMOVE_DUPLICATES my_list_var)
message("list REMOVE_DUPLICATES out: ${my_list_var}")

list(REVERSE my_list_var)
message("list reverse out: ${my_list_var}")

list(SORT my_list_var)
message("list sort out: ${my_list_var}")

foreach (TMP_SRC_FILE ${my_list_var})
    if("${TMP_SRC_FILE}" MATCHES "a")
        list(REMOVE_ITEM  my_list_var  "${TMP_SRC_FILE}")
    endif()
endforeach()
message("list  out: ${my_list_var}")

add_executable(demo13-list main.cpp)