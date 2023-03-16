Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C473A6BC6FB
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Mar 2023 08:23:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6BAC3CD467
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Mar 2023 08:23:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A03FD3CD46B
 for <ltp@lists.linux.it>; Thu, 16 Mar 2023 08:22:48 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1C4FF6013A0
 for <ltp@lists.linux.it>; Thu, 16 Mar 2023 08:22:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A083E1FDEC;
 Thu, 16 Mar 2023 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678951367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jt8DoljBpYvFNkNLf79z5HQPlF3TpcCBa6jpaprfEd8=;
 b=QN3LetdpHoOgCa17doM6YFV7Xyp4+/LFn2hRF1LEgXFUXJLs1Aqa/EbqABRFJBKsxNgUrv
 +TWaNAP6tgT+uEsV/dNTjHZldd7ZjznIXFFtpxztJ/ENFgPnYFaA4W/8de6dLlKUtY9vq5
 OCapb+ex+n8SOeuGjHE14J14B5Ei77k=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2F6A133E0;
 Thu, 16 Mar 2023 07:22:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +DmTMMbDEmTiAQAAMHmgww
 (envelope-from <wegao@suse.com>); Thu, 16 Mar 2023 07:22:46 +0000
To: ltp@lists.linux.it
Date: Thu, 16 Mar 2023 03:22:30 -0400
Message-Id: <20230316072231.19157-2-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230316072231.19157-1-wegao@suse.com>
References: <20230302071555.18420-1-wegao@suse.com>
 <20230316072231.19157-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] Move semaphore/ tests to semop/
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

There is no point in having two different directories with semop()
testcaes so it would make sense to move these two tests into the
syscalls/ipc/semop/ directory as semop04 and semop05.
So we move ipc/semaphore/ tests to syscalls/ipc/semop/.
Also update runtest files accordingly.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 runtest/ipc                                   |  2 --
 runtest/syscalls                              |  2 ++
 testcases/kernel/ipc/semaphore/.gitignore     |  2 --
 testcases/kernel/ipc/semaphore/Makefile       | 30 -------------------
 .../kernel/syscalls/ipc/semop/.gitignore      |  2 ++
 testcases/kernel/syscalls/ipc/semop/Makefile  |  5 +++-
 .../sem01.c => syscalls/ipc/semop/semop04.c}  |  0
 .../sem02.c => syscalls/ipc/semop/semop05.c}  |  0
 8 files changed, 8 insertions(+), 35 deletions(-)
 delete mode 100644 testcases/kernel/ipc/semaphore/.gitignore
 delete mode 100644 testcases/kernel/ipc/semaphore/Makefile
 rename testcases/kernel/{ipc/semaphore/sem01.c => syscalls/ipc/semop/semop04.c} (100%)
 rename testcases/kernel/{ipc/semaphore/sem02.c => syscalls/ipc/semop/semop05.c} (100%)

diff --git a/runtest/ipc b/runtest/ipc
index a2135ed80..db7f7bed5 100644
--- a/runtest/ipc
+++ b/runtest/ipc
@@ -28,5 +28,3 @@ pipeio_8 pipeio -T pipeio_8 -c 5 -s 5000 -i 10 -u -f x80
 # spawns 5 children to write 10 chunks of 5000 bytes to an unnamed pipe
 # using non-blocking I/O
 
-sem01 sem01
-sem02 sem02
diff --git a/runtest/syscalls b/runtest/syscalls
index ae37a1192..54cbc6ece 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1239,6 +1239,8 @@ semget06 semget06
 semop01 semop01
 semop02 semop02
 semop03 semop03
+semop04 semop04
+semop05 semop05
 
 send01 send01
 send02 send02
diff --git a/testcases/kernel/ipc/semaphore/.gitignore b/testcases/kernel/ipc/semaphore/.gitignore
deleted file mode 100644
index 944e5ca1e..000000000
--- a/testcases/kernel/ipc/semaphore/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-/sem01
-/sem02
diff --git a/testcases/kernel/ipc/semaphore/Makefile b/testcases/kernel/ipc/semaphore/Makefile
deleted file mode 100644
index 9ab85745d..000000000
--- a/testcases/kernel/ipc/semaphore/Makefile
+++ /dev/null
@@ -1,30 +0,0 @@
-#
-#    testcases/kernel/ipc/semaphore Makefile.
-#
-#    Copyright (C) 2009, Cisco Systems Inc.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Ngie Cooper, July 2009
-#
-
-top_srcdir		?= ../../../..
-
-include $(top_srcdir)/include/mk/testcases.mk
-
-CPPFLAGS 		+= -I../include
-LDLIBS			+= -lpthread
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semop/.gitignore b/testcases/kernel/syscalls/ipc/semop/.gitignore
index bb57f08af..cc67b1862 100644
--- a/testcases/kernel/syscalls/ipc/semop/.gitignore
+++ b/testcases/kernel/syscalls/ipc/semop/.gitignore
@@ -1,3 +1,5 @@
 /semop01
 /semop02
 /semop03
+/semop04
+/semop05
diff --git a/testcases/kernel/syscalls/ipc/semop/Makefile b/testcases/kernel/syscalls/ipc/semop/Makefile
index 6b2b26d05..43afffb3f 100644
--- a/testcases/kernel/syscalls/ipc/semop/Makefile
+++ b/testcases/kernel/syscalls/ipc/semop/Makefile
@@ -7,6 +7,9 @@ LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LTPLDLIBS  = -lltpnewipc
+semop01: LTPLDLIBS  = -lltpnewipc
+semop02: LTPLDLIBS  = -lltpnewipc
+semop03: LTPLDLIBS  = -lltpnewipc
+semop05: LDLIBS    += -lpthread
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/ipc/semaphore/sem01.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
similarity index 100%
rename from testcases/kernel/ipc/semaphore/sem01.c
rename to testcases/kernel/syscalls/ipc/semop/semop04.c
diff --git a/testcases/kernel/ipc/semaphore/sem02.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
similarity index 100%
rename from testcases/kernel/ipc/semaphore/sem02.c
rename to testcases/kernel/syscalls/ipc/semop/semop05.c
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
