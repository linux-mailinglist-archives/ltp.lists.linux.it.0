Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E744835B99
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jan 2024 08:29:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0BE43CCDC7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jan 2024 08:29:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18C8B3CC785
 for <ltp@lists.linux.it>; Mon, 22 Jan 2024 08:29:57 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7460810001B5
 for <ltp@lists.linux.it>; Mon, 22 Jan 2024 08:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705908595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8azJEhChaea9qiFbqMX2WIvUGhM/p2bCqHGdmwXuP5Y=;
 b=hUmwPTfjSkXn5gc1i8WbFk5hnHRVpgotY2FWvlu1RYKE2kt51fesRVaBL9vFLkLpVohKvp
 +8Hef5B8FaT+pFBrnT88hpVIBl+PjL48FLJVmm4aBijv4z7NU1qkv/Qr3cz90UOuz/C0HY
 SONVQClzC0TYvFn1jSrKwb3oKGGs8gM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-5C6m8zw6OcGfwsuTbMStNw-1; Mon, 22 Jan 2024 02:29:52 -0500
X-MC-Unique: 5C6m8zw6OcGfwsuTbMStNw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4581C101A526
 for <ltp@lists.linux.it>; Mon, 22 Jan 2024 07:29:52 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD14492BC6
 for <ltp@lists.linux.it>; Mon, 22 Jan 2024 07:29:51 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jan 2024 15:29:45 +0800
Message-Id: <20240122072948.2568801-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/4] libswap: add known swap supported fs check
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

This introduce an enhancement to the library's is_swap_supported
function to check for filesystem compatibility before attempting
to create and enable a swap file.  A list of supported filesystems
is added (ext2, ext3, ext4, xfs, vfat, exfat, ntfs), and a check
against this list is performed to ensure that the swap operations
are only attempted on known compatible filesystems.

If the make_swapfile function fails, the error handling is now
more descriptive: it distinguishes between failures due to the
filesystem not supporting swap files and other types of failures.
Similarly, when attempting to enable the swap file with swapon,
the patch ensures that clearer error messages are provided in
cases where the operation is not supported by the filesystem.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 libs/libltpswap/libswap.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/libs/libltpswap/libswap.c b/libs/libltpswap/libswap.c
index 13610709e..623f2fb3c 100644
--- a/libs/libltpswap/libswap.c
+++ b/libs/libltpswap/libswap.c
@@ -12,6 +12,17 @@
 #include "libswap.h"
 #include "lapi/syscalls.h"
 
+static const char *const swap_supported_fs[] = {
+	"ext2",
+	"ext3",
+	"ext4",
+	"xfs",
+	"vfat",
+	"exfat",
+	"ntfs",
+	NULL
+};
+
 /*
  * Make a swap file
  */
@@ -40,23 +51,31 @@ int make_swapfile(const char *swapfile, int safe)
  */
 void is_swap_supported(const char *filename)
 {
+	int i, sw_support = 0;
 	int fibmap = tst_fibmap(filename);
 	long fs_type = tst_fs_type(filename);
 	const char *fstype = tst_fs_type_name(fs_type);
 
-	int ret = make_swapfile(filename, 1);
-	if (ret != 0) {
-		if (fibmap == 1)
-			tst_brk(TCONF, "mkswap on %s not supported", fstype);
-		else
-			tst_brk(TFAIL, "mkswap on %s failed", fstype);
+	for (i = 0; swap_supported_fs[i]; i++) {
+		if (!strcmp(fstype, swap_supported_fs[i])) {
+			sw_support = 1;
+			break;
+		}
 	}
 
+       int ret = make_swapfile(filename, 1);
+       if (ret != 0) {
+               if (fibmap == 1 && sw_support == 0)
+                       tst_brk(TCONF, "mkswap on %s not supported", fstype);
+               else
+                       tst_brk(TFAIL, "mkswap on %s failed", fstype);
+       }
+
 	TEST(tst_syscall(__NR_swapon, filename, 0));
 	if (TST_RET == -1) {
 		if (errno == EPERM)
 			tst_brk(TCONF, "Permission denied for swapon()");
-		else if (fibmap == 1 && errno == EINVAL)
+		else if (fibmap == 1 && errno == EINVAL && sw_support == 0)
 			tst_brk(TCONF, "Swapfile on %s not implemented", fstype);
 		else
 			tst_brk(TFAIL | TTERRNO, "swapon() on %s failed", fstype);
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
