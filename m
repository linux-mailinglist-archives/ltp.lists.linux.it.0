Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E582BA5902B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Mar 2025 10:48:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99AE33CA1F5
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Mar 2025 10:48:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 737533C9FAA
 for <ltp@lists.linux.it>; Mon, 10 Mar 2025 10:47:57 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6531810007F5
 for <ltp@lists.linux.it>; Mon, 10 Mar 2025 10:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741600075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6WjrXdIrYzTG11kCqS3bBt6NyeIuYMdYLd4ilxMAYsQ=;
 b=bK5pif3qsOsMFgqD6XYIp8FD1CP099stdML3+2RsZd9k0GkreF1xCoiXJV08UeFiczvJDx
 Oh0IZlBuzYKA17ZdawffpVkIbsSJ4fGGWzEIcowqzahCpIfCNRMRtBosJIt+CjUgHY1CGp
 lhg3R9WM5ro+dIcWZwPJJy1hUFu2SsU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-8t-9oZkCMpK9fgwm2fdTBw-1; Mon,
 10 Mar 2025 05:47:53 -0400
X-MC-Unique: 8t-9oZkCMpK9fgwm2fdTBw-1
X-Mimecast-MFC-AGG-ID: 8t-9oZkCMpK9fgwm2fdTBw_1741600072
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 747E61955DDF
 for <ltp@lists.linux.it>; Mon, 10 Mar 2025 09:47:52 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 46D0518009AE
 for <ltp@lists.linux.it>; Mon, 10 Mar 2025 09:47:50 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 10 Mar 2025 17:47:45 +0800
Message-ID: <20250310094745.142249-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: St96GV2NKH8l3iNbXzpisGMj9je-nYR8X6R980uXHxY_1741600072
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] ioctl_loop06: Update block size validation to align
 with kver
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

The kernel commit 47dd6753 ("block/bdev: lift block size restrictions to 64k")
now supports block sizes larger than PAGE_SIZE, with a new upper limit of
BLK_MAX_BLOCK_SIZE (64K). But ioctl_loop06 still assumes that PAGE_SIZE is the
maximum allowed block size, causing failures on newer kernels (>= 6.14):

  ioctl_loop06.c:74: TINFO: Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE
  ioctl_loop06.c:57: TFAIL: Set block size succeed unexpectedly
  ...
  ioctl_loop06.c:74: TINFO: Using LOOP_CONFIGURE with block_size > PAGE_SIZE
  ioctl_loop06.c:57: TFAIL: Set block size succeed unexpectedly

This patch updates ioctl_loop06 to use BLK_MAX_BLOCK_SIZE instead of PAGE_SIZE
for block size validation. Also adjust failure expectations based on the
running kernel version.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop06.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
index 573871bc1..321754108 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
@@ -17,6 +17,8 @@
 #include "lapi/loop.h"
 #include "tst_test.h"
 
+#define BLK_MAX_BLOCK_SIZE 0x00010000 /* SZ_64K */
+
 static char dev_path[1024];
 static int dev_num, dev_fd, file_fd, attach_flag, loop_configure_sup = 1;
 static unsigned int invalid_value, half_value, unalign_value;
@@ -31,7 +33,7 @@ static struct tcase {
 	"Using LOOP_SET_BLOCK_SIZE with arg < 512"},
 
 	{&invalid_value, LOOP_SET_BLOCK_SIZE,
-	"Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE"},
+	"Using LOOP_SET_BLOCK_SIZE with arg > BLK_MAX_BLOCK_SIZE"},
 
 	{&unalign_value, LOOP_SET_BLOCK_SIZE,
 	"Using LOOP_SET_BLOCK_SIZE with arg != power_of_2"},
@@ -40,7 +42,7 @@ static struct tcase {
 	"Using LOOP_CONFIGURE with block_size < 512"},
 
 	{&invalid_value, LOOP_CONFIGURE,
-	"Using LOOP_CONFIGURE with block_size > PAGE_SIZE"},
+	"Using LOOP_CONFIGURE with block_size > BLK_MAX_BLOCK_SIZE"},
 
 	{&unalign_value, LOOP_CONFIGURE,
 	"Using LOOP_CONFIGURE with block_size != power_of_2"},
@@ -106,8 +108,8 @@ static void setup(void)
 	tst_fill_file("test.img", 0, 1024, 1024);
 	half_value = 256;
 	pg_size = getpagesize();
-	invalid_value = pg_size * 2 ;
 	unalign_value = pg_size - 1;
+	invalid_value = (tst_kvercmp(6, 14, 0) < 0) ? pg_size * 2 : BLK_MAX_BLOCK_SIZE + 1;
 
 	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 	ret = ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, 512);
-- 
2.48.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
