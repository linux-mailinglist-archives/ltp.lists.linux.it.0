Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79431D907
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Feb 2021 13:05:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9415F3C590D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Feb 2021 13:05:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 70EBD3C1C4E
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 13:05:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03ECE1A002CB
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 13:05:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42058B80C
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 12:05:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 17 Feb 2021 13:04:58 +0100
Message-Id: <20210217120459.17500-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lapi/io_uring.h: Define constants that may be
 missing
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

Early liburing headers did not include IOSQE_ASYNC and IOSQE_IO_HARDLINK.
Check for their presence separately even if the system header file is present
and define them if needed.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/lapi/io_uring.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/lapi/io_uring.h b/include/lapi/io_uring.h
index 9d280f155..897ed7c64 100644
--- a/include/lapi/io_uring.h
+++ b/include/lapi/io_uring.h
@@ -71,8 +71,6 @@ enum {
 	IOSQE_FIXED_FILE_BIT,
 	IOSQE_IO_DRAIN_BIT,
 	IOSQE_IO_LINK_BIT,
-	IOSQE_IO_HARDLINK_BIT,
-	IOSQE_ASYNC_BIT,
 };
 
 /*
@@ -84,10 +82,6 @@ enum {
 #define IOSQE_IO_DRAIN		(1U << IOSQE_IO_DRAIN_BIT)
 /* links next sqe */
 #define IOSQE_IO_LINK		(1U << IOSQE_IO_LINK_BIT)
-/* like LINK, but stronger */
-#define IOSQE_IO_HARDLINK	(1U << IOSQE_IO_HARDLINK_BIT)
-/* always go async */
-#define IOSQE_ASYNC		(1U << IOSQE_ASYNC_BIT)
 
 /*
  * io_uring_setup() flags
@@ -262,6 +256,17 @@ struct io_uring_probe {
 
 #endif /* IOSQE_FIXED_FILE */
 
+#ifndef IOSQE_IO_HADRLINK
+/* like LINK, but stronger */
+#define IOSQE_IO_HARDLINK_BIT	3
+#define IOSQE_IO_HARDLINK	(1U << IOSQE_IO_HARDLINK_BIT)
+#endif /* IOSQE_IO_HADRLINK */
+
+#ifndef IOSQE_ASYNC
+/* always go async */
+#define IOSQE_ASYNC_BIT		4
+#define IOSQE_ASYNC		(1U << IOSQE_ASYNC_BIT)
+#endif /* IOSQE_ASYNC */
 
 #ifndef HAVE_IO_URING_REGISTER
 static inline int io_uring_register(int fd, unsigned int opcode, void *arg,
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
