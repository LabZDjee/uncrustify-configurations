# *Uncrustify* Indenter Configuration Files

Repo where favorite ***Uncrustify* configurations** are stored

*Uncrustify* is a source code indenter/beautifier for mainly C, C++, and C#

It is a good pick among other popular beautifiers like [GC Great Code](https://sourceforge.net/projects/gcgreatcode), [GNU Indent](https://www.gnu.org/software/indent), [Artistic Styler](http://astyle.sourceforge.net) mainly because it appears feature rich and not intrusive on some unexpected aspects

Construction of a configuration file with *Uncrustify* has been greatly simplified using UniversalIndentGUI which is cross-platform GUI which installs many beautifiers and offers a preview of all parameters those beautifiers offer as well as a live preview of their effect on source code

## Caveats

Macros should *not* end with a semi-column (`;`)

Also macros used alone on single line (statements, not expression) should be written with a semi-column

For example `#define SWAP_INT(x, y) { int _tmp=y; y=x; x=_tmp; }` should be used like this `SWAP_INT(a, b);` (notice the added semi-column which is strictly not required by the compiler)

*Uncrustify* does not like the *at* sign (`@`) which is used by some compilers (e.g. [IAR](https://www.iar.com)) to locate a function at a given address (e.g. `void fct(void) @ 0x80002458`). Best workaround found was to define this sign in a macro (`#define AT_LOCATION @`) and isolate it in an header file not touched by *Uncrustify*

# Style

Different indentation ***styles*** for C-like languages are described in a *Wikipedia* page: https://en.wikipedia.org/wiki/Indentation_style

Amon them most popular ones are *K&R style*, *Allman* (BSD) *style*, and *GNU style*. Difference are in block brace placement

In *K&R style*, opening brace is on the same line like the `if`, `do`, `while` and closing brace is aligned with the `if`, `do`, `while`

In *Allman style*, opening and closing brace are aligned with the `if`, `do`, `while` and use up a line

In *GNU style*, opening and closing brace are aligned with the `if`, `do`, `while`, use up a line and are indented. Internal code is then indented more

In all cases, code inside braces is indented

## Choices made

- No tab chars, indentation set at 1 character
- Spaces around expressions, no space after opening and before closing parentheses
- Braces for function code aligned with function block
- No parenthesis after `return` statement
- No more than one empty line
- One space after `if`, `switch`, `while`
- Almost no meddling with comments

# References

*Uncrustify*: https://github.com/uncrustify/uncrustify

*Universal Indent GUI*: http://universalindent.sourceforge.net