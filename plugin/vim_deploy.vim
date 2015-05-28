" Date Create: 2015-02-06 23:06:39
" Last Change: 2015-05-28 11:18:08
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Plugin = vim_lib#sys#Plugin#

let s:p = s:Plugin.new('vim_deploy', '1')

"" {{{
" @var string Имя адаптера для используемой пользователем системы развертывания.
"" }}}
let s:p.adapter = ''

call s:p.menu('Deploy', 'deploy', 1)
call s:p.menu('List', 'list', 2)
call s:p.menu('Edit', 'edit', 3)

call s:p.comm('Deploy', 'deploy()')
call s:p.comm('DeployRun', 'run("<args>")')
call s:p.comm('DeployList', 'list()')

call s:p.reg()
