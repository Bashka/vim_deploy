" Date Create: 2015-02-06 23:11:26
" Last Change: 2015-02-06 23:48:02
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Object = vim_lib#base#Object#
let s:Buffer = vim_lib#sys#Buffer#

" Deployer {{{
"" {{{
" Данный класс определяет интерфейс адаптеров систем развертывания, используемых пользователем.
" Класс-адапрет для конкретной системы развертывания должен реализовать приведенный интерфейс.
"" }}}
let s:Class = s:Object.expand()

"" {{{
" Метод возвращает список доступных задач.
" @return string Список доступных задач.
"" }}}
function! s:Class.list() " {{{
endfunction " }}}

"" {{{
" Метод выполняет развертывание проекта.
"" }}}
function! s:Class.deploy() " {{{
endfunction " }}}

"" {{{
" Метод выполняет указанную задачу.
" @param string task Имя целевой задачи.
"" }}}
function! s:Class.run(task) " {{{
endfunction " }}}

let g:vim_deploy#Deployer = s:Class
" }}}

"" {{{
" Метод возвращает объект-адаптер используемой системы развертывания.
" @return vim_deploy#Deployer Объект-адаптер используемой системы развертывания.
"" }}}
function! vim_deploy#getDeployer() " {{{
  exe 'return g:' . g:vim_deploy#.deployer . '#deployer.new()'
endfunction " }}}

"" {{{
" Метод возвращает список доступных задач.
" @return string Список доступных задач.
"" }}}
function! vim_deploy#list() " {{{
  let l:buf = s:Buffer.new('Deploy-list')
  " Закрыть окно, если оно уже открыто. {{{
  if l:buf.getWinNum() != -1
    call l:buf.delete()
    return 0
  endif
  " }}}
  call l:buf.temp()
  function! l:buf.render() " {{{
    return vim_deploy#getDeployer().list()
  endfunction " }}}
  call l:buf.gactive('t')
endfunction " }}}

"" {{{
" Метод выполняет развертывание проекта.
"" }}}
function! vim_deploy#deploy() " {{{
  call vim_deploy#getDeployer().deploy()
endfunction " }}}

"" {{{
" Метод выполняет указанную задачу.
" @param string task Имя целевой задачи.
"" }}}
function! vim_deploy#run(task) " {{{
  call vim_deploy#getDeployer().run(a:task)
endfunction " }}}
