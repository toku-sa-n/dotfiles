K: look up the manpage for the word under the cursor
J: join the current and next lines together
C-[: equal to Esc.
<C-r><C-p>
<C-r>=: open a prompt at the bottom of the screen where we can type the expression that we want to evaluate.
<C-v><Tab>: タブをそのまま入力する．
InsertキーでInsertとReplaceを切り替えられる．
<C-o>(in Insert): InsertNormalmode.
,: ;の逆方向
gv: Reselect the last visual selection.
o(in Visual): Go to other end of highlighted text
it: htmlのタグの中身を選択．
vで選択する時，ドットコマンドは使わない．
VisualモードでIやAを押すと，選択範囲の最初あるいは最後に挿入される．選択されている全ての行に挿入される．
<C-r>=(in Insert): 計算して結果を挿入
<C-r>{register}: 番号registerのregisterの内容を貼り付け．0でpと等価．In insertmode.
