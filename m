Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65596109868
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 05:54:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2944F3C220C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 05:54:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 135CC3C131B
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 05:54:37 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A3FB9201554
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 05:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574744073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OiuEfjtr+EpKeQ0CWXqqnTs1I+tz/mkxCu3Hc+w20D8=;
 b=ac6NUp7mhk1mZSAFsRbNqwJfHFn5tH1qHqH88uxe9mDQmTUAGofByHVynZdK/onZextDO1
 JD1uJFOmSrAqDCYLETTxLy050/W64o7rA7UwHX6PzDaXv2mBWgWGJ0pBVMC4VJYk2VKRbT
 KsOzRqNOQnVbZND7BprStFadWZbVDts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-xZ6lZwgQMeiZ1ilSa8rKow-1; Mon, 25 Nov 2019 23:54:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF44DB20;
 Tue, 26 Nov 2019 04:54:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8B9A600C6;
 Tue, 26 Nov 2019 04:54:26 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 12:54:22 +0800
Message-Id: <20191126045422.12808-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: xZ6lZwgQMeiZ1ilSa8rKow-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] tst_fill_fs: enhance the filesystem filling routine
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

Do more tries with size in half when write() getting ENOSPC, until the size
is less than the filesystem block size. Though we can't really fill a filesystem
full, this could make the routine more robust.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Jan Stancek <jstancek@redhat.com>
Cc: Martin Doucha <mdoucha@suse.cz>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
---

Notes:
    v2 --> v3
       * move the condition judgment into while loop
       * reserve the print&return part in the loop

 lib/tst_fill_fs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
index 4003dce97..121dd2f20 100644
--- a/lib/tst_fill_fs.c
+++ b/lib/tst_fill_fs.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/statvfs.h>
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
@@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
 	size_t len;
 	ssize_t ret;
 	int fd;
+	struct statvfs fi;
+	statvfs(path, &fi);
 
 	for (;;) {
 		len = random() % (1024 * 102400);
@@ -41,6 +44,13 @@ void tst_fill_fs(const char *path, int verbose)
 			ret = write(fd, buf, MIN(len, sizeof(buf)));
 
 			if (ret < 0) {
+				/* retry on ENOSPC to make sure filesystem is really full */
+				if (errno == ENOSPC && len >= fi.f_bsize/2) {
+					SAFE_FSYNC(fd);
+					len /= 2;
+					continue;
+				}
+
 				SAFE_CLOSE(fd);
 
 				if (errno != ENOSPC)
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
