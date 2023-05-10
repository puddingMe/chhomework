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
\RequirePackage[OT1]{fontenc}
\RequirePackage{boisik} % Typeset

\RequirePackage[margin=2cm]{geometry} % Margins
\RequirePackage{hyperref, cleveref}
\RequirePackage{lipsum} 
\RequirePackage{mathtools}
\RequirePackage{needspace}
\RequirePackage[framemethod=TikZ]{mdframed}





% THEOREM ENVIRONMENTS
\RequirePackage{thmtools}

\declaretheoremstyle[ % Question/problem style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\bfseries,
  notefont=\normalfont\bfseries,
  bodyfont=\normalfont,
  postheadspace=1em
]{problem}

\declaretheoremstyle[ % Solution/answer style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\small\normalfont\scshape,
  bodyfont=\small\normalfont,
  postheadspace=1em,
  qed=$\square$
]{solution}

\declaretheoremstyle[ % Proof style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\small\normalfont\scshape,
  bodyfont=\small\normalfont,
  postheadspace=1em,
  qed=$\blacksquare$
]{proof}

\declaretheoremstyle[ % Remark style
  spaceabove=6pt, spacebelow=6pt,
  headfont=\small\normalfont\slshape,
  bodyfont=\small\normalfont,
  postheadspace=1em,
]{remark}

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
  style=plain]{thm}

\declaretheorem[ % Proposition
  refname={proposition,propositions},
  Refname={Proposition,Propositions},
  name = Proposition,
  sibling=thm,
  style=plain]{prop}

\declaretheorem[ % Lemma
  refname={lemma,lemmas},
  Refname={Lemma,Lemmas},
  name = Lemma,
  sibling=thm,
  style=plain]{lem}

\declaretheorem[ % Definition
  refname={definition,definitions},
  Refname={Definition,Definitions},
  name = Definition,
  sibling=thm,
  style=plain]{defi}

\declaretheorem[ % Corollary
  refname={corollary,corollaries},
  Refname={Corollary,Corollaries},
  name = Corollary,
  sibling=thm,
  style=plain]{cor}







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
  \preto\prf{% proof indent
    \patchcmd\cref@thmnoarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\cref@thmoptarg
      {\trivlist}
      {\list{}{\leftmargin\parindent\rightmargin\parindent}}
      {}{}%
    \patchcmd\thmt@original@endprf{\endtrivlist}{\endlist}{}{}%
  }
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