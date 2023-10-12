# internsctl(1) - Bash Script for System Information and User Management

## NAME

internsctl - Manage system information and users.

## SYNOPSIS

**internsctl** [OPTIONS]

## DESCRIPTION

**internsctl** is a Bash script for managing system information and users. It provides various options to retrieve information about the CPU, memory, files, and users. Additionally, it supports creating new users.

## OPTIONS

- **--help**
  Display the help message, showing a list of available options and their descriptions.

- **--version**
  Display the script version information.

- **cpu getinfo**
  Display CPU information using the `lscpu` command.

- **memory getinfo**
  Display memory information using the `free` command.

- **user list**
  Display a list of all users on the system.

- **user list --sudo-only**
  Display a list of users with sudo privileges.

- **user create \<username\>**
  Create a new user with the specified username.

- **file getinfo \<filename\>**
  Display information about a file, including size, permissions, owner, and last modification time.

## OPTIONS FOR FILE GETINFO

- **-s, --size \<filename\>**
  Display the size (in bytes) of the specified file.

- **-p, --permissions \<filename\>**
  Display the file's permissions in human-readable format.

- **-o, --owner \<filename\>**
  Display the owner of the specified file.

- **-m, --last-modified \<filename\>**
  Display the last modification time of the specified file.

