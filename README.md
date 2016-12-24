# 一、cocoVim
个人的vim配置项目

主要在exvim的结构上进行了修改，所有的配置在文件.vimrc.plugins里,只需要克隆下项目到本地，2行简单配置即可使用

#install
##Source cocoVim to your current Vim

1.Suppose you download/update cocoVim in the path ~/cocoVim. 

2.Edit your vimrc file, default is ~/.vimrc in Mac/Linux and C:\Users\your_name\_vimrc in Windows.

3.In your vimrc file, just write:

<pre><code>let g:exvim_custom_path='~/cocoVim/'
source ~/cocoVim/.vimrc
</code></pre>

##其他一些增强功能可参照
http://exvim.github.io/downloads/



# 二、cocoVim Simple版更吸引人(本人正在使用)

只支持命令行下vim，插件更少，更轻量级，但是包含了最基本的配置。

#install

clone the project to your local `~/cocoVim`

add `source ~/cocoVim/simple/.vimrc` in `~/.vimrc`

open vim, and `:PluginInstall` install plugins


screenshot in commond line:

![A screenshot of your package](https://raw.githubusercontent.com/8427003/cocoVim/master/screenshots/cocoVim.png)

# 三、from vim to neovim

 1. 按照neovvim官方文档 brew 安装neovim
 
 2. do as :help nvim-from-vim

## 遇到的问题：
1. E576: Failed to parse ShaDa file: extra bytes in msgpack string at position 3
    
    解：删除~/.viminfo（与以前的vim共用估计格式不兼容，故删除重新生成文件）
    （https://github.com/neovim/neovim/issues/3469#issuecomment-148897966）
    
2. youcomelateme，提示python....
    解：需要安装provider-python 
    `pip2 install --user --upgrade neovim`
    （https://neovim.io/doc/user/provider.html#provider-python）
