Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7AAD016E
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jun 2025 13:49:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C6933CA01B
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jun 2025 13:49:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CB083C1934
 for <ltp@lists.linux.it>; Fri,  6 Jun 2025 13:49:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 95B14600AC7
 for <ltp@lists.linux.it>; Fri,  6 Jun 2025 13:49:56 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 389201F38E;
 Fri,  6 Jun 2025 11:49:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A1FC1336F;
 Fri,  6 Jun 2025 11:49:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eqXrBOPVQmh+UQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Jun 2025 11:49:55 +0000
Date: Fri, 6 Jun 2025 13:49:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ricardo =?utf-8?B?Qi4gTWFybGnDqHJl?= <rbm@suse.com>
Message-ID: <20250606114953.GE1289709@pevik>
References: <20250605-conversions-mknod-v5-0-0b5cff90c21c@suse.com>
 <20250605-conversions-mknod-v5-3-0b5cff90c21c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605-conversions-mknod-v5-3-0b5cff90c21c@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 389201F38E
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 3/8] syscalls/mknod03: Convert to new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ricardo,

>  testcases/kernel/syscalls/mknod/mknod03.c | 313 ++++--------------------------
>  1 file changed, 39 insertions(+), 274 deletions(-)

> diff --git a/testcases/kernel/syscalls/mknod/mknod03.c b/testcases/kernel/syscalls/mknod/mknod03.c
> index 7ecadb5b37c3ab7eded90aa8a6d1e27f07236b1f..00a6133f7a15c1dd9c9e67ba08315f218f16d0d6 100644
> --- a/testcases/kernel/syscalls/mknod/mknod03.c
> +++ b/testcases/kernel/syscalls/mknod/mknod03.c
> @@ -1,296 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only
nit: This should be v2+

// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
Because any later version.

It can be changed before merging.

Below is whole diff against the patchset I suggest.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/mknod/mknod03.c testcases/kernel/syscalls/mknod/mknod03.c
index 00a6133f7a..8cb9be9287 100644
--- testcases/kernel/syscalls/mknod/mknod03.c
+++ testcases/kernel/syscalls/mknod/mknod03.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines Corp., 2001
  *	07/2001 Ported by Wayne Boyer
diff --git testcases/kernel/syscalls/mknod/mknod04.c testcases/kernel/syscalls/mknod/mknod04.c
index ceb9565b4d..d96cb27b95 100644
--- testcases/kernel/syscalls/mknod/mknod04.c
+++ testcases/kernel/syscalls/mknod/mknod04.c
@@ -17,6 +17,7 @@
 #include "tst_test.h"
 
 #define MODE_RWX 0777
+#define MODE_FIFO (S_IFIFO | 0777)
 #define MODE_SGID (S_ISGID | 0777)
 
 #define TEMP_DIR "testdir"
@@ -29,7 +30,7 @@ static void run(void)
 {
 	struct stat buf;
 
-	SAFE_MKNOD(TEMP_NODE, MODE_RWX, 0);
+	SAFE_MKNOD(TEMP_NODE, MODE_FIFO, 0);
 
 	SAFE_STAT(TEMP_NODE, &buf);
 	TST_EXP_EQ_LI(buf.st_mode & S_ISGID, 0);
diff --git testcases/kernel/syscalls/mknod/mknod05.c testcases/kernel/syscalls/mknod/mknod05.c
index 4b7e957726..bfac9227b9 100644
--- testcases/kernel/syscalls/mknod/mknod05.c
+++ testcases/kernel/syscalls/mknod/mknod05.c
@@ -7,8 +7,8 @@
 
 /*\
  * Verify that mknod(2) succeeds when used to create a filesystem node with
- * set group-ID bit set on a directory with set group-ID bit set. The node
- * created should have set group-ID bit set and its gid should be equal to
+ * set-group-ID bit set on a directory with set-group-ID bit set. The node
+ * created should have set-group-ID bit set and its gid should be equal to
  * that of its parent directory.
  */
 
@@ -17,7 +17,7 @@
 #include "tst_test.h"
 
 #define MODE_RWX 0777
-#define MODE_SGID (S_ISGID | 0777)
+#define MODE_FIFO_SGID (S_IFIFO | S_ISGID | 0777)
 
 #define TEMP_DIR "testdir"
 #define TEMP_NODE TEMP_DIR "/testnode"
@@ -29,7 +29,7 @@ static void run(void)
 {
 	struct stat buf;
 
-	SAFE_MKNOD(TEMP_NODE, MODE_SGID, 0);
+	SAFE_MKNOD(TEMP_NODE, MODE_FIFO_SGID, 0);
 
 	SAFE_STAT(TEMP_NODE, &buf);
 	TST_EXP_EQ_LI(buf.st_mode & S_ISGID, S_ISGID);
@@ -48,7 +48,7 @@ static void setup(void)
 
 	SAFE_MKDIR(TEMP_DIR, MODE_RWX);
 	SAFE_CHOWN(TEMP_DIR, nobody_uid, free_gid);
-	SAFE_CHMOD(TEMP_DIR, MODE_SGID);
+	SAFE_CHMOD(TEMP_DIR, MODE_FIFO_SGID);
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
