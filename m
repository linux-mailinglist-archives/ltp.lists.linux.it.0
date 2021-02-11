Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF98319166
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 18:46:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E0103C6908
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 18:46:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B7E733C6CFC
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 18:46:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 31C7D2010AD
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 18:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613065561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ybc9YCBSUzq3fG8aGAR7JebCUc7P5I+0GAXNiMB4cXo=;
 b=PY0/zCqdGlx290sJNb/cbzMOU7Fw8pCiQJup9ovn2EXyY9L2yaU1IFL8Q1TFg0uRpqiiz5
 yWGE3PAxt5FPbkiZ2ax6i3vCOoSGqxOAbm7g2wHgF8eYO5m7gmaz4lkKmPvoc04/sOxnVP
 MVUowdY+L6LtrKuxKvbWmFbilUbrzSg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85E7BAC43;
 Thu, 11 Feb 2021 17:46:01 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 17:45:38 +0000
Message-Id: <20210211174543.25003-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/5] Add close_range01, SAFE_DUP2 and SAFE_CLONE
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

This series adds a test for the new system call close_range. The
kernel selftests already added some tests, so I based this on those.

Also of note, is the addition of tst_clone and SAFE_CLONE which mirror
the clone3 interface. This is not really necessary for this test as it
is unlikely close_range is backported, but clone3 is not. OTOH I think
it will be usefull for other tests especially as the libc clone
wrapper seems to force the user to allocate the stack even though the
kernel can handle this. Also the clone_args is growing rapidly.

The old API has ltp_clone* functions, but I think we will have an
easier time tracking the clone3 interface, than what we were doing
with the old API.

V2:
* Add docs for tst_clone
* Add lapi/close_range.h

Richard Palethorpe (5):
  API: Add close_range syscall wrapper
  API: Add SAFE_DUP2
  API: Fix clone.h
  API: Add tst_clone
  close_range: Add test

 configure.ac                                  |   2 +
 doc/test-writing-guidelines.txt               |  27 ++-
 include/lapi/clone.h                          |   5 +-
 include/lapi/close_range.h                    |  28 +++
 include/lapi/syscalls/aarch64.in              |   1 +
 include/lapi/syscalls/arc.in                  |   1 +
 include/lapi/syscalls/arm.in                  |   1 +
 include/lapi/syscalls/hppa.in                 |   1 +
 include/lapi/syscalls/i386.in                 |   1 +
 include/lapi/syscalls/ia64.in                 |   1 +
 include/lapi/syscalls/mips_n32.in             |   1 +
 include/lapi/syscalls/mips_n64.in             |   1 +
 include/lapi/syscalls/mips_o32.in             |   1 +
 include/lapi/syscalls/powerpc.in              |   1 +
 include/lapi/syscalls/powerpc64.in            |   1 +
 include/lapi/syscalls/s390.in                 |   1 +
 include/lapi/syscalls/s390x.in                |   1 +
 include/lapi/syscalls/sh.in                   |   1 +
 include/lapi/syscalls/sparc.in                |   1 +
 include/lapi/syscalls/sparc64.in              |   1 +
 include/lapi/syscalls/x86_64.in               |   1 +
 include/tst_clone.h                           |  28 +++
 include/tst_safe_macros.h                     |   5 +
 include/tst_test.h                            |   2 +-
 lib/tst_clone.c                               |  46 ++++
 lib/tst_safe_macros.c                         |  18 ++
 lib/tst_test.c                                |  25 +++
 .../kernel/syscalls/close_range/.gitignore    |   1 +
 .../kernel/syscalls/close_range/Makefile      |  10 +
 .../syscalls/close_range/close_range01.c      | 200 ++++++++++++++++++
 30 files changed, 406 insertions(+), 8 deletions(-)
 create mode 100644 include/lapi/close_range.h
 create mode 100644 lib/tst_clone.c
 create mode 100644 testcases/kernel/syscalls/close_range/.gitignore
 create mode 100644 testcases/kernel/syscalls/close_range/Makefile
 create mode 100644 testcases/kernel/syscalls/close_range/close_range01.c

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
