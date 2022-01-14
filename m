Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B048F1B7
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 21:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9D133C9538
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 21:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 690683C9543
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 21:53:16 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E2DF81400B81
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 21:53:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 908D91F391;
 Fri, 14 Jan 2022 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642193595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZWdvpN+7tz8sOIVPJ3ECowlHLEdzdFebKs1dOWGnVk=;
 b=kHpc3REwoEkvKdxpM2uZHL9/pR/zfvD3GOxlwxqvQfZWFNgu4+VKOrvI2llNwFLy1nzbkQ
 EHG2onp9DuktylEa6H+/NXm2IhBuL44+xSON9tve7EXmdz3WV+sIHw0hcVc43PORUcdOpQ
 ku4iOaeRlGbei9zds02aotiYqU03ubA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642193595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZWdvpN+7tz8sOIVPJ3ECowlHLEdzdFebKs1dOWGnVk=;
 b=HLXai+v276wIhao+0uHuo0snP6lmjBLtiRRPmowdQGJxZxDA9mGR08s5gmF6kh2pQL3eck
 j3vZAaubPqnjOTCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 556E313BB4;
 Fri, 14 Jan 2022 20:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKfQEbvi4WHtWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 14 Jan 2022 20:53:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 14 Jan 2022 21:53:09 +0100
Message-Id: <20220114205309.14409-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114205309.14409-1-pvorel@suse.cz>
References: <20220114205309.14409-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] ustat0{1,
 2}: Mark failure on Btrfs with known-fail tag
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

ustat() has been always broken on Btrfs and it's unlikely to be fixed
due ustat() being deprecated (glibc doesn't expose this system call
anymore).

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/ustat/ustat01.c | 6 ++++++
 testcases/kernel/syscalls/ustat/ustat02.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
index 0252858beb..66dbc0b184 100644
--- a/testcases/kernel/syscalls/ustat/ustat01.c
+++ b/testcases/kernel/syscalls/ustat/ustat01.c
@@ -44,6 +44,12 @@ static void setup(void)
 static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
+	.tags = (const struct tst_tag[]) {
+		{"known-fail", "ustat() is known to fail with EINVAL on Btrfs, see"
+			"https://lore.kernel.org/linux-btrfs/e7e867b8-b57a-7eb2-2432-1627bd3a88fb@toxicpanda.com/"
+		},
+		{}
+	}
 };
 #else
 TST_TEST_TCONF("testing ustat requires <sys/ustat.h> or <linux/types.h>");
diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
index d08446eaa1..55bdcaedf8 100644
--- a/testcases/kernel/syscalls/ustat/ustat02.c
+++ b/testcases/kernel/syscalls/ustat/ustat02.c
@@ -63,6 +63,12 @@ static struct tst_test test = {
 	.test = run,
 	.setup = setup,
 	.tcnt = ARRAY_SIZE(tc),
+	.tags = (const struct tst_tag[]) {
+		{"known-fail", "ustat() is known to fail with EINVAL on Btrfs, see"
+			"https://lore.kernel.org/linux-btrfs/e7e867b8-b57a-7eb2-2432-1627bd3a88fb@toxicpanda.com/"
+		},
+		{}
+	}
 };
 #else
 TST_TEST_TCONF("testing ustat requires <sys/ustat.h> or <linux/types.h>");
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
