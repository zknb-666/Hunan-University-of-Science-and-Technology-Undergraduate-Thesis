# 湖南科技学院本科毕业论文模板

这是一个可直接上传到 [Overleaf](https://www.overleaf.com/) 的 XeLaTeX 中文论文模板。

## 使用方法

1. 将整个文件夹压缩为 `.zip`，在 Overleaf 中选择 **New Project → Upload Project** 上传。
2. 在 Overleaf 的 **Menu** 中将编译器设置为 **XeLaTeX**。
3. 将主文档设置为 `Huse.tex`，然后编译两遍以生成目录和正确页码。
4. 修改 `.tex` 文件中标有“替换为你的论文信息”的内容；图片放在 `figures/` 目录中。

模板所需的中文字体和 Times 字体已经放入 `fonts/`，源码使用项目内相对路径加载，不依赖 Overleaf 的系统字体。

## 文件结构

- `husethesis.cls`：文档类入口，继承 `ctexart` 并加载模板样式。
- `husestyle.sty`：页面、字体、标题、页码、目录、图表和辅助命令等格式定义。
- `Huse.tex`：论文正文和示例内容。
