Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F403A44A4
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 17:04:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07AAF3C7623
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 17:04:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB9BB3C30E6
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 17:04:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8DF4E6013E2
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 17:04:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E376721A5C
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623423869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EULgIi9Tag2/2GwTSxp+ZlsQXx/4O0fl4UWV+v8m7B4=;
 b=EX5GHfFGRsW/4PbkilE8fzBU/DNU6KHhgoW1mOPuKRFE8U1sm11U9shzNFUkza01feQI/y
 Gb8aYZvGL4moRCBMJ3MhgKyoaThwteL8C95CRNv2uRdzjZzZueT7Jxlm37kz31dq1WrAuF
 /LXfmTj4wAsVGk8KtMu8gSf1CIuEk9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623423869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EULgIi9Tag2/2GwTSxp+ZlsQXx/4O0fl4UWV+v8m7B4=;
 b=RNHoTta9gwp2sScEmbdkl2rZdTmBYK+oFP9YdArXEwVUphdinvzcoIuKxq7qxJ4DcxqKON
 I7FyR3l0MhfISmDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C0FE9118DD
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623423869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EULgIi9Tag2/2GwTSxp+ZlsQXx/4O0fl4UWV+v8m7B4=;
 b=EX5GHfFGRsW/4PbkilE8fzBU/DNU6KHhgoW1mOPuKRFE8U1sm11U9shzNFUkza01feQI/y
 Gb8aYZvGL4moRCBMJ3MhgKyoaThwteL8C95CRNv2uRdzjZzZueT7Jxlm37kz31dq1WrAuF
 /LXfmTj4wAsVGk8KtMu8gSf1CIuEk9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623423869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EULgIi9Tag2/2GwTSxp+ZlsQXx/4O0fl4UWV+v8m7B4=;
 b=RNHoTta9gwp2sScEmbdkl2rZdTmBYK+oFP9YdArXEwVUphdinvzcoIuKxq7qxJ4DcxqKON
 I7FyR3l0MhfISmDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 7EyPLX17w2AIDQAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 15:04:29 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Jun 2021 16:38:43 +0200
Message-Id: <20210611143843.10982-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] sched_rr_get_interval03: Make use of
 TST_EXP_FAIL()
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

In order to simplify the code a bit.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../sched_rr_get_interval03.c                      | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index cee9245e6..a61541b8a 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -78,18 +78,8 @@ static void run(unsigned int i)
 	else
 		ts = tst_ts_get(tc->tp);
 
-	TEST(tv->sched_rr_get_interval(*tc->pid, ts));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "sched_rr_get_interval() passed unexpectedly");
-		return;
-	}
-
-	if (tc->exp_errno == TST_ERR)
-		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexpectedly: %s",
-			tst_strerrno(tc->exp_errno));
+	TST_EXP_FAIL(tv->sched_rr_get_interval(*tc->pid, ts), tc->exp_errno,
+	             "sched_rr_get_interval(%i, %p)", *tc->pid, ts);
 }
 
 static struct tst_test test = {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
