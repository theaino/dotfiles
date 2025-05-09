hook global WinSetOption .* %{
  set -add buffer snippets \
    "begin / end" "^beg" %{ snippets-insert %[\begin{${1}}$n$n\end{$1}] }
}

