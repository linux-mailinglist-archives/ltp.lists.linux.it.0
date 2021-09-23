Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D294A415FBC
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 15:27:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 401333CA1DF
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 15:27:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C783E3C6AE0
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 15:27:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2BA782010EE
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 15:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A69322364
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632403670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TecP6ahXSRTm00XZIOLBkedLrq7GOY0cpbprXHhQum0=;
 b=ivnJe4xcElQ+eM5T/cm4uTO7oIQAXfI92ark5gAbNrWY3j5Ef/m0oMiM7IYy3j2Z7blGMb
 w7GJ6s0U1tzCmgrcqiCD840PCDLcilZZiWGECvze+V4ZsZIfy4duTOyNI8aNJcGxTh02U+
 VJAUMNekahYLuuz4bluRH4ybVqWghAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632403670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TecP6ahXSRTm00XZIOLBkedLrq7GOY0cpbprXHhQum0=;
 b=yOFz0z7ZL1KtqCPEhpETKjlAMkPHo8YSokSUwtOJ0atFjcRhXnfnTEp+8yWsQpjh2CmIYx
 PTUVYkDApjuG6XDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4173613E71
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 13:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AGYSD9aATGEjSwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 13:27:50 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Sep 2021 15:27:49 +0200
Message-Id: <20210923132749.6383-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923132749.6383-1-mdoucha@suse.cz>
References: <20210923132749.6383-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/utime03: Fix timestamp checks
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

The timestamps set by utime(path, NULL) may slightly lag behind time() return
values. Use get_fs_timestamp() to get the correct expected time range.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/utime/utime03.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/utime/utime03.c b/testcases/kernel/syscalls/utime/utime03.c
index f581273f7..d120b63ee 100644
--- a/testcases/kernel/syscalls/utime/utime03.c
+++ b/testcases/kernel/syscalls/utime/utime03.c
@@ -26,6 +26,7 @@
 
 #include "tst_test.h"
 #include "tst_uid.h"
+#include "tst_clocks.h"
 
 #define MNTPOINT	"mntpoint"
 #define TEMP_FILE	MNTPOINT"/tmp_file"
@@ -71,9 +72,9 @@ static void run(void)
 	}
 
 	SAFE_SETEUID(user_uid);
-	mintime = time(0);
+	mintime = get_fs_timestamp();
 	TST_EXP_PASS(utime(TEMP_FILE, NULL));
-	maxtime = time(0);
+	maxtime = get_fs_timestamp();
 	SAFE_SETEUID(root_uid);
 	SAFE_STAT(TEMP_FILE, &statbuf);
 
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
