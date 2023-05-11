%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chayut's Homework Class - Version 1.0
% chhomework.cls
%
% Copyright (c) 2023 Chayut Chunsamphran
% All rights reserved.
%
% You are permitted to use, modify, and distribute this software,
% free of charge, as long as you include this notice and
% give credit to the original author.
%
% THE SOFTWARE IS PROVIDED "AS IS," WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY,
% WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING
% FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
% OTHER DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chhomework}[2023/05/10 Chayut's Homework Class]
\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax

% PACKAGES
\LoadClass[12pt, oneside]{amsart}
\RequirePackage{chsymbol} % Chayut's Symbols Package
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % Typeset

\RequirePackage[margin=2cm]{geometry} % Margins
\RequirePackage{enumitem}
\RequirePackage{hyperref, cleveref}
\RequirePackage[nodisplayskipstretch]{setspace}
  \setstretch{1} 
\RequirePackage{needspace}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{ifthen}
% \RequirePackage[dvipsnames]{xcolor}
\RequirePackage[most]{tcolorbox}

\RequirePackage{lipsum}
\RequirePackage{mathtools}
% \RequirePackage{sagetex}





% THEOREM ENVIRONMENTS
\RequirePackage{thmtools}

\declaretheoremstyle[ % Question/problem style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\sffamily\bfseries,
  notefont=\mdseries,
  bodyfont=\sffamily,
  postheadspace=1em
]{problem}

\declaretheoremstyle[ % Solution/answer style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\scshape,
  bodyfont=\normalfont,
  postheadspace=1em,
  qed=$\square$
]{solution}

\declaretheoremstyle[ % Proof style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\scshape,
  bodyfont=\normalfont,
  postheadspace=1em,
  qed=$\blacksquare$
]{proof}

\declaretheoremstyle[ % Remark style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\small\normalfont\slshape,
  bodyfont=\small\normalfont,
  postheadspace=1em,
]{remark}

\declaretheoremstyle[ % Theorem style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\bfseries,
  notefont=\bfseries\slshape,
  bodyfont=\slshape,
  postheadspace=1em
]{thm}

\declaretheorem[ % Question
  refname={question,questions},
  Refname={Question,Questions},
  name=Question,
  style=problem]{question}

\declaretheorem[ % Problem
  refname={problem,problems},
  Refname={Problem,Problems},
  name=Problem,
  style=problem]{prob}

\declaretheorem[ % Answer
  refname={answer,answers},
  Refname={Answer,Answers},
  numbered=no,
  name = Answer,
  style=solution]{ans}

\declaretheorem[ % Solution
  refname={solution,solutions},
  Refname={Solution,Solutions},
  numbered=no,
  name = Solution,
  style=solution]{sol}

\declaretheorem[ % Proof
  refname={proof,proofs},
  Refname={Proof,Proofs},
  numbered=no,
  name = Proof,
  style=proof]{prf}

\declaretheorem[ % Remark
  refname={remark,remarks},
  Refname={Remark,Remarks},
  numbered=no,
  name = Remark,
  style=remark]{rem}

\declaretheorem[ % Theorem
  refname={theorem,theorems},
  Refname={Theorem,Theorems},
  name = Theorem,
  style=thm]{thm}

\declaretheorem[ % Proposition
  refname={proposition,propositions},
  Refname={Proposition,Propositions},
  name = Proposition,
  sibling=thm,
  style=thm]{prop}

\declaretheorem[ % Lemma
  refname={lemma,lemmas},
  Refname={Lemma,Lemmas},
  name = Lemma,
  sibling=thm,
  style=thm]{lem}

\declaretheorem[ % Definition
  refname={definition,definitions},
  Refname={Definition,Definitions},
  name = Definition,
  sibling=thm,
  style=thm]{defi}

\declaretheorem[ % Corollary
  refname={corollary,corollaries},
  Refname={Corollary,Corollaries},
  name = Corollary,
  sibling=thm,
  style=thm]{cor}

\declaretheorem[ % Boxed Theorem
  refname={theorem,theorems},
  Refname={Theorem,Theorems},
  name = Theorem,
  sibling=thm,
  style=thm]{boxthm}


\tcolorboxenvironment{boxthm}{enhanced jigsaw,drop shadow}



% THEOREM INDENT
\newlength{\remindent}
  \setlength{\remindent}{1cm}

\makeatletter
  \preto\ans{% ans indent
    \patchcmd\cref@thmnoarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\cref@thmoptarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\thmt@original@endans{\endtrivlist}{\endlist}{}{}%
  }
  \preto\sol{% sol indent
    \patchcmd\cref@thmnoarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\cref@thmoptarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\thmt@original@endsol{\endtrivlist}{\endlist}{}{}%
  }
  % \preto\prf{% proof indent
  %   \patchcmd\cref@thmnoarg
  %     {\trivlist}
  %     {\list{}{\leftmargin\parindent\rightmargin\parindent}}
  %     {}{}%
  %   \patchcmd\cref@thmoptarg
  %     {\trivlist}
  %     {\list{}{\leftmargin\parindent\rightmargin\parindent}}
  %     {}{}%
  %   \patchcmd\thmt@original@endprf{\endtrivlist}{\endlist}{}{}%
  % }
  \preto\rem{% remark indent
    \patchcmd\cref@thmnoarg
      {\trivlist}
      {\list{}{\leftmargin\remindent\rightmargin\remindent}}
      {}{}%
    \patchcmd\cref@thmoptarg
      {\trivlist}
      {\list{}{\leftmargin\remindent\rightmargin\remindent}}
      {}{}%
    \patchcmd\thmt@original@endrem{\endtrivlist}{\endlist}{}{}%
  }
\makeatother






% TITLE
\makeatletter
  \gdef\@author{\empty}
  \gdef\@course{\empty}
  \newcommand{\course}[1]{\gdef\@course{#1}}
  \renewcommand{\author}[1]{\gdef\@author{#1}}
  \renewcommand{\maketitle} {
    \begin{center}
      \Large \textsc{\@title} \\
      \normalsize
      \ifthenelse{\equal{\@course}{\empty}}{}{\textsc{\@course}\\}
      \bigskip\ifthenelse{\equal{\@author}{\empty}}{}{\textsf{\@author}\\}
      \@date
    \end{center}
    \rule{\linewidth}{1pt}
  }
\makeatother