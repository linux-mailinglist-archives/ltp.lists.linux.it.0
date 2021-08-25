Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF83F70EA
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:09:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F1203C3047
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:09:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F04F3C2FB4
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D223E6017C4
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83B1C22103;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629878981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntimzQFcEtgP/Zf3T23douu8FFEWirkWg/1pLX0G/8c=;
 b=0vyXKyFLEauO0nySdBpiIn4Yo0d8grZ/WQvvUapxJny1PRnTLmQUOlVmDY0P+GhaNvxpnL
 /1K5sUf6frU//HYNoT/uVSINfddlHNJea+lIh9wg2WNLJblnhqtnrj4vEbC9s/WeMX3nrn
 M9U9ANHU/ju3iQMih5sQixfq00OT9OI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629878981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntimzQFcEtgP/Zf3T23douu8FFEWirkWg/1pLX0G/8c=;
 b=HwkKWdysvTPqzS0+a8mAzgZoxsSBnv/deVUaHt805jdUIEr9yCqLHnuNUjG7S7l2H6j0pW
 B71qiWhkFEykXIBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4F53813929;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mBJxEcX6JWHwcQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 08:09:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 10:09:32 +0200
Message-Id: <20210825080933.12949-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825080933.12949-1-pvorel@suse.cz>
References: <20210825080933.12949-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

To follow the conventions in the new API.

Update also C API docs.

NOTE: IPC is not supported in the legacy API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/c-test-api.txt | 2 +-
 include/tst_test.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 3127018a4..a092bc572 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -654,7 +654,7 @@ int main(void)
 
 The 'tst_res()' function can be also used from binaries started by 'exec()',
 the parent test process has to set the '.child_needs_reinit' flag so that the
-library prepares for it and has to make sure the 'LTP_IPC_PATH' environment
+library prepares for it and has to make sure the 'TST_IPC_PATH' environment
 variable is passed down, then the very fist thing the program has to call in
 'main()' is 'tst_reinit()' that sets up the IPC.
 
diff --git a/include/tst_test.h b/include/tst_test.h
index 27ebed94e..4c0749865 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -275,12 +275,12 @@ struct tst_test {
 void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
                     __attribute__ ((noreturn));
 
-#define IPC_ENV_VAR "LTP_IPC_PATH"
+#define IPC_ENV_VAR "TST_IPC_PATH"
 
 /*
  * Does library initialization for child processes started by exec()
  *
- * The LTP_IPC_PATH variable must be passed to the program environment.
+ * The TST_IPC_PATH variable must be passed to the program environment.
  */
 void tst_reinit(void);
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
