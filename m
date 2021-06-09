Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B273A13E8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D0763C7A6F
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C189F3C2672
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66BEB601AF3
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16C6F219BE;
 Wed,  9 Jun 2021 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmZnfZ65wBsEqZUfSzg892a5clYAYa6jdG1CPGoC6vQ=;
 b=cUO4lNoIPVH6mNt6HukA17PM83kd5a+wgqEudzCGP5y4MNwPWyxIHd3+VbPZtc+Lyddvwi
 ytRDJ8xhhUf8BxS0KRnrLWTmjyuVCM39r9NNfXcAoMmJLKl7pbszRFFlwMRWiM0e3AE263
 YedU+Dh33MUuwQDXFM7Mzb+hWVMYxwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmZnfZ65wBsEqZUfSzg892a5clYAYa6jdG1CPGoC6vQ=;
 b=W9LEwNWfliAr69boikzp7Tb6/GjclxkWgxlBYgs3BnPZwtFi6NIsPM+nteGSZagFGQPrII
 YaCWsyilWw3atvDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E9C95118DD;
 Wed,  9 Jun 2021 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmZnfZ65wBsEqZUfSzg892a5clYAYa6jdG1CPGoC6vQ=;
 b=cUO4lNoIPVH6mNt6HukA17PM83kd5a+wgqEudzCGP5y4MNwPWyxIHd3+VbPZtc+Lyddvwi
 ytRDJ8xhhUf8BxS0KRnrLWTmjyuVCM39r9NNfXcAoMmJLKl7pbszRFFlwMRWiM0e3AE263
 YedU+Dh33MUuwQDXFM7Mzb+hWVMYxwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmZnfZ65wBsEqZUfSzg892a5clYAYa6jdG1CPGoC6vQ=;
 b=W9LEwNWfliAr69boikzp7Tb6/GjclxkWgxlBYgs3BnPZwtFi6NIsPM+nteGSZagFGQPrII
 YaCWsyilWw3atvDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OILTNkCwwGD8cwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 12:12:48 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 13:46:57 +0200
Message-Id: <20210609114659.2445-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609114659.2445-1-chrubis@suse.cz>
References: <20210609114659.2445-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] lib: tst_test: Move timeout scaling out of
 fork_testrun()
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

There is no point in setting the results->timeout in each iteration of
the tests (either for .all_filesystems or .test_variants) and it's cleaner to
do this once at the start of the testrun.

This also fixes a case where .all_filesystems or .test_variants would
call tst_set_timeout() in a test setup() that would be changed back on
second and subsequent runs because we called the tst_set_timeout()
incorrectly at the start of the fork_testrun().

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_test.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 36a4809c7..7c9061d6d 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1296,7 +1296,7 @@ unsigned int tst_multiply_timeout(unsigned int timeout)
 	return timeout * timeout_mul;
 }
 
-void tst_set_timeout(int timeout)
+static void set_timeout(int timeout)
 {
 	if (timeout == -1) {
 		tst_res(TINFO, "Timeout per run is disabled");
@@ -1311,24 +1311,22 @@ void tst_set_timeout(int timeout)
 	tst_res(TINFO, "Timeout per run is %uh %02um %02us",
 		results->timeout/3600, (results->timeout%3600)/60,
 		results->timeout % 60);
+}
 
-	if (getpid() == lib_pid)
-		alarm(results->timeout);
-	else
-		heartbeat();
+void tst_set_timeout(int timeout)
+{
+	set_timeout(timeout);
+	heartbeat();
 }
 
 static int fork_testrun(void)
 {
 	int status;
 
-	if (tst_test->timeout)
-		tst_set_timeout(tst_test->timeout);
-	else
-		tst_set_timeout(300);
-
 	SAFE_SIGNAL(SIGINT, sigint_handler);
 
+	alarm(results->timeout);
+
 	test_pid = fork();
 	if (test_pid < 0)
 		tst_brk(TBROK | TERRNO, "fork()");
@@ -1417,6 +1415,11 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 	SAFE_SIGNAL(SIGALRM, alarm_handler);
 	SAFE_SIGNAL(SIGUSR1, heartbeat_handler);
 
+	if (tst_test->timeout)
+		set_timeout(tst_test->timeout);
+	else
+		set_timeout(300);
+
 	if (tst_test->test_variants)
 		test_variants = tst_test->test_variants;
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
