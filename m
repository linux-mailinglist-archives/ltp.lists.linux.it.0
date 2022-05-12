Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1D524D2E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:40:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B6393CA9C8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE7A73CA9C7
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5CEDF200989
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DA2D21C80;
 Thu, 12 May 2022 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652358973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+lF47vGca7kWGHbAZn5ZU5stk3YF3cjZ06rusMjaps=;
 b=27xovFktJxoqPcKyUwcO3+bZ/enxjox9VdrYrfSnp4aqzXa+2Ww2kOIP0lMTZsJZKLkprd
 5R+o4Vz5qTqxumYanAH+aJepqnw60bfynrB83KlYCylXBg0DSnqLgw8esqp1oX6xisFi5b
 EZl5QIiY1xodca0gtPBxgW49+D9N6qY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652358973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+lF47vGca7kWGHbAZn5ZU5stk3YF3cjZ06rusMjaps=;
 b=LLrstz/lwTsOYWiC3PihFYZe4XlfmsMCutIObxX0SGVGU9Yyv24XmoJgSuzUN/AkDQ0duP
 LSmDdKLTW4viWjBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE59713ABE;
 Thu, 12 May 2022 12:36:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S3DkODz/fGJRGgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 May 2022 12:36:12 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 14:38:07 +0200
Message-Id: <20220512123816.24399-21-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512123816.24399-1-chrubis@suse.cz>
References: <20220512123816.24399-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 20/29] mem/mallocstress: Convert to runtime
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
Cc: automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/mem/mtest07/mallocstress.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/mem/mtest07/mallocstress.c b/testcases/kernel/mem/mtest07/mallocstress.c
index fa7494e7d..ae3a9a004 100644
--- a/testcases/kernel/mem/mtest07/mallocstress.c
+++ b/testcases/kernel/mem/mtest07/mallocstress.c
@@ -62,7 +62,7 @@ static void my_yield(void)
  *  0: success
  *  1: failure
  */
-int allocate_free(int scheme)
+int allocate_free(int scheme, int threadnum)
 {
 	int loop;
 	const int MAXPTRS = 50;	/* only 42 or so get used on 32 bit machine */
@@ -127,6 +127,11 @@ int allocate_free(int scheme)
 		}
 
 		my_yield();
+
+		if (!tst_remaining_runtime()) {
+			tst_res(TINFO, "Thread [%d]: Test runtime is over, exitting", threadnum);
+			break;
+		}
 	}
 
 	/* Success! */
@@ -141,7 +146,7 @@ void *alloc_mem(void *threadnum)
 	TST_CHECKPOINT_WAIT(0);
 
 	/* thread N will use growth scheme N mod 4 */
-	err = allocate_free(((uintptr_t)threadnum) % 4);
+	err = allocate_free(((uintptr_t)threadnum) % 4, (uintptr_t)threadnum);
 	tst_res(TINFO,
 		"Thread [%d]: allocate_free() returned %d, %s.  Thread exiting.\n",
 		(int)(uintptr_t)threadnum, err,
@@ -189,7 +194,7 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.timeout = 600,
+	.max_runtime = 600,
 	.needs_checkpoints = 1,
 	.setup = setup,
 	.cleanup = cleanup,
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
