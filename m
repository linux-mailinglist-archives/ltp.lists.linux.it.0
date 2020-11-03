Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB63D2A4FC1
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:13:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 733283C3021
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:13:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9F9F33C3041
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 495DE14012B2
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73594ABA2;
 Tue,  3 Nov 2020 19:13:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:16 +0100
Message-Id: <20201103191327.11081-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 00/11] 	Test metadata extraction
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

address some of the notes added by Li.

changes v1->v2:

3rd commit
https://patchwork.ozlabs.org/project/ltp/patch/20201005133054.23587-4-chrubis@suse.cz/
* add buf[i++] = c; to fix parsing ""
* check fname is valid before opening it
* fix some of checkpatch.pl problems

9th commit
* add perl-libwww-perl for fedora/centos

11 th commit
* add *.css *.js to CLEAN_TARGETS

TODO
* I didn't filter "options". But agree they should be handled better than now.
* some checkpatch.pl warnings left, do we want to bother?
docparse/docparse.c:53: WARNING: Missing a blank line after declarations
docparse/docparse.c:206: ERROR: do not use assignment in if condition
docparse/docparse.c:211: WARNING: Missing a blank line after declarations
docparse/docparse.c:246: ERROR: do not use assignment in if condition
docparse/docparse.c:288: WARNING: Missing a blank line after declarations
docparse/docparse.c:297: WARNING: static const char * array should probably be static const char * const
docparse/docparse.c:352: WARNING: static const char * array should probably be static const char * const
total: 2 errors, 5 warnings, 423 lines checked

* I didn't change docparse/README.md (4th commit, Jan had some notes,
could you phrase what should be there?)

Anything else to change?

Tested: https://travis-ci.org/github/pevik/ltp/builds/741217630

Kind regards,
Petr

Cyril Hrubis (4):
  docparse: Add test documentation parser
  docparse: Add README
  syscalls: Add a few documentation comments
  syscalls: Move needs_drivers inside of the tst_test struct

Petr Vorel (7):
  make: Support compiling native build tools
  travis: Add git
  make: Allow {INSTALL, MAKE}_TARGETS be a directory
  make: Allow CLEAN_TARGETS to remove directories
  travis: Install docparse dependencies
  docparse: Add configure options
  docparse: Generate html and pdf using asciidoc{, tor}

 Makefile                                      |   4 +
 configure.ac                                  |  32 +-
 docparse/.gitignore                           |   7 +
 docparse/Makefile                             |  77 ++++
 docparse/README.md                            | 248 ++++++++++
 docparse/data_storage.h                       | 299 ++++++++++++
 docparse/docparse.c                           | 423 +++++++++++++++++
 docparse/parse.sh                             |  41 ++
 docparse/testinfo.pl                          | 424 ++++++++++++++++++
 include/mk/config.mk.in                       |  21 +
 include/mk/env_post.mk                        |   3 +-
 include/mk/features.mk.in                     |   5 +
 include/mk/functions.mk                       |   3 +-
 include/mk/generic_leaf_target.inc            |  16 +-
 include/mk/rules.mk                           |   8 +
 m4/ax_compare_version.m4                      | 177 ++++++++
 m4/ax_prog_perl_modules.m4                    |  77 ++++
 m4/ltp-docparse.m4                            | 112 +++++
 testcases/kernel/syscalls/abort/abort01.c     |  16 +-
 testcases/kernel/syscalls/accept/accept01.c   |   8 +-
 testcases/kernel/syscalls/accept/accept02.c   |   7 +-
 testcases/kernel/syscalls/acct/acct01.c       |   5 +
 testcases/kernel/syscalls/acct/acct02.c       |   6 +-
 .../kernel/syscalls/fsetxattr/fsetxattr02.c   |  10 +-
 testcases/kernel/syscalls/ioctl/ioctl08.c     |   9 +-
 travis/alpine.sh                              |   4 +
 travis/debian.minimal.sh                      |   8 +-
 travis/debian.sh                              |  10 +-
 travis/fedora.sh                              |  13 +-
 travis/tumbleweed.sh                          |   9 +-
 30 files changed, 2043 insertions(+), 39 deletions(-)
 create mode 100644 docparse/.gitignore
 create mode 100644 docparse/Makefile
 create mode 100644 docparse/README.md
 create mode 100644 docparse/data_storage.h
 create mode 100644 docparse/docparse.c
 create mode 100755 docparse/parse.sh
 create mode 100755 docparse/testinfo.pl
 create mode 100644 m4/ax_compare_version.m4
 create mode 100644 m4/ax_prog_perl_modules.m4
 create mode 100644 m4/ltp-docparse.m4

-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
