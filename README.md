# Experimentology
## An Open Science Approach to Experimental Psychology Methods
### Michael C. Frank, Mika Braginsky, Julie Cachia, Nicholas Coles, Tom Hardwicke, Robert Hawkins, Maya Mathur, and Rondeline Williams

A new open access textbook on experimental methods to be published by MIT Press. 

Available here: http://experimentology.io

Book manuscript is not final and text is expected to change (mostly in minor ways) through at least early 2024. 

To build locally (this is uncommon):
* Make sure Quarto is up to date (we use HomeBrew)
* Restore dependencies using `renv::restore()`

## Undergrad version

This version has been adapted for use in an undergraduate research methods course.  The main changes are to fold some of the sections into an "Advanced Topic" callout note.

See the `Makefile` for details on how to build the book. The book is built using [Quarto profiles](https://quarto.org/docs/projects/profiles.html).

Some changes had to be made to deal with issues related to profiles:

- the metadata_files block doesn't work properly with profiles, so this was moved into the main _quarto.yml files

