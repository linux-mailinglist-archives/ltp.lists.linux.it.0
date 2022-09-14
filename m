Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E67845B8CB4
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 18:19:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E19D3CABEB
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 18:19:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 89E993CABB3
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 18:19:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1B38E600F16
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 18:19:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96F8D33B74
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663172371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IL7yY3s0+L3dvG/vyKJJLOdxCcY9MKpP109l07vx3lY=;
 b=JDfxB5kcjhhXPSnRK2FZMcHvpW8Zwn+N1ptArtsNkRxoKCUhKltAcObadn0hs841M4/rbK
 jKRRqgfLHxLijtgWVfHrUzYBDeV3yJgMLos12yp93AIDyC/p3F5fSjOEmmjlk13FTFx9eg
 Q8kEva93MvRC1J4MFHOoNZeWBXWFxJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663172371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IL7yY3s0+L3dvG/vyKJJLOdxCcY9MKpP109l07vx3lY=;
 b=LRv/vIBHeic8zOvA4vCydLhROM14LTtENy3ESqPuJvae6b6gSzcTHZsV0xqWJFi08Vhskx
 9KmyeUyb86SnXKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CA80134B3
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oENtHRP/IWMwYgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Sep 2022 18:19:28 +0200
Message-Id: <20220914161930.27681-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914161930.27681-1-mdoucha@suse.cz>
References: <20220914161930.27681-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/5] perf_event_open02: Add max_runtime
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Changed max_runtime from 15s to 72s

Again, we'll add .max_setup_runtime after the new release.

 testcases/kernel/syscalls/perf_event_open/perf_event_open02.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 618a27016..defe13c62 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -334,4 +334,5 @@ static struct tst_test test = {
 	},
 	.test_all = verify,
 	.needs_root = 1,
+	.max_runtime = 72
 };
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
