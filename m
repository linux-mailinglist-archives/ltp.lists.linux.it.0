Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F75B895C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 15:44:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C66623CAC2D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 15:44:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 91EC33CAC05
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 15:43:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 41F4E2003A2
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 15:43:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 901931F8C4
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663163014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc/T5tRQKSfsaFHCXCUhfnudzy+GpjWxD3h6jrZ6MuA=;
 b=t0ZYbjzK07C7/ktue38k72TRMJfkYipXNLqO8TbTbqMcXcbeTm7hEmfT6HhrQv+YIRAQA7
 3UqVd+ru5MIv5mEMOTiE1TpyxPuGiTa96OLBLAuMw4LCiTEYeY9bm0U8GoH3JJv4s5WgWm
 t+IYtZ7VlmRy60l46aIiHjOCHCp6vGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663163014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc/T5tRQKSfsaFHCXCUhfnudzy+GpjWxD3h6jrZ6MuA=;
 b=Z/54CxGyRDvMRwK/H0HKjhUNpVOP40/4qeLW0+44Z9E78Vvtu11jcCKMJLhVfn3zUlabqf
 m5oq5GPeeipgQpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B39C13A90
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 13:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SNc7HYbaIWN1IgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 13:43:34 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Sep 2022 15:43:31 +0200
Message-Id: <20220914134333.13562-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914134333.13562-1-mdoucha@suse.cz>
References: <20220914134333.13562-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] Add tst_validate_children() helper function
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

The function waits for given number of child processes and validates
that they have all exited without error.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Moved tst_validate_children_() to lib/tst_status.c
- Simplified the code using tst_strstatus()

 include/tst_test.h |  8 ++++++++
 lib/tst_status.c   | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index ac52f268c..69e649651 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -362,6 +362,14 @@ void tst_set_max_runtime(int max_runtime);
  */
 char *tst_get_tmpdir(void);
 
+/*
+ * Validates exit status of child processes
+ */
+int tst_validate_children_(const char *file, const int lineno,
+	unsigned int count);
+#define tst_validate_children(child_count) \
+	tst_validate_children_(__FILE__, __LINE__, (child_count))
+
 #ifndef TST_NO_DEFAULT_MAIN
 
 static struct tst_test test;
diff --git a/lib/tst_status.c b/lib/tst_status.c
index 9124faaa3..5d03871f3 100644
--- a/lib/tst_status.c
+++ b/lib/tst_status.c
@@ -49,3 +49,23 @@ const char *tst_strstatus(int status)
 
 	return invalid(status);
 }
+
+int tst_validate_children_(const char *file, const int lineno,
+	unsigned int count)
+{
+	unsigned int i;
+	int status;
+	pid_t pid;
+
+	for (i = 0; i < count; i++) {
+		pid = SAFE_WAITPID(-1, &status, 0);
+
+		if (!WIFEXITED(status) || WEXITSTATUS(status)) {
+			tst_res_(file, lineno, TFAIL, "Child %d: %s", pid,
+				tst_strstatus(status));
+			return 1;
+		}
+	}
+
+	return 0;
+}
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
