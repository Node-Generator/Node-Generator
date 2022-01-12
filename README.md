# Node Generator

This repository is generating source code/files in your projects to help you build some NodeJs applications.

## Installation
1) Clone the repository in a location your user has read/write access.
    ```
    git pull git@github.com:Node-Generator/Node-Generator.git /your/installation/path
    ```
2) Authorize the script to get executed.
    ```
    chmod +x /your/installation/path/nodeGen.sh
    ```
3) Add an allias to your .bash_profile or .zshrc.
    ```
    alias nodeGen="your/installation/path/nodeGen.sh"
    ```
## Usage
```
cd /path/to/your/project/folder
nodeGen [TARGET]
```
The target is the name of any repository you can find in the [Node Generator GitHub Organization](https://github.com/Node-Generator).
:warning: Warning! When a TARGET is generated, it overwrites the existing files, you'd have to check your `git changes` and keep both, your previous version, and the new one (generated one).
## How does it work?
The script;
1) Clones the GitHub repository in his local installation folder (removes the previsous installation if it exist to get the latest version from the main branch)
2) Executes the `pre-generation.sh` script of the TARGET.
3) Copies the root files from the `root` folder of the TARGET in the `/` folder of your project.
4) Copies the source files from the `src` folder of the TARGET in the `/src` folder of your project
5) 2) Executes the `post-generation.sh` script of the TARGET.