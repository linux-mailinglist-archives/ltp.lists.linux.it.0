Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA63283690
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C91A53C4B47
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 291FD3C26BF
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 907F01000AFA
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C072B201;
 Mon,  5 Oct 2020 13:30:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  5 Oct 2020 15:30:43 +0200
Message-Id: <20201005133054.23587-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 00/11] Test metadata extraction
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

This patchset adds a test metadata extraction into LTP and also
documentation generator that produces browseable HTML documentation from
the exported metadata. For detailed description of the idea and
implementation see the patch that adds README.md.

While the idea is quite new the code is mature enough to be included in
the upstream repository and I'm also worried that we will not get any
feedback or users of the metadata unless it's included in the upstream
git.

The next step is to use the extracted metadata in runltp-ng in the proof
of concept parallel executor that has been written by Ritchie and posted
to this mailing list as well.

Cyril Hrubis (4):
  docparse: Add test documentation parser
  docparse: Add README
  syscalls: Add a few documentation comments
  syscalls: Move needs_drivers inside of the tst_test struct

Petr Vorel (7):
  make: Support compiling native build tools
  travis: Add git
  make: Allow {INSTALL,MAKE}_TARGETS be a directory
  make: Allow CLEAN_TARGETS to remove directories
  travis: Install docparse dependencies
  docparse: Add configure options
  docparse: Generate html and pdf using asciidoc{,tor}

 Makefile                                      |   4 +
 configure.ac                                  |  32 +-
 docparse/.gitignore                           |   7 +
 docparse/Makefile                             |  77 ++++
 docparse/README.md                            | 248 ++++++++++
 docparse/data_storage.h                       | 299 ++++++++++++
 docparse/docparse.c                           | 415 +++++++++++++++++
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
 travis/fedora.sh                              |  12 +-
 travis/tumbleweed.sh                          |   9 +-
 30 files changed, 2034 insertions(+), 39 deletions(-)
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
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
