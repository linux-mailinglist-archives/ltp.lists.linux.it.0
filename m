Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CB3DFDF5
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94C2D3C8010
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E08723C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA214601419
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED8332011B;
 Wed,  4 Aug 2021 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628069064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hdCkMMmzCVqKEn97UIXX3MRXpiKteLrdsFpA2IfFbUk=;
 b=KEkS6e4xyXO8sNx/E58LOAosPXc8AN7X7VVAyQNMCHwzo5yMZM1pKQFm78+yRtZarxin3W
 Axd5ARFz3VDI8kI7wtmXvdykDraEF3pTZJqhLL1KEHiJN4TuaYhbDkr4ZTzCsrfT8Droo1
 Szn8i3BsPjt//IXlDlTEYXcijN4YeHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628069064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hdCkMMmzCVqKEn97UIXX3MRXpiKteLrdsFpA2IfFbUk=;
 b=nv3kb9Th05hEGE1/rn4SNnkVjNtbi2vKhqjwzUsbDhHFUOAITHI7FNJTeNk6Ov63Hb82Sc
 32iLCdIrjOieVhDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C116C1338E;
 Wed,  4 Aug 2021 09:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id pxlvLchcCmHhagAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 04 Aug 2021 09:24:24 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 11:24:05 +0200
Message-Id: <20210804092407.16015-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v8 0/7] Run tests in CI
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

Hi,

* print more items in lib into stderr (Cyril, 1st commit)
* check for readonly fs instead TCONF on any error during writing to
/proc/sys/vm/nr_hugepages (Cyril, 2nd commit)

NOTE: sending just these 2 patches which are different

Tested:
https://github.com/pevik/ltp/actions/runs/1097004804

Diff to v7

diff --git lib/newlib_tests/test_zero_hugepage.sh lib/newlib_tests/test_zero_hugepage.sh
index 8a462478e..d270e686c 100755
--- lib/newlib_tests/test_zero_hugepage.sh
+++ lib/newlib_tests/test_zero_hugepage.sh
@@ -7,11 +7,13 @@ echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
 
 orig_value=`cat /proc/sys/vm/nr_hugepages`
 
-if ! echo "128" > /proc/sys/vm/nr_hugepages; then
-	echo "TCONF: failed to open /proc/sys/vm/nr_hugepages"
+if grep -q -E '^proc /proc(/sys)? proc ro' /proc/mounts; then
+	echo "TCONF: /proc or /proc/sys mounted as read-only"
 	exit 32
 fi
 
+echo "128" > /proc/sys/vm/nr_hugepages
+
 ./test_zero_hugepage
 
 echo $orig_value > /proc/sys/vm/nr_hugepages
diff --git lib/tst_test.c lib/tst_test.c
index d15c8c054..8a6a112ef 100644
--- lib/tst_test.c
+++ lib/tst_test.c
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

Petr Vorel (7):
  lib: Print everything to stderr
  test/test_zero_hugepage.sh: Skip test on read-only /proc
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test{,-c,-shell}
  CI: Run also make test-c, test-shell
  ci: Install iproute2

 .github/workflows/ci.yml               |  10 ++
 Makefile                               |  23 +++
 build.sh                               |  24 +++-
 ci/debian.sh                           |   1 +
 ci/fedora.sh                           |   1 +
 ci/tumbleweed.sh                       |   1 +
 lib/newlib_tests/runtest.sh            | 190 +++++++++++++++++++++++++
 lib/newlib_tests/test_zero_hugepage.sh |   6 +
 lib/tst_test.c                         |  38 ++---
 9 files changed, 274 insertions(+), 20 deletions(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
