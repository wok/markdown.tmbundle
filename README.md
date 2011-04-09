Title:	MultiMarkdown Bundle for TextMate  
Author:	Fletcher T. Penney  


# Introduction #

[TextMate](http://macromates.com) is a wonderfully  useful text editor for Mac
OS X.  Of particular interest to  me is the  ability to extend it  with add-on
Bundles for particular  uses, either programming languages  or document types.
Allan Odgaard  (and others) created a  Bundle for Markdown, and  included some
basic support for MultiMarkdown.

To  me,  however,  the  job  felt  halfway  done.  First  -  the  support  for
MultiMarkdown was outdated, so at the very  least it needed to be updated with
newer versions of  the MultiMarkdown software. More  importantly, however, the
Bundle didn't  take advantage of all  the features that TextMate  offered that
could be  used to make document  creation and publishing easier.  And that was
the whole reason for creating MultiMarkdown in the first place.


# Where can you get a copy #

You can download a copy of the latest version from my github repository:

* [markdown.tmbundle](https://github.com/fletcher/markdown.tmbundle)


# Installation #

To install,  you download the  .zip file, and  after unzipping it,  rename the
folder  as `markdown.tmbundle`.  After that,  you can  double-click the  newly
renamed folder and it  should open in TextMate and be  installed to the proper
location.

If you are using  MultiMarkdown 2.0 (the perl version), then  you will want to
use the latest release  of this plugin tagged as version  2 on the [downloads]
page.  If you  use  this, you  should  probably also  set  the TextMate  Shell
Variable `TM_MULTIMARKDOWN_PATH` to match  your installation directory --- for
example, `/Users/yourname/Library/Application Support/MultiMarkdown`.

If you are using MultiMarkdown 3.0, you probably need to add `/usr/local/bin`
to your `PATH` variable in the TextMate preferences. Of course, you need a
working installation of MultiMarkdown. A few of the more advanced features
require that you also install the `MultiMarkdown-Support` package, but the
basics work without it.

You can also install my MultiMarkdown TextMate [theme] as well.


[downloads]:	https://github.com/fletcher/markdown.tmbundle/downloads
[theme]:		http://files.fletcherpenney.net/MultiMarkdown.tmTheme.zip


# What's the difference between this Bundle and the Markdown Bundle? #

The basic Markdown bundle  that is included with TextMate is  great, and I was
pleased when I learned that they  added MultiMarkdown support. The problem was
that even I couldn't get a pdf  to compile using it. The MultiMarkdown support
was limited, and didn't take full  advantage of the features that TextMate had
to offer.

So I wrote a new bundle to add those features back. More recently (July 2009),
I have forked  a git repository of  the original bundle that  adds my improved
support. Perhaps these changes will get pulled back into the original copy....
This should  make it easier for  me to keep my  version up to date  until that
happens.

If you just use  regular Markdown, the other bundle may  be sufficient. But if
you use MultiMarkdown, I believe you'll find this version to be indispensable.


# Features #


## Metadata ##

* Automatically clean up metadata section to align the data

* hitting return aligns you to continue entering metadata within the same key.
  hit return again to enter a new key. hit return again to insert a blank line
  and begin the body

* hitting tab after typing the colon for the key aligns you to the right tab
  width to start entering data

* If using the *Memoir* class, you can set the `chapterstyle` and `pagestyle`
  in the metadata within the document, or as part of your command using
  `addmetadata.pl`. See the companion style example.

* When creating a new document, you can pre-populate it with default metadata
  using the `Insert default metadata` or `Insert letter metadata` snippet.
  Both of these can be customized to your fit your needs. The advantage of the
  snippet approach is that you can tab between all of the values to easily
  make changes.


## Headers ##

* you can use a keystroke to increase or decrease the level of the header
* hitting enter automatically adds trailing #'s to the header and skips some
  space


## Lists ##

* indent and outdent with a keystroke
* convert from numbered to unnumbered list with a keystroke
* clean up the spacing of your list automatically with a single keystroke


## Blockquotes ##

* hitting return automatically starts the next line with the proper level of ">"
* use a keystroke to increase or decrease quote level


## Tables ##

* Clean up ascii spacing of tables automatically
* navigate left and right across cells with a single keystroke


## Text Formatting ##

Key commands to toggle italics and bold


## Completions ##

Automatically complete:

* links by reference
* citations
* footnotes
* automatic cross-refs
* equation labels
* table labels
* autocomplete image filenames located in same folder as your document
* autocomplete BibTeX cite keys from .bib files located in the same folder as 
  your document


## Document Conversion ##

Run the following with one menu selection (or keystroke):

* Preview XHTML - run MultiMarkdownMath (optionally), MultiMarkdown, 
  SmartyPants
* View XHTML source
* Convert XHTML into LaTeX using article, memoir, report, science or other 
  XSLT file of your choice
* Convert to RTF (though I recommend using Google Docs instead to create an 
  RTF file)

**Note**: You can  convert either the entire document or  just a selection. If
you choose to convert just a section, make sure that the section begins with a
blank line in order  to differentiate it from the metadata  that will be added
automatically.  If this  doesn't make  sense, just  stick with  previewing the
entire document until it does. ;)


## Image Preview ##

Thanks to a suggestion from Andrew Nanton, images now work properly when XHTML
is previewed within TextMate.


# Limitations #


## Language Grammar ##

There are a few situations where  the language matching grammar is too limited
to properly match MultiMarkdown documents:

* TextMate can't tell the difference between an anchor by reference on a line
  by itself, and the caption and optional label at the start of a table. If
  you are trying to use an anchor, you may need to add some non-whitespace
  characters to the end of the line to force the scope to change. I am open to
  suggestions on how to improve this.

* TextMate doesn't include the character after a scope as part of the scope.
  For example, Markdown anchors can consist of square brackets surrounding a
  label. The only way to allow customized autocompletion to work properly on
  the label is if you include the brackets in the scope of interest. I would
  like the cursor at the end of a scope to be considered part of that scope,
  until one types a character that is no longer part of that scope. (This idea
  makes sense to me as a type it, but I will be quite surprised if many people
  understood the gibberish I just typed :)


## Completions Limitations ##

Unfortunately, completions  are apparently  case sensitive. So  if you  have a
header `Introduction`, it will not show up  as a completion for `i`. I suppose
you can make  the best of this  and label all references with  lower case, and
use upper case for headers, allowing you to restrict your completion search by
using upper or lower case, but this seems like a limitation of TextMate.
