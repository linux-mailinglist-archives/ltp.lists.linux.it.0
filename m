Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D96625E6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jan 2023 13:53:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E63C33CCBDE
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jan 2023 13:53:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 125083CB5A0
 for <ltp@lists.linux.it>; Mon,  9 Jan 2023 13:52:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9EFD21A0088C
 for <ltp@lists.linux.it>; Mon,  9 Jan 2023 13:52:57 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 155D64375;
 Mon,  9 Jan 2023 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673268775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6K5+i1usSHJFOuHtuEeHp8XTQeghPKK0TpIWiC1cjeA=;
 b=Yg1QzoSe/FReLGDz++LZnBH6PwhJGHQ0kVOg+WgvviZwmn+Oji0YfZOUeCNU60Zu/C3Pjq
 Bvygai8M9gslbYn1EcHkcP797nbcnNuDX2iDcazjb2Ce1RamtQqziaCG0KvMc++pFNJNAG
 U5uXR2If4tMU1BYY3ne3KGk8IFvZ7jI=
Received: from g78.cable.virginm.net (unknown [10.163.28.198])
 by relay2.suse.de (Postfix) with ESMTP id CF41B2C141;
 Mon,  9 Jan 2023 12:52:54 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon,  9 Jan 2023 12:52:32 +0000
Message-Id: <20230109125234.4232-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] aiocp.c: TCONF on O_DIRECT on tmpfs
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

From: Petr Vorel <pvorel@suse.cz>

O_DIRECT is not supported on tmpfs. This flag is added by -f option,
thus cannot be filtered with .skip_filesystems.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/io/ltp-aiodio/aiocp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/io/ltp-aiodio/aiocp.c b/testcases/kernel/io/ltp-aiodio/aiocp.c
index ee893ab11..275000f3e 100644
--- a/testcases/kernel/io/ltp-aiodio/aiocp.c
+++ b/testcases/kernel/io/ltp-aiodio/aiocp.c
@@ -240,6 +240,9 @@ static void setup(void)
 		if (strncmp(str_oflag, "SYNC", 4) == 0) {
 			dstflags |= O_SYNC;
 		} else if (strncmp(str_oflag, "DIRECT", 6) == 0) {
+			if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+				tst_brk(TCONF, "O_DIRECT not supported on tmpfs");
+
 			srcflags |= O_DIRECT;
 			dstflags |= O_DIRECT;
 		}
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
