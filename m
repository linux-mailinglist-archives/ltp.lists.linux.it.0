Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFE8A153
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F188D3C1D2F
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 43B303C0752
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E7E6E1A010F4
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97F4FADEF
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:44 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:33 +0200
Message-Id: <20190812143941.8119-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 03/11] doc: Add guarded buffers documentation
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 doc/test-writing-guidelines.txt | 68 +++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 573dd08d9..e5ee2fef0 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1699,6 +1699,74 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
+2.2.31 Guarded buffers
+^^^^^^^^^^^^^^^^^^^^^^
+
+The test library also supports guarded buffers, which are buffers allocated so
+that:
+
+* The end of the buffer is followed by PROT_NONE page
+
+* The rest of the page before the buffer is filled with random canary
+
+Which means that the any access after the buffer with yield Segmentation
+fault or EFAULT depending on if the access happened in userspace or kernel
+respectively. The canary before the buffer will also catch any write access
+outside of the buffer.
+
+The purpose of the patch is to catch off-by-one bugs happening while buffers
+and structures are passed to syscalls. New tests should allocate guarded
+buffers for all data passed to the tested syscall which are passed by a
+pointer.
+
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
+static struct foo *foo_ptr;
+static struct iovec *iov;
+static void *buf_ptr;
+static char *id;
+...
+
+static void run(void)
+{
+	...
+
+	foo_ptr->bar = 1;
+	foo_ptr->buf = buf_ptr;
+
+	...
+}
+
+static void setup(void)
+{
+	...
+
+	id = tst_strdup(string);
+
+	...
+}
+
+static struct tst_test test = {
+	...
+	.bufs = (struct tst_buffers []) {
+		{&foo_ptr, .size = sizeof(*foo_ptr)},
+		{&buf_ptr, .size = BUF_SIZE},
+		{&iov, .iov_sizes = (int[]){128, 32, -1},
+		{}
+	}
+};
+-------------------------------------------------------------------------------
+
+Guarded buffers can be allocated on runtime in a test setup() by a
+'tst_alloc()' or by 'tst_strdup()' as well as by filling up the .bufs array in
+the tst_test structure.
+
+So far the tst_test structure supports allocating either a plain buffer by
+setting up the size or struct iovec, which is allocated recursively including
+the individual buffers as described by an '-1' terminated array of buffer
+sizes.
 
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
