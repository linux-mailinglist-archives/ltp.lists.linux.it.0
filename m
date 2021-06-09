Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC83A13EA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F5443C9008
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 969E13C2672
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B9E5600E55
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFFBE1FD5E;
 Wed,  9 Jun 2021 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7xQDr8rcZ+5LOvrstaEJrwHLg4cqLz3zxupI/KgB6A=;
 b=He2ioa6wrIgJn54wZMPvh04sk9ZCQmXUnqBfLl/VQObYgGC5OI9YueDL5UCXTKws+zwMhl
 AaXDOa+V0ruf9abqIW1vatIfUjwsOr1HfrSg87PUqBPGIZ3b3jt5AjgH4UegDSqxa/B+L+
 FfNpnHoAOtcxHK0S6x1WJMEPdH51PRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7xQDr8rcZ+5LOvrstaEJrwHLg4cqLz3zxupI/KgB6A=;
 b=Sufu8LYJ4o9P6rExw3DHn21SnbFlpRnDrfATl3wi11nqhP4FddHCi+szreeooJ5LEYtBR3
 TbyIDkyjR+F+IJAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D4938118DD;
 Wed,  9 Jun 2021 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7xQDr8rcZ+5LOvrstaEJrwHLg4cqLz3zxupI/KgB6A=;
 b=He2ioa6wrIgJn54wZMPvh04sk9ZCQmXUnqBfLl/VQObYgGC5OI9YueDL5UCXTKws+zwMhl
 AaXDOa+V0ruf9abqIW1vatIfUjwsOr1HfrSg87PUqBPGIZ3b3jt5AjgH4UegDSqxa/B+L+
 FfNpnHoAOtcxHK0S6x1WJMEPdH51PRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7xQDr8rcZ+5LOvrstaEJrwHLg4cqLz3zxupI/KgB6A=;
 b=Sufu8LYJ4o9P6rExw3DHn21SnbFlpRnDrfATl3wi11nqhP4FddHCi+szreeooJ5LEYtBR3
 TbyIDkyjR+F+IJAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id RNOsMkGwwGAAdAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 12:12:49 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 13:46:59 +0200
Message-Id: <20210609114659.2445-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609114659.2445-1-chrubis@suse.cz>
References: <20210609114659.2445-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] syscalls/writev03: Adjust test runtime
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

Bump the test timeout to 600s which gives us about 1 minute of runtime
per iteration.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/writev/writev03.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/writev/writev03.c b/testcases/kernel/syscalls/writev/writev03.c
index d0c64743b..5408d0279 100644
--- a/testcases/kernel/syscalls/writev/writev03.c
+++ b/testcases/kernel/syscalls/writev/writev03.c
@@ -144,6 +144,7 @@ static struct tst_test test = {
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.min_cpus = 2,
+	.timeout = 600,
 	.setup = setup,
 	.cleanup = cleanup,
 	.tags = (const struct tst_tag[]) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
