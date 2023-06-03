<p align="center" style="margin-bottom: 0px !important;">
  <img width="600" src="https://github.com/mithraskuipers/mithraskuipers/blob/master/readme_srcs/42/logo.png?raw=true" alt="42_Network_Amsterdam" align="center"> </p>
<h1 align="center" style="margin-top: 0px;">Inception <a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cl483ajsd008309l6suq9l256/project/3033162" alt="mikuiper's 42 Inception Score" /></a></h1>

<p align="center" style="margin-top: 0px;">
<img src="https://forthebadge.com/images/badges/made-with-c.svg"/>
<img src="https://forthebadge.com/images/badges/built-with-love.svg"/>
</p>

## :book: About the project

<em>Summary</em>: This project is about programming a function that returns a line read from a file descriptor.

<em>Goals</em>: This project will not only allow you to add a very convenient function to your collection, but it will also make you learn a highly interesting new concept in C programming: static variables.

<table>
<tbody>
<tr>
<td>Function name</td>
<td>get_next_line</td>
</tr>
<tr>
<td>Prototype</td>
<td>char *get_next_line(int fd);</td>
</tr>
<tr>
<td>Turn in files</td>
<td>get_next_line.c, get_next_line_utils.c, get_next_line.h</td>
</tr>
<tr>
<td>Parameters</td>
<td>fd: The file descriptor to read from</td>
</tr>
<tr>
<td>Return value</td>
<td>
<p>Read line: correct behavior</p>
<p>NULL: there is nothing else to read, or an error occurred</p>
</td>
</tr>
<tr>
<td>External functs.</td>
<td>read, malloc, free</td>
</tr>
<tr>
<td>Description</td>
<td>Write a function that returns a line read from a file descriptor</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

## Usage

To use the `get_next_line` function in your code, follow the steps below:

### :computer: Requirements

- `gcc` compiler

### :hammer_and_wrench: Building

1. Clone the repository that contains the `get_next_line` project.
2. Navigate to the root of the repository in your terminal.
3. Compile the project by running the following command, adding the corresponding source files and an optional `BUFFER_SIZE` flag (default = 42):

   ```bash
   gcc get_next_line.c get_next_line_utils.c -D BUFFER_SIZE=<size>
   ```

:runner: Running

After successfully building the project, you can include the `get_next_line` function in your own C program. Follow the steps below:

1. In your C program, include the header file `get_next_line.h` to access the `get_next_line` function.

2. Use the `get_next_line` function in your code, providing the file descriptor (fd) of the file you want to read from.

Here's an example of how to use `get_next_line` in a C program:

```c
#include "get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

int main(void)
{
    char *line;
    int fd;
    fd = open("file.txt", O_RDONLY);
    while ((line = get_next_line(fd)) != NULL)
    {
        printf("%s\n", line);
        free(line);
    }
    close(fd);
    return 0;
}

