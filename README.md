# 湖南科技学院本科毕业论文模板

这是一个可直接上传到 [Overleaf](https://www.overleaf.com/) 的 XeLaTeX 中文论文模板。

## 使用方法

1. 将整个文件夹压缩为 `.zip`，在 Overleaf 中选择 **New Project → Upload Project** 上传。
2. 在 Overleaf 的 **Menu** 中将编译器设置为 **XeLaTeX**。
3. 将主文档设置为 `huse.tex`，然后编译两遍以生成目录和正确页码。
4. 修改 `.tex` 文件中标有“替换为你的论文信息”的内容；图片放在 `figures/` 目录中。

模板所需的中文字体（宋体、黑体、楷体、仿宋、华文中宋）和 Times 字体已经放入 `fonts/`，
源码使用项目内相对路径加载，不依赖 Overleaf 的系统字体。

## 文件结构

- `husethesis.cls`：文档类入口，继承 `ctexart` 并加载模板样式。
- `husestyle.sty`：页面、字体、标题、页码、目录、图表等**全部样式**；以及下面这些
  供填写用的高层命令（具体数值/尺寸都已在该文件中按模板 PDF 实测写好）。
- `huse.tex`：只放**内容**，样式全部调用 `husestyle.sty` 里的命令（见下）。

## 在 `huse.tex` 中填写内容（样式已内置，无需改动）

| 区块 | 写法 | 说明 |
|---|---|---|
| 封面 | `\makecover{中文题}{英题1}{英题2}{姓名}{学号}{院系}{专业年级}{导师}{日期}` | 9 个参数，标签宽、行距、横幅尺寸、下划线均已内置 |
| 诚信声明 | `\begin{integritystatement} 声明正文 \end{integritystatement}` | 正文一般不用改；日期用 `\integritydate{…}`、手写签名图片用 `\integritysignature[height=1.2cm]{路径}`（图片缺失只告警不报错） |
| 目录 | `\maketoc` | 自动罗马数字 II 起 |
| 中文摘要 | `\begin{cnabstract}{论文题目}{关键词} 正文 \end{cnabstract}` | 关键词用全角分号隔开 |
| 英文摘要 | `\begin{enabstract}{英文题目}{Keywords} 正文 \end{enabstract}` | Keywords 用半角分号 |
| 正文 | `\startmainbody` 后直接写 `\section{章}\subsection{节}…` | 每章另起一页、首行基线已自动处理，**不要再写** `\chaptertopskip`/`\normaltopskip` |
| 插图 | `\fig[宽度]{文件名}{图题}` | 居中、`图X-X` 编号、五号宋体图题、`htbp` 浮动全部内置，**编号与 `\label` 自动生成**；宽度写 `[14.6cm]` 或 `[width=14.6cm]` 均可，省略为 `0.8\textwidth`；文件名默认在 `figures/`（用 `\setfigpath{…}` 可改目录），也可写完整路径 |
| 表格 | `\begin{tbl}{列格式}{表题} … \end{tbl}` | 表题在上方（`表X-X`）、表内五号宋体+1.25 倍行距内置，**编号与 `\label` 自动生成**；配合 `booktabs` 的 `\toprule/\midrule/\bottomrule` 即三线表 |
| 正文引用图/表 | `\figref{图题}` / `\tabref{表题}` | 自动输出编号（`2-1`/`4-1`）；带星号形式 `\figref*{图题}` 输出`图2-1`（表同理）。增删图表后编号变化，正文不用改 |
| 参考文献 | `\begin{references} \bibitem{key} 条目 \end{references}` | 悬挂缩进、编号格式、行距已内置，只填条目；条目 `[n]` 自动编号，增删条目后正文不用改 |
| 正文引用文献 | `\cite{key}`（上标形式 `\upcite{key}`） | 自动输出 `[n]`，与文献表编号一致；`key` 就是 `\bibitem{key}` 的名字 |
| 致谢 | `\plainsection{致\quad 谢}` | 无编号一级标题，已另起一页并进目录 |

插图 / 表格的简化写法示例（原来 6 行 → 现在 1 行）：

```latex
% 插图：宽度 + 文件名 + 图题，编号与标签自动生成，不用写 fig:2-1
\fig[14.6cm]{fig2-1_springmvc.png}{SpringMVC实现原理}

% 表格：列格式 + 表题，内部就是普通 tabular（三线表）
\begin{tbl}{llll}{字典表}
  \toprule
  名字 & 类型 & 约束 & 注释 \\
  \midrule
  ID & NUMBER(10) & 非空 & ID号 \\
  \bottomrule
\end{tbl}
```

正文里不要手写编号，用题名引用（编译两遍后自动变成正确编号）：

```latex
Mybatis工作流程如图\figref{SpringMVC实现原理}所示。   % → 如图2-1所示
具体结构如表\tabref{字典表}所示。                      % → 如表4-1所示
见\figref*{SpringMVC实现原理}。                        % → 见图2-1（带“图”字）
```

> 正文一级标题（`\section`）现在会自动在章首页调整首行基线，不要再手动加
> `\chaptertopskip` / `\normaltopskip`。若某段首行缩进需与模板 docx 一致地用 21pt
> （模板中 1.2 节各段即如此），可在该段前写 `\setlength{\parindent}{21pt}`，下一段前用
> `\setlength{\parindent}{2\ccwd}` 恢复 24pt。

## Word 字号与行距换算

`husestyle.sty` 中统一按下列规则换算（注释里已注明）：

- 字号：初号42 小初36 一号26 小一24 二号22 小二18 三号16 小三15 四号14 小四12 五号10.5 小五9
- Word「单倍行距」≈ **1.486 × 字号**；「N 倍行距」= N × 1.486 × 字号
  （实测：四号 1.5 倍 = 31.2pt，五号 1.25 倍 = 19.5pt，四号 单倍 = 20.8pt）
- Word「固定行距 N 磅」= N pt（如正文 20 磅、目录 25 磅）

## 页顶首行位置（Word 与 LaTeX 的差异）

Word 的首行基线位置随该行字号变化，而 LaTeX 的 `\topskip` 只能按页统一设置，
故模板用「按页/按节设置 `\topskip`」来还原，实测值与模板 PDF 误差 ≤ 0.5pt：

| 位置 | 首行字号 | `\topskip` |
|---|---|---|
| 诚信声明标题 | 小二 18pt | 24pt |
| 目录标题、摘要题目、章标题 | 三号 16pt | 21pt（正文页内章标题为 22.6pt） |
| 正文、参考文献、致谢 | 小四/四号 | 17.8pt |

另外实测 LaTeX 首页首行盒高比 Word 大 1.6pt，故正文页版心上移 1.6pt
（`\newgeometry{top=2.4836cm,...}`）作整体补偿。

封面信息表按模板 PDF 实测重建：表格总宽 360pt（标签列 3.44cm / 填写列 9.25cm）、
页面居中、单元格左右内边距 5.4pt、行基线间距 31pt，英文题目两行间距 31pt。
