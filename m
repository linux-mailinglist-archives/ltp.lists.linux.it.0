Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A40F336A
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:35:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A5B3C2352
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:35:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E13373C2210
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:35:30 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 30F441A009AD
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:35:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EA22AEF1;
 Thu,  7 Nov 2019 15:35:25 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu,  7 Nov 2019 16:34:56 +0100
Message-Id: <20191107153458.16917-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] LTP wrapper for Syzkaller reproducers
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
Cc: automated-testing@yoctoproject.org, dvyukov@google.com,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This allows the user to run ./configure --with-syzkaller-repros and it will
automatically fetch the reproducers and generate the necessary LTP runtest
files which use 'syzwrap' to wrap the Syzkaller reproducers.

Optimistically speaking, this should allow you to run the reproducers in your
normal LTP test setup if you reduce the timeouts and your test runner is
reasonably advanced (see README.md).

I have been testing this with a modified version of Metan's runltp-ng which
almost runs the reproducers smoothly ;-). We haven't got around to documenting
it yet, but you can find it here:

https://github.com/richiejp/runltp-ng/tree/syzkaller

I began adding some sandboxing to syzwrap from the Syzkaller executor, but I
found this simply broke many of the reproducers which need access to
TAP/TUN. I guess the reproducers can be regenerated with the sanboxing built
in if the user cares enough. However I have left in the ability for syzwrap to
optionally add some sandboxing. This does appear to help prevent the root file
system from being trashed at the cost of breaking some reproducers.

Of course if the test runner can reset the SUT to a good state, then the
sandboxing is not necessary. This is quite easy to do with QEMU using image
overlays.

Richard Palethorpe (2):
  Wrapper for Syzkaller reproducers
  lib: Allow timeout coefficient < 1

 .gitmodules                                  |   5 +
 configure.ac                                 |  11 ++
 include/mk/features.mk.default               |   2 +
 include/mk/features.mk.in                    |   2 +
 lib/tst_test.c                               |   2 +-
 runtest/.gitignore                           |   1 +
 testcases/kernel/Makefile                    |   1 +
 testcases/kernel/syzkaller-repros/.gitignore |   1 +
 testcases/kernel/syzkaller-repros/Makefile   | 100 ++++++++++++++
 testcases/kernel/syzkaller-repros/README.md  |  45 +++++++
 testcases/kernel/syzkaller-repros/syzwrap.c  | 133 +++++++++++++++++++
 11 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 runtest/.gitignore
 create mode 100644 testcases/kernel/syzkaller-repros/.gitignore
 create mode 100644 testcases/kernel/syzkaller-repros/Makefile
 create mode 100644 testcases/kernel/syzkaller-repros/README.md
 create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
