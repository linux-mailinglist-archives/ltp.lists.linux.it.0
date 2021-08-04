Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFC3DFDF4
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C4D93C7FFE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63CFE3C7FFC
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE8D31000A57
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C3F6221D8;
 Wed,  4 Aug 2021 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628069065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4icKGYRrNb3cGjezR3GwJDH6s9n13Mtlmhm+QQXhJk=;
 b=f5eYUR5iOLgNO2LtBjVwTNKxbssLTMmKGgBAG8z0R6SS7RCkYlFBZvYYy8jedYlXFzUSMI
 cSThbXKTNnQ4MoItggiZbDZbkmfMVaSE0bWm8DjIAVGwCIy1HOwKQ3tFdnFWjVV451H9G+
 XJxbw2vXbl0au4G1oUBS8svTVyAs5Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628069065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4icKGYRrNb3cGjezR3GwJDH6s9n13Mtlmhm+QQXhJk=;
 b=wbER6e2PxXPLHnVr5fLGydg1YpeduXCDCMBOyO4nb8QoVbV4huLgWVxjhKhKpuXPHlpa/f
 2YQKmolWgKbXW0Bw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 038811338E;
 Wed,  4 Aug 2021 09:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 4KuYOshcCmHhagAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 04 Aug 2021 09:24:24 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 11:24:06 +0200
Message-Id: <20210804092407.16015-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804092407.16015-1-pvorel@suse.cz>
References: <20210804092407.16015-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v8 1/7] lib: Print everything to stderr
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

ie.e hint, tags, summary to unify the behavior with tst_{brk,res}()
which printed into stderr from the beginning.

Initial motivation was issue in GitHub Actions, where stdout and stderr
are probably block buffered and flushed at different times. The result
was mangled summary into other test output.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v7->v8:
* print more items in lib into stderr (Cyril)

 lib/tst_test.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index c7c77596c..8a6a112ef 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -488,23 +488,23 @@ static void print_test_tags(void)
 	if (!tags)
 		return;
 
-	printf("\nTags\n");
-	printf("----\n");
+	fprintf(stderr, "\nTags\n");
+	fprintf(stderr, "----\n");
 
 	for (i = 0; tags[i].name; i++) {
 		if (!strcmp(tags[i].name, "CVE"))
-			printf(CVE_DB_URL "%s\n", tags[i].value);
+			fprintf(stderr, CVE_DB_URL "%s\n", tags[i].value);
 		else if (!strcmp(tags[i].name, "linux-git"))
-			printf(LINUX_GIT_URL "%s\n", tags[i].value);
+			fprintf(stderr, LINUX_GIT_URL "%s\n", tags[i].value);
 		else if (!strcmp(tags[i].name, "linux-stable-git"))
-			printf(LINUX_STABLE_GIT_URL "%s\n", tags[i].value);
+			fprintf(stderr, LINUX_STABLE_GIT_URL "%s\n", tags[i].value);
 		else if (!strcmp(tags[i].name, "glibc-git"))
-			printf(GLIBC_GIT_URL "%s\n", tags[i].value);
+			fprintf(stderr, GLIBC_GIT_URL "%s\n", tags[i].value);
 		else
-			printf("%s: %s\n", tags[i].name, tags[i].value);
+			fprintf(stderr, "%s: %s\n", tags[i].name, tags[i].value);
 	}
 
-	printf("\n");
+	fprintf(stderr, "\n");
 }
 
 static void check_option_collision(void)
@@ -674,9 +674,9 @@ int tst_parse_float(const char *str, float *val, float min, float max)
 static void print_colored(const char *str)
 {
 	if (tst_color_enabled(STDOUT_FILENO))
-		printf("%s%s%s", ANSI_COLOR_YELLOW, str, ANSI_COLOR_RESET);
+		fprintf(stderr, "%s%s%s", ANSI_COLOR_YELLOW, str, ANSI_COLOR_RESET);
 	else
-		printf("%s", str);
+		fprintf(stderr, "%s", str);
 }
 
 static void print_failure_hint(const char *tag, const char *hint,
@@ -694,12 +694,12 @@ static void print_failure_hint(const char *tag, const char *hint,
 		if (!strcmp(tags[i].name, tag)) {
 			if (!hint_printed) {
 				hint_printed = 1;
-				printf("\n");
+				fprintf(stderr, "\n");
 				print_colored("HINT: ");
-				printf("You _MAY_ be %s, see:\n\n", hint);
+				fprintf(stderr, "You _MAY_ be %s, see:\n\n", hint);
 			}
 
-			printf("%s%s\n", url, tags[i].value);
+			fprintf(stderr, "%s%s\n", url, tags[i].value);
 		}
 	}
 }
@@ -734,12 +734,12 @@ static void do_exit(int ret)
 		if (results->broken)
 			ret |= TBROK;
 
-		printf("\nSummary:\n");
-		printf("passed   %d\n", results->passed);
-		printf("failed   %d\n", results->failed);
-		printf("broken   %d\n", results->broken);
-		printf("skipped  %d\n", results->skipped);
-		printf("warnings %d\n", results->warnings);
+		fprintf(stderr, "\nSummary:\n");
+		fprintf(stderr, "passed   %d\n", results->passed);
+		fprintf(stderr, "failed   %d\n", results->failed);
+		fprintf(stderr, "broken   %d\n", results->broken);
+		fprintf(stderr, "skipped  %d\n", results->skipped);
+		fprintf(stderr, "warnings %d\n", results->warnings);
 	}
 
 	do_cleanup();
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
