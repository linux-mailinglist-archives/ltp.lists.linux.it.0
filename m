Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C160D103521
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 08:23:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 881583C1CF5
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 08:23:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C18A33C1814
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 08:23:54 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3C89120109D
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 08:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574234632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aeQOj+9/Bb2l4VlHde3/4ENjvf1ZwDGvVR9kHtJU1mE=;
 b=aiA9D3P0xdCMUoCy7m615Aw06i2N+f+xgtEYU2fMtYNYX6jSso9S7UeTOaQfcciY+CGgAW
 eMf6fzNgb0yhKhmO8n0yNavG4Yv/mCd3LmHPzOy6WfNb0Ko0qVoVPYOqwIbZjeBbiEXHSh
 ZHT99tu9B1SEwLuznzPGBexn/uE3Q0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-d9caF7a5MrCnfasy3om1Vw-1; Wed, 20 Nov 2019 02:23:50 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C891005509;
 Wed, 20 Nov 2019 07:23:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 606F21000328;
 Wed, 20 Nov 2019 07:23:48 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 20 Nov 2019 15:23:11 +0800
Message-Id: <20191120072311.32333-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: d9caF7a5MrCnfasy3om1Vw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_fill_fs: enhance the filesystem filling routine
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
---
 lib/tst_fill_fs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
index 4003dce97..3015c066e 100644
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
@@ -37,17 +40,20 @@ void tst_fill_fs(const char *path, int verbose)
 			return;
 		}
 
-		while (len) {
+		while (len >= fi.f_bsize/2) {
 			ret = write(fd, buf, MIN(len, sizeof(buf)));
 
 			if (ret < 0) {
+				if (errno == ENOSPC) {
+					SAFE_FSYNC(fd);
+					len /= 2;
+					continue;
+				}
+
 				SAFE_CLOSE(fd);
 
 				if (errno != ENOSPC)
 					tst_brk(TBROK | TERRNO, "write()");
-
-				tst_res(TINFO | TERRNO, "write()");
-				return;
 			}
 
 			len -= ret;
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
