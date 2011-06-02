începător eşti în timpul parcurgerii celui de-al doilea capitol
(cu excepţia primelor trei exerciţii, care fac parte din
[novice](novice.md)).

Dacă nu foloseşti linux, atunci roagă un alt cursant să-ţi trimită
cursul .pdf complet, în loc de preview-ul pe care l-ai descărcat
direct de pe github.

După aceea, citeşte cu atenţie teoria. Întreabă acolo unde nu
înţelegi ceva. Rezolvă exerciţiile pe rând, ca şi până acum,
trecând la următorul exerciţiu după ce un tutore ţi-a spus că
soluţia ta e perfectă.

Dacă nu e nimeni disponibil care să-ţi trimită cartea, încearcă
să generezi singur PDF-ul. Va trebui să înveţi să foloseşti
git şi să accesezi clonezi repo-ul cu sursa cărţii

    git://github.com/OriginalCopy/yap-phpro-book.git

Cu git oricum vei fi forţat de împrejurări să lucrezi în
stadiul următor [mediu](mediu.md), deci timpul nu ţi l-ai
pierde degeaba.

Adiţional vei avea nevoie de LaTeX şi GNU Make.
Întreabă pe canalul de suport al distribuţiei tale
cum instalezi LaTeX (texlive) şi GNU Make.

Sub ArchLinux (vei mai jos pentru detalii) aceste
pachete se numesc make şi texlive-core, deci instalarea
se face aşa:

    pacman -Syu make texlive-most

În shell, scrie

    make

şi ar trebui să ai fişierul PDF cel mai actual.

Mediul în care poţi instala cel mai uşor aceste scule este GNU/Linux.
Oricum majoritatea serverelor web de producţie, adevărate,
folosesc o formă sau alta de \*NIX, deci nu vei învăţa degeaba să
lucrezi cu el.

Dacă deţii toate aceste cunoştinţe, îţi va lua cel mult 5 minute
pentru a avea PDF-ul.

Deşi teoretic ar trebui să funcţioneze şi sub MS Windows, din
experienţele noastre acest sistem nu oferă o platformă prietenoasă
pentru programatori. De aceea te încurajăm să treci pe Linux.

Nu recomandăm o distribuţie anume, dar în comunitatea noastră
s-a cristalizat un fangroup [ArchLinux](http://archlinux.org/),
deci cu această distribuţie te putem ajuta şi noi.

Dacă alegi o altă distribuţie, simte-te liber să apelezi la
channel-ul său de suport, de exemplu #debian sau #ubuntu, pe freenode.
