Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE53A13E3
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DB5E3C9008
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95A953C2672
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39E19200FE3
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95BFE219BC;
 Wed,  9 Jun 2021 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBbgIi2/E5XEwkUN0EyMIp4znoAAL+BPcoNcfAJ86n0=;
 b=twFnSwIyEIyadNB6jz02o4T7ArIsLy8HnSJl/yufhQR0wsrVZQyIOgbddrfDCWyKaLp0N2
 k8opPkxFzhs0qvWOYdf7KtN0tUqKzZ3nsMIoqPhBty7cVdV5m9rTIrxb6IEqMxbM6ANAMj
 msamPV5tf+mNQ3BsavbP17SnGJ8m/hM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBbgIi2/E5XEwkUN0EyMIp4znoAAL+BPcoNcfAJ86n0=;
 b=7f0mkBNh4ybrn/mS24Ebozwes2ToOWcN7TjHz0mUY2BiP4dQwcro03YB3AsRyFhmrS+krS
 PCYKAtkya7TeIOCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 73802118DD;
 Wed,  9 Jun 2021 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBbgIi2/E5XEwkUN0EyMIp4znoAAL+BPcoNcfAJ86n0=;
 b=twFnSwIyEIyadNB6jz02o4T7ArIsLy8HnSJl/yufhQR0wsrVZQyIOgbddrfDCWyKaLp0N2
 k8opPkxFzhs0qvWOYdf7KtN0tUqKzZ3nsMIoqPhBty7cVdV5m9rTIrxb6IEqMxbM6ANAMj
 msamPV5tf+mNQ3BsavbP17SnGJ8m/hM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBbgIi2/E5XEwkUN0EyMIp4znoAAL+BPcoNcfAJ86n0=;
 b=7f0mkBNh4ybrn/mS24Ebozwes2ToOWcN7TjHz0mUY2BiP4dQwcro03YB3AsRyFhmrS+krS
 PCYKAtkya7TeIOCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id q0HHGkCwwGD5cwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 12:12:48 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 13:46:56 +0200
Message-Id: <20210609114659.2445-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609114659.2445-1-chrubis@suse.cz>
References: <20210609114659.2445-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] lib: tst_supported_fs_types: Add
 tst_fs_max_types()
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The tst_fs_max_types() returns an upper bound on the number of supported
filesystems.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_fs.h             | 5 +++++
 lib/tst_supported_fs_types.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index 36d4b46f0..d1ed78cb5 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -195,6 +195,11 @@ const char **tst_get_supported_fs_types(const char *const *skiplist);
  */
 int tst_fs_in_skiplist(const char *fs_type, const char *const *skiplist);
 
+/*
+ * Returns maximal number of supported filesystem types.
+ */
+unsigned int tst_fs_max_types(void);
+
 /*
  * Check whether device supports FS quotas. Negative return value means that
  * quotas appear to be broken.
diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 592a526ae..1de0f30b2 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -29,6 +29,11 @@ static const char *const fs_type_whitelist[] = {
 
 static const char *fs_types[ARRAY_SIZE(fs_type_whitelist)];
 
+unsigned int tst_fs_max_types(void)
+{
+	return ARRAY_SIZE(fs_type_whitelist) - 1;
+}
+
 static int has_mkfs(const char *fs_type)
 {
 	char buf[128];
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
