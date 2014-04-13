#!/usr/bin/env bash

source "./rbenvhelpers"

@test "Simple gem file name discovery" {
  test_gem_name="mini_portile-0.5.2"
  desired_result="mini_portile"

  run discover_gem_name_from_ls $test_gem_name

  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "Complex gem file name discovery" {
  test_gem_name="debugger-linecache-1.2.0"
  desired_result="debugger-linecache"

  run discover_gem_name_from_ls $test_gem_name

  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "gem file name discovery with no trailing version" {
  test_gem_name="debugger-linecache"
  desired_result="debugger-linecache"

  run discover_gem_name_from_ls $test_gem_name

  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "gem file version discovery simple file name" {
  test_gem_name="mini_portile-0.5.2"
  desired_result="0.5.2"

  run discover_gem_version_from_ls $test_gem_name

  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "gem file version discovery complex file name" {
  test_gem_name="debugger-linecache-1.2.0"
  desired_result="1.2.0"

  run discover_gem_version_from_ls $test_gem_name

  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "bundler line can be constructed from simple gem name" {
  test_gem_name="mini_portfile-0.5.2"
  desired_result="gem 'mini_portfile', ~> '0.5.2'"

  run build_bundler_line $test_gem_name
  echo $output


  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}

@test "bundler line can be constructed from simple gem name" {
  test_gem_name="debugger-linecache-1.2.0"
  desired_result="gem 'debugger-linecache', ~> '1.2.0'"

  run build_bundler_line $test_gem_name
  echo $output


  [ "$status" -eq 0 ]
  [ "$output" = "$desired_result" ]
}