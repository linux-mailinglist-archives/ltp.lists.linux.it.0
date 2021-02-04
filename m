Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4530ACCF
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A6B23C8EF0
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DCA3F3C8ED8
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00CC41A00A5A
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A44BAF94
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 16:39:49 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Feb 2021 17:39:45 +0100
Message-Id: <20210201163948.24783-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] Prevent linker issues in lapi/io_uring.h
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

Fallback io_uring syscall wrappers were not defined as static inline. This
will lead to linker issues when safe function variants get added to LTP
library.

Also add check for <linux/io_uring.h> to configure script and #include it
in the LAPI header if it's available.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 configure.ac            |  1 +
 include/lapi/io_uring.h | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 8bdb96300..9fb50c173 100644
--- a/configure.ac
+++ b/configure.ac
@@ -49,6 +49,7 @@ AC_CHECK_HEADERS_ONCE([ \
     linux/if_alg.h \
     linux/if_ether.h \
     linux/if_packet.h \
+    linux/io_uring.h \
     linux/keyctl.h \
     linux/mempolicy.h \
     linux/module.h \
diff --git a/include/lapi/io_uring.h b/include/lapi/io_uring.h
index 174e81e4d..9d280f155 100644
--- a/include/lapi/io_uring.h
+++ b/include/lapi/io_uring.h
@@ -18,6 +18,10 @@
 
 #include "lapi/syscalls.h"
 
+#ifdef HAVE_LINUX_IO_URING_H
+#include <linux/io_uring.h>
+#endif
+
 #ifndef IOSQE_FIXED_FILE
 
 #ifndef __kernel_rwf_t
@@ -260,8 +264,8 @@ struct io_uring_probe {
 
 
 #ifndef HAVE_IO_URING_REGISTER
-int io_uring_register(int fd, unsigned int opcode, void *arg,
-		      unsigned int nr_args)
+static inline int io_uring_register(int fd, unsigned int opcode, void *arg,
+	unsigned int nr_args)
 {
 	return tst_syscall(__NR_io_uring_register, fd, opcode, arg, nr_args);
 }
@@ -269,22 +273,23 @@ int io_uring_register(int fd, unsigned int opcode, void *arg,
 
 
 #ifndef HAVE_IO_URING_SETUP
-int io_uring_setup(unsigned int entries, struct io_uring_params *p)
+static inline int io_uring_setup(unsigned int entries,
+	struct io_uring_params *p)
 {
 	return tst_syscall(__NR_io_uring_setup, entries, p);
 }
 #endif /* HAVE_IO_URING_SETUP */
 
 #ifndef HAVE_IO_URING_ENTER
-int io_uring_enter(int fd, unsigned int to_submit, unsigned int min_complete,
-		   unsigned int flags, sigset_t *sig)
+static inline int io_uring_enter(int fd, unsigned int to_submit,
+	unsigned int min_complete, unsigned int flags, sigset_t *sig)
 {
 	return tst_syscall(__NR_io_uring_enter, fd, to_submit, min_complete,
 			flags, sig, _NSIG / 8);
 }
 #endif /* HAVE_IO_URING_ENTER */
 
-void io_uring_setup_supported_by_kernel(void)
+static inline void io_uring_setup_supported_by_kernel(void)
 {
 	if ((tst_kvercmp(5, 1, 0)) < 0) {
 		TEST(syscall(__NR_io_uring_setup, NULL, 0));
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
