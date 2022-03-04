Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F38494CD2C2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Mar 2022 11:50:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50323CA36B
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Mar 2022 11:50:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEE783CA1EA
 for <ltp@lists.linux.it>; Fri,  4 Mar 2022 11:50:36 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1E95B1A01782
 for <ltp@lists.linux.it>; Fri,  4 Mar 2022 11:50:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A51532114E;
 Fri,  4 Mar 2022 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646391034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zB7UmcviZVgi94Dox5alZeDYcAhUOu+WQQXCv27tQEg=;
 b=0KCmq+1m49eT7WAWEiX99PUbG4VKTcc9caaUV1uk4LNkhQB+PsX9jzIfBiSWrV8JEpZ788
 q0qH+A0gHkGdbSSC1ayJmH5C/QFufIG3eBMni/MMznoUUSb9k2lwg/9x/UjLHiOhM0HzPU
 sV+EcnkcDw/R2Ft+vM76zVZh8YQEvAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646391034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zB7UmcviZVgi94Dox5alZeDYcAhUOu+WQQXCv27tQEg=;
 b=s7iXtSUsU9ZiAPVTjYXXD66pPflIxp6skwc/5+A1Tu0l2BMziom7JGrUlW7pz9C9zQdM4u
 HEY4Br+XUXXhKmDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DAE913CA7;
 Fri,  4 Mar 2022 10:50:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DkeDIfruIWKgKQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 04 Mar 2022 10:50:34 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>,
	ltp@lists.linux.it
Date: Fri,  4 Mar 2022 11:50:33 +0100
Message-Id: <20220304105034.22083-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] quotactl06: Fix tmpdir cleanup if setup() exits
 early
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

When setup() exits with TCONF before USRPATH or TESTDIR1 get created,
cleanup() will trigger TWARN when it tries to delete them. Check whether
the file and directory exists before removing them.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Also check whether USRPATH exists before deleting it

 testcases/kernel/syscalls/quotactl/quotactl06.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 8e9a17393..87715237f 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -206,8 +206,11 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	SAFE_UNLINK(USRPATH);
-	SAFE_RMDIR(TESTDIR1);
+	if (!access(USRPATH, F_OK))
+		SAFE_UNLINK(USRPATH);
+
+	if (!access(TESTDIR1, F_OK))
+		SAFE_RMDIR(TESTDIR1);
 }
 
 static struct tst_test test = {
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
