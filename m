Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE32722C2
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 13:40:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A428D3C606A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 13:40:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C58443C29BF
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 13:39:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1137B200913
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 13:39:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFA0BAF2A;
 Mon, 21 Sep 2020 11:40:34 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 21 Sep 2020 13:40:26 +0200
Message-Id: <20200921114026.11184-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921114026.11184-1-chrubis@suse.cz>
References: <20200921114026.11184-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] runtest/quickhit: Remove
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The file wasn't properly maintained for last ten years, 99% of the
patches touching it were only removing removed tests. We should stop
pretending that it's useful anyhow it clearly does not contain well
selected set of tests for quick testrun anymore.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: "Bird, Tim" <Tim.Bird@sony.com>
CC: Petr Vorel <pvorel@suse.cz>
---
 runtest/quickhit | 316 -----------------------------------------------
 1 file changed, 316 deletions(-)
 delete mode 100644 runtest/quickhit

diff --git a/runtest/quickhit b/runtest/quickhit
deleted file mode 100644
index b17318b65..000000000
--- a/runtest/quickhit
+++ /dev/null
@@ -1,316 +0,0 @@
-#DESCRIPTION:A small subset of the syscalls
-access01 access01
-# Basic test for access(2) using F_OK, R_OK, W_OK and X_OK arguments.
-access03 access03
-# EFAULT error testing for access(2)
-alarm02 alarm02
-# Boundary Value Test for alarm(2)
-#    TEST CASES
-#      Test Case One - A call to alarm() shall not return an error if
-#       seconds is a -1.
-#       Test FAILS if a non-zero value is returned.
-#      Test Case Two - A call to alarm() shall not return an error if
-#       seconds is the maximum unsigned integer (2**63).
-#       Test FAILS if a non-zero value is returned.
-#      Test Case Three - A call to alarm() shall not return an error if
-#       seconds is the maximum unsigned integer plus 1 ((2**63)+1).
-#       Test FAILS if a non-zero value is returned.
-alarm03 alarm03
-# alarm(2) cleared by a fork
-#    TEST CASES
-# 	1.) alarm(100), fork, child's alarm(0) shall return 0;
-#	2.) alarm(100), fork, parent's alarm(0) shall return non-zero.
-brk01 brk01
-# Basic test for brk()
-#    TEST CASES
-# 	1.) brk(2) returns...
-chdir01 chdir01
-# Basic test for chdir(2)
-#    TEST CASES
-# 	1.) chdir(2) returns...
-chmod02 chmod02
-# Basic test for chmod(2)
-#    TEST CASES
-# 	1.) chmod(2) returns...
-chown01 chown01
-# Basic test for chown(2)
-#    TEST CASES
-# 	1.) chown(2) returns...
-close08 close08
-# Basic test for close(2)
-#    TEST CASES
-# 	1.) close(2) returns...
-dup01 dup01
-# Basic test for dup(2)
-#    TEST CASES
-# 	1.) dup(2) returns...(See Description)
-dup02 dup02
-#  Negative test for dup(2) with bad fd
-#    TEST CASES
-# 	1-?.) dup(2) returns -1 with errno set to EBADF...(See Description)
-dup03 dup03
-# Negative test for dup(2) (too many fds)
-dup04 dup04
-# Basic test for dup(2) of a system pipe descriptor
-dup05 dup05
-# Basic test for dup(2) of a named pipe descriptor
-execl01 execl01
-# Basic test for execl(2)
-execle01 execle01
-# Basic test for execle(2)
-execlp01 execlp01
-# Basic test for execlp(2
-execv01 execv01
-# Basic test for execv(2)
-execve01 execve01
-# Basic test for execve(2)
-execvp01 execvp01
-# Basic test for execvp(2)
-f00f f00f
-# This is a simple test for handling of the pentium f00f bug.
-# It is an example of a catistrophic test case.  If the system
-# doesn't correctly handle this test, it will likely lockup.
-fchmod01 fchmod01
-# Basic test for fchmod(2) using 0700 argument.
-fchown01 fchown01
-# Basic test for fchown(2)
-fcntl02 fcntl02
-# Basic test for fcntl(2) using F_DUPFD argument
-fcntl03 fcntl03
-# Basic test for fcntl(2) using F_GETFD argument
-fcntl04 fcntl04
-# Basic test for fcntl(2) using F_GETFL argument
-fcntl05 fcntl05
-# Basic test for fcntl(2) using F_GETLK argument
-fcntl07 fcntl07
-# Close-On-Exec of named pipe functional test
-fcntl08 fcntl08
-# Basic test for fcntl(2) using F_SETFL argument
-fcntl09 fcntl09
-# Basic test for fcntl(2) using F_SETLK argument
-fcntl10 fcntl10
-# Basic test for fcntl(2) using F_SETLKW argument
-fork01 fork01
-# Basic test for fork(2)
-#    TEST CASES
-# 	1.) fork returns without error
-# 	2.) fork returns the pid of the child
-fork04 fork04
-# Child inheritance of Environment Variables after fork()
-#    TEST CASES
-#       Test these environment variables correctly inherited by child:
-#       1. TERM
-#       2. NoTSetzWq
-#       3. TESTPROG
-fork05 fork05
-# This is a test sent in my Ulrich Drepper to test for a bug in fork() where
-# %gs is not handled correctly.  See fork05.c for a copy of Ulrich's email
-fpathconf01 fpathconf01
-# Basic test for fpathconf(2)
-fstatfs01 fstatfs01
-# Basic test for fstatfs(2)
-fsync01 fsync01
-# Basic test for fsync(2)
-getegid01 getegid01
-# Basic test for getegid(2)
-geteuid01 geteuid01
-# Basic test for geteuid(2)
-getgid01 getgid01
-# Basic test for getgid(2)
-getgroups01 getgroups01
-# Getgroups system call critical test
-#    TEST CASES
-# 	1. Check to see if getgroups(-1, gidset) fails and sets errno to EINVAL
-# 	2. Check to see if getgroups(0, gidset) does not return -1 and gidset is
-# 	not modified.
-# 	3. Check to see if getgroups(x, gigset) fails and sets errno to EINVAL,
-# 	where x is one less then what is returned by getgroups(0, gidset).
-# 	4. Check to see if getgroups() succeeds and gidset contains
-# 	group id returned from getgid().
-gethostid01 gethostid01
-# Basic test for gethostid(2)
-gethostname01 gethostname01
-# Basic test for gethostname(2)
-getpgrp01 getpgrp01
-# Basic test for getpgrp(2)
-getpid01 getpid01
-# Basic test for getpid(2)
-getppid01 getppid01
-# Basic test for getppid(2)
-getuid01 getuid01
-# Basic test for getuid(2)
-kill02 kill02
-# Sending a signal to processes with the same process group ID.
-kill09 kill09
-# Basic test for kill(2)
-link02 link02
-# Basic test for link(2)
-link03 link03
-# multi links tests
-link04 link04
-# Negative test cases for link(2)
-link05 link05
-# multi links (EMLINK) negative test
-lseek01 lseek01
-lseek02 lseek02
-lseek07 lseek07
-lseek11 lseek11
-# Negative test for lseek(2) of a pipe
-lstat02 lstat02
-# Basic test for lstat(2)
-qmm01 mmap001 -m 1
-# Basic mmap() test.
-open03 open03
-# Basic test for open(2)
-pathconf01 pathconf01
-# Basic test for pathconf(2)
-pause01 pause01
-# Basic test for pause(2)
-read01 read01
-# Basic test for read(2)
-readdir01 readdir01
-# write multiple files and try to find them with readdir
-#    TEST CASES
-# 	1.) Create n files and check that readdir() finds n files
-readlink01 readlink01
-# Basic test for readlink(2)
-rename02 rename02
-# Basic test for rename(2)
-sbrk01 sbrk01
-# Basic test for sbrk(2)
-select01 select01
-# select to a file
-#    TEST CASES
-#      1.) select(2) to a fd of regular file with no I/O and small timeout
-select02 select02
-# select of system pipe fds
-select03 select03
-select04 select04
-# select of fd of a named-pipe (FIFO)
-setgid01 setgid01
-# Basic test for setgid(2)
-setpgid01 setpgid01
-# Basic test for setpgid(2)
-setpgrp01 setpgrp01
-# Basic test for setpgrp(2)
-setregid01 setregid01
-# Basic test for setregid(2)
-setreuid01 setreuid01
-# Basic test for setreuid(2)
-setuid01 setuid01
-# Basic test for setuid(2)
-sighold02 sighold02
-# Holding all signals
-signal03 signal03
-# Boundary value and other invalid value checking of signal setup
-# and signal sending.
-sigrelse01 sigrelse01
-# Releasing held signals
-statfs01 statfs01
-# Basic test for statfs(2) mounted filesys
-statvfs01 statvfs01
-# Basic test for statvfs(2) mounted filesys
-sync01 sync01
-# Basic test for sync(2)
-time01 time01
-# Basic test for time(2)
-times01 times01
-# Basic test for times(2)
-ulimit01 ulimit01
-# Basic test for ulimit(2)
-umask01 umask01
-# Basic test for umask(2)
-uname01 uname01
-# Basic test for uname(2)
-unlink05 unlink05
-# Basic test for unlink(2)
-unlink07 unlink07
-# unlink(2) negative testcases
-unlink08 unlink08
-# unlink(2) negative testcases
-wait02 wait02
-# Basic test for wait(2)
-write01 write01
-# Basic test for write(2)
-symlink01 symlink01
-# Make a Symbolic Link to a File
-#    TEST CASES
-# 	1. Create symbolic link with abnormal object name path
-# 	2. Create symbolic link with normal object name path
-# 	3. Create symbolic link with path to an existing object file
-# 	4. Receive EEXIST error when creating an already existing symbolic link file.
-# 	5. Receive ENAMETOOLONG error when creating symbolic link which exceeds PATH_MAX in length
-symlink02 symlink02
-# Basic test for symlink(2)
-readlink01A symlink01 -T readlink01
-# Reads Value of a Symbolic Link
-#    TEST CASES
-# 	1. Read a symbolic link file which points at no object file
-# 	2. Read a symbolic link file which points at an object file
-# 	3. Receive ENAMETOOLONG error when reading symbolic link which exceeds PATH_MAX in length
-# 	4. Receive an EINVAL error when reading a file which is not a symbolic
-# link file.
-stat04 symlink01 -T stat04
-# Gets File Status Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Get object file status through symbolic link file
-# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
-# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
-lstat01A symlink01 -T lstat01
-# Get file Status About a Symbolic Link File
-#    TEST CASES
-# 	1. Get symbolic link file status when pointing at no object file
-# 	2. Get symbolic link file status when pointing at an object file
-# 	3. Get object file status when argument is not a symbolic link
-# file.
-mkdir05A symlink01 -T mkdir05
-# Fail When Making a Directory File Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Receive EEXIST error when creating a directory through a symbolic link file
-rmdir03A symlink01 -T rmdir03
-# Fail When Removing a Directory File Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Receive ENOTDIR error when removing an existing directory through a symbolic link file
-chdir01A symlink01 -T chdir01
-# Changes Current Working DIrectory Location Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Change current working directory through a symbolic link file
-# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
-# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
-link01 symlink01 -T link01
-# Creates a Link To a File Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Link an object file to a new file through symbolic link file
-# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
-# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
-unlink01 symlink01 -T unlink01
-# Removes a Link To a File And Not Any Object File Which Maybe Pointed At
-#    TEST CASES
-# 	1. Delete a symbolic link file and not the object file which it points at
-chmod01A symlink01 -T chmod01
-# Change Object File Permissions Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Change file permissions of object file through a symbolic link file
-# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
-# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
-utime01A symlink01 -T utime01
-# Set File Access And Modify Object File Times Indirectly From a Symbolic Link File
-#    TEST CASES
-# 	1. Change inode times of object file through a symbolic link file
-# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
-# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
-rename01A symlink01 -T rename01
-# Rename a Symbolic Link File And Not Any Object File
-#    TEST CASES
-# 	1. Rename a symbolic link file which points at no object file
-# 	2. Rename a symbolic link file which points at an object file without any object file alterations.
-# 	3. Receive EXDEV when trying to rename a symbolic link file to an address outside of current file system
-open01A symlink01 -T open01
-# Create/Open a File For Reading Or Writing Indirectly From a Symbolic Link File
-#    TEST CASES
-#  	1. Create an object file through a symbolic link file
-#  	2. Open an object file through a symbolic link file
-#  	3. Receive EEXIST error when exclusively creating an object file through a symbolic link file
-#  	4. Receive ENOENT error when accessing non-existent object file through symbolic link file
-#  	5. Receive ELOOP error when nesting of symbolic links exceed maximum
-
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
