Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CD8401B0E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:19:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60A8E3C9786
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:19:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 239B53C25B5
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:19:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 99AFD1000A28
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:19:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C80551FEEB
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630930783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ByMTxGxIA/3Ip7POWw8C2mMNARphck1BOMmQS7sQdRM=;
 b=JysO1bnCBYem7gZw0araKzUBd08sNUPH3igevIeFqPxOMiuzKJVaTZxIT/qs3v4jap/Hc2
 J8w8nsogdegbBM5dDxd3ZDAqoju+XVpzPna0ycRj3J9aX2FNlKTVKg26HUhBlg6I7bp8Sp
 knghajcjWbUibgSiChc83PRGAOUFX8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630930783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ByMTxGxIA/3Ip7POWw8C2mMNARphck1BOMmQS7sQdRM=;
 b=DJpk6Le3rumz8C/wq5qSpt9/Oa5j86cfPbvoSQ/ZbaP/qhNJQR6PIyfeHRIrV7xn78Xqmx
 PxDvQ81SFRJz0gBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B670013C1B
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 12:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yUWgK18HNmF9OAAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 06 Sep 2021 12:19:43 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  6 Sep 2021 14:19:54 +0200
Message-Id: <20210906121954.11569-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/mkdir02: Reformat the
 description comment
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

So that it's picked up by doc parser.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/mkdir/mkdir02.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/mkdir/mkdir02.c b/testcases/kernel/syscalls/mkdir/mkdir02.c
index 2cb199c56..7fa055b8d 100644
--- a/testcases/kernel/syscalls/mkdir/mkdir02.c
+++ b/testcases/kernel/syscalls/mkdir/mkdir02.c
@@ -3,10 +3,12 @@
  * Copyright (c) International Business Machines Corp., 2001
  */
 
-/*  DESCRIPTION
- *  This test will verify that new directory created by mkdir(2) inherites
- *  the group ID from the parent directory and S_ISGID bit, if the S_ISGID
- *  bit is set in the parent directory.
+/*\
+ * [Description]
+ *
+ * Verify that new directory created by mkdir(2) inherites the group ID from
+ * the parent directory and S_ISGID bit, if the S_ISGID bit is set in the
+ * parent directory.
  */
 
 #include <sys/stat.h>
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
