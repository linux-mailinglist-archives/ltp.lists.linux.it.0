Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F754FC21
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 19:21:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BE233C0932
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 19:21:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFE093C8D8E
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 19:20:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 57C901A01456
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 19:20:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A5501F8B4;
 Fri, 17 Jun 2022 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655486440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wiYsJ713P8wiQXp0y7NfujkzlMx7BJtUTGgN07e8nU=;
 b=b7vhpG0uDakaF7+7MhNdf4+DYY5eNxBfF+4zc6OjbwyfWe8BZ+kzRiECfZMFoTR296tyXg
 S0vCe+G8uop3oSanj1Avo6MY/knjJM5Mq84OtB8DEuYSTuWJQ4cW7YrZQHslzzCgXOh74X
 IYCgoR+mGV65bl7nIRtUINIDTYD5Rf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655486440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wiYsJ713P8wiQXp0y7NfujkzlMx7BJtUTGgN07e8nU=;
 b=PKhlu7v4ez31O1ydR9/co61BrUktH5fjmFaPSn93YofmrmRAlHHF23UlJ3dQHYUTyuo9AM
 WCWz809YBBErELCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECB7E1348E;
 Fri, 17 Jun 2022 17:20:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yL6VLue3rGKacwAAMHmgww
 (envelope-from <akumar@suse.de>); Fri, 17 Jun 2022 17:20:39 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 17 Jun 2022 22:50:22 +0530
Message-Id: <20220617172025.23975-4-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617172025.23975-1-akumar@suse.de>
References: <20220617172025.23975-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/6] Remove unnecessary header includes
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/utime/utime03.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/utime/utime03.c b/testcases/kernel/syscalls/utime/utime03.c
index 2358fd70b..0c64518d2 100644
--- a/testcases/kernel/syscalls/utime/utime03.c
+++ b/testcases/kernel/syscalls/utime/utime03.c
@@ -18,11 +18,8 @@
  * - The user ID of the process has write access to the file.
  */
 
-#include <sys/types.h>
 #include <pwd.h>
 #include <utime.h>
-#include <sys/stat.h>
-#include <time.h>
 
 #include "tst_test.h"
 #include "tst_uid.h"
@@ -60,7 +57,7 @@ static void run(void)
 	struct stat statbuf;
 	time_t mintime, maxtime;
 
-	utbuf.modtime = time(0) - 5;
+	utbuf.modtime = tst_get_fs_timestamp() - 5;
 	utbuf.actime = utbuf.modtime + 1;
 	TST_EXP_PASS_SILENT(utime(TEMP_FILE, &utbuf));
 	SAFE_STAT(TEMP_FILE, &statbuf);
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
