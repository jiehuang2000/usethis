context("use_revdep")

test_that("use_revdep() requires a package", {
  scoped_temporary_project()
  expect_error(use_revdep(), "not an R package")
})

test_that("use_revdep() creates and ignores files/dirs", {
  scoped_temporary_package()
  use_revdep()
  expect_proj_file("revdep", "email.yml")
  expect_proj_file("revdep", ".gitignore")
  expect_true(is_build_ignored("^revdep$"))
})
