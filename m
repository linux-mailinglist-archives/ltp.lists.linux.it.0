Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AAC6625E8
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jan 2023 13:53:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39BDF3CCBE8
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jan 2023 13:53:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 874BD3CCB6F
 for <ltp@lists.linux.it>; Mon,  9 Jan 2023 13:52:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 991A360025A
 for <ltp@lists.linux.it>; Mon,  9 Jan 2023 13:52:56 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8AF534377;
 Mon,  9 Jan 2023 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673268775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvC+OVc4oxjsWqy/LqOc7u2VGLS50uJsrLjnsdH0pI0=;
 b=aZDI2XIxq2/xqSpPODdQmo6xgUcXXoJwk4dNlKu5K7CQnEjz31WTwCgcV/3ZUX/8H4Uv8x
 CeJSZ8x+rvJisCKoM9GfyounfKCRdlj88TP5d1IdC3sRgO4AC1yaEfLVbeVpctuW5vj7kD
 nDJZl3MoRcpVsp8G7BiAAqSOvI7SVXE=
Received: from g78.cable.virginm.net (unknown [10.163.28.198])
 by relay2.suse.de (Postfix) with ESMTP id 5A82D2C142;
 Mon,  9 Jan 2023 12:52:55 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon,  9 Jan 2023 12:52:34 +0000
Message-Id: <20230109125234.4232-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109125234.4232-1-rpalethorpe@suse.com>
References: <20230109125234.4232-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] aiocp: Don't try to get tmpfs blocksize
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

TMPFS is backed by RAM and RAM is partitioned into "pages" not
"blocks". I don't know if TMPFS has a block size defined somewhere and
if this is accessible. Regardless it makes no sense to get it's
backing block device properties.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/io/ltp-aiodio/aiocp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/io/ltp-aiodio/aiocp.c b/testcases/kernel/io/ltp-aiodio/aiocp.c
index cace924a2..bc0e209b2 100644
--- a/testcases/kernel/io/ltp-aiodio/aiocp.c
+++ b/testcases/kernel/io/ltp-aiodio/aiocp.c
@@ -228,7 +228,10 @@ static void setup(void)
 		}
 	}
 
-	alignment = tst_dev_block_size(".");
+	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+		alignment = getpagesize();
+	else
+		alignment = tst_dev_block_size(".");
 
 	if (dstflags & O_DIRECT && aio_blksize % alignment)
 		tst_brk(TCONF, "Block size is not multiple of drive block size");
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
