Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A865551429
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 11:20:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13AEC3C9376
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 11:20:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE0493C9203
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 11:19:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 769941400180
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 11:19:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16FFE21BDF
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655716782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsNlcjOQM8+M0+zVkN/U22djZLpzFgYAaN8JcEqbr3c=;
 b=G6RQ7Rc80+2AQr9utSAoPTI0+03MTVNT4xTOiy3uBFDwyIZ4RhB1YgeZdLFpov0EeM5XOR
 cTpRr5kvCYVcCwJf2JomngLMBTvGuPjkrCospEUickbKnmg2oYcyf11DzocDCtBUDDtvO0
 f77434irDwyFd4bONZsVud+8w583BC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655716782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsNlcjOQM8+M0+zVkN/U22djZLpzFgYAaN8JcEqbr3c=;
 b=tZ2RY6JmchoKMW/RLkLv+DpmSiI//5MuuVdaf4Nkn8XzxWUNO4lchr3AvGus0kPIZxTN8z
 /z+fjhks4XB/XADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 047B2134CA
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 09:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HVSDO607sGJmQAAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 09:19:41 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 Jun 2022 11:21:43 +0200
Message-Id: <20220620092146.7604-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620092146.7604-1-chrubis@suse.cz>
References: <20220620092146.7604-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] openposix: sem_timedwait/11-1: Fix
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

Actually run both of the cases (valid timeout and invalid timeout).

The timeout is not actually invalid, but rather in the past, which is
important to test as the system has to try to lock the semaphore first
and only if that fails it should check the timeout.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../conformance/interfaces/sem_timedwait/11-1.c          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/11-1.c
index f87afaa43..663edd836 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/11-1.c
@@ -24,7 +24,7 @@
 #include "posixtest.h"
 
 #define TIMEOUT 2
-#define INVALIDTIMEOUT -2
+#define NEGATIVETIMEOUT -2
 #define TEST "11-1"
 #define FUNCTION "sem_timedwait"
 #define ERROR_PREFIX "unexpected error: " FUNCTION " " TEST ": "
@@ -45,7 +45,7 @@ int main(void)
 			ts[i].tv_sec = time(NULL) + TIMEOUT;
 			ts[i].tv_nsec = 0;
 		} else if (i == 1) {
-			ts[i].tv_sec = time(NULL) + INVALIDTIMEOUT;
+			ts[i].tv_sec = time(NULL) + NEGATIVETIMEOUT;
 			ts[i].tv_nsec = 0;
 		}
 		/* Lock Semaphore */
@@ -63,13 +63,14 @@ int main(void)
 
 		/* Checking if the value of the Semaphore decremented by one */
 		if ((val[i] == 0) && (sts[i] == 0)) {
-			puts("TEST PASSED");
 			sem_destroy(&mysemp[i]);
-			return PTS_PASS;
 		} else {
 			puts("TEST FAILED");
 			sem_destroy(&mysemp[i]);
 			return PTS_FAIL;
 		}
 	}
+
+	puts("TEST PASSED");
+	return PTS_PASS;
 }
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
