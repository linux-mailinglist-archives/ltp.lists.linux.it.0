Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD827911B
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 20:50:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5A233C30D4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 20:50:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B62483C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 20:50:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 23167200AD2
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 20:50:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8B40AF5D;
 Fri, 25 Sep 2020 18:50:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Sep 2020 20:50:32 +0200
Message-Id: <20200925185034.24155-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925185034.24155-1-pvorel@suse.cz>
References: <20200925185034.24155-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] IMA: Rewrite ima_boot_aggregate.c to new API
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The main reason was to see TCONF messages, which are printed into stderr
in new API (but to stdout in legacy API) and thus visible as the output
is redirected into the variable.

Changing boot_aggregate: to sha1: to be compatible with evmctl
ima_boot_aggregate.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../integrity/ima/src/ima_boot_aggregate.c    | 113 +++++++++---------
 .../security/integrity/ima/tests/ima_tpm.sh   |   2 +-
 2 files changed, 57 insertions(+), 58 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c b/testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
index 98893b99a..67f97ea04 100644
--- a/testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
+++ b/testcases/kernel/security/integrity/ima/src/ima_boot_aggregate.c
@@ -1,19 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
-* Copyright (c) International Business Machines  Corp., 2009
-*
-* Authors:
-* Mimi Zohar <zohar@us.ibm.com>
-*
-* This program is free software; you can redistribute it and/or
-* modify it under the terms of the GNU General Public License as
-* published by the Free Software Foundation, version 2 of the
-* License.
-*
-* File: ima_boot_aggregate.c
-*
-* Calculate a SHA1 boot aggregate value based on the TPM
-* binary_bios_measurements.
-*/
+ * Copyright (c) International Business Machines  Corp., 2009
+ * Copyright (c) 2016-2019 Petr Vorel <pvorel@suse.cz>
+ *
+ * Authors: Mimi Zohar <zohar@us.ibm.com>
+ *
+ * Calculate a SHA1 boot aggregate value based on the TPM 1.2
+ * binary_bios_measurements.
+ */
+
+#include "config.h"
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/types.h>
@@ -23,10 +19,8 @@
 #include <unistd.h>
 #include <limits.h>
 
-#include "config.h"
-#include "test.h"
-
-char *TCID = "ima_boot_aggregate";
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
 
 #if HAVE_LIBCRYPTO
 #include <openssl/sha.h>
@@ -36,7 +30,24 @@ char *TCID = "ima_boot_aggregate";
 #define MAX_EVENT_DATA_SIZE (MAX_EVENT_SIZE - EVENT_HEADER_SIZE)
 #define NUM_PCRS 8		/*  PCR registers 0-7 in boot aggregate */
 
-int TST_TOTAL = 1;
+static char *debug;
+static char *file;
+
+static unsigned char boot_aggregate[SHA_DIGEST_LENGTH];
+
+static struct {
+	struct {
+		u_int32_t pcr;
+		u_int32_t type;
+		u_int8_t digest[SHA_DIGEST_LENGTH];
+		u_int32_t len;
+	} header __attribute__ ((packed));
+	char *data;
+} event;
+
+static struct {
+	unsigned char digest[SHA_DIGEST_LENGTH];
+} pcr[NUM_PCRS];
 
 static void display_sha1_digest(unsigned char *pcr)
 {
@@ -47,45 +58,24 @@ static void display_sha1_digest(unsigned char *pcr)
 	printf("\n");
 }
 
-int main(int argc, char *argv[])
+static void do_test(void)
 {
-	unsigned char boot_aggregate[SHA_DIGEST_LENGTH];
-	struct {
-		struct {
-			u_int32_t pcr;
-			u_int32_t type;
-			u_int8_t digest[SHA_DIGEST_LENGTH];
-			u_int32_t len;
-		} header __attribute__ ((packed));
-		char *data;
-	} event;
-	struct {
-		unsigned char digest[SHA_DIGEST_LENGTH];
-	} pcr[NUM_PCRS];
 	FILE *fp;
-	int i;
-	int debug = 0;
 	SHA_CTX c;
+	int i;
 
-	if (argc != 2) {
-		printf("format: %s binary_bios_measurement file\n", argv[0]);
-		return 1;
-	}
-	fp = fopen(argv[1], "r");
-	if (!fp) {
-		perror("unable to open pcr file\n");
-		return 1;
-	}
+	if (!file)
+		tst_brk(TBROK, "missing binary_bios_measurement file, specify with -f");
+
+	fp = SAFE_FOPEN(file, "r");
 
 	/* Initialize psuedo PCR registers 0 - 7 */
 	for (i = 0; i < NUM_PCRS; i++)
 		memset(&pcr[i].digest, 0, SHA_DIGEST_LENGTH);
 
 	event.data = malloc(MAX_EVENT_DATA_SIZE);
-	if (!event.data) {
-		printf("Cannot allocate memory\n");
-		return 1;
-	}
+	if (!event.data)
+		tst_brk(TBROK, "cannot allocate memory");
 
 	/* Extend the pseudo PCRs with the event digest */
 	while (fread(&event, sizeof(event.header), 1, fp)) {
@@ -105,13 +95,14 @@ int main(int argc, char *argv[])
 
 #if MAX_EVENT_DATA_SIZE < USHRT_MAX
 		if (event.header.len > MAX_EVENT_DATA_SIZE) {
-			printf("Error event too long\n");
+			tst_res(TWARN, "error event too long");
 			break;
 		}
 #endif
 		fread(event.data, event.header.len, 1, fp);
 	}
-	fclose(fp);
+
+	SAFE_FCLOSE(fp);
 	free(event.data);
 
 	/* Extend the boot aggregate with the pseudo PCR digest values */
@@ -126,14 +117,22 @@ int main(int argc, char *argv[])
 	}
 	SHA1_Final(boot_aggregate, &c);
 
-	printf("boot_aggregate:");
+	printf("sha1:");
 	display_sha1_digest(boot_aggregate);
-	tst_exit();
+	tst_res(TPASS, "found sha1 hash");
 }
 
+static struct tst_option options[] = {
+	{"d", &debug, "-d       enable debug"},
+	{"f:", &file, "-f x     binary_bios_measurement file (required)\n"},
+	{NULL, NULL, NULL}
+};
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.options = options,
+};
+
 #else
-int main(void)
-{
-	tst_brkm(TCONF, NULL, "test requires libcrypto and openssl development packages");
-}
+TST_TEST_TCONF("libcrypto and openssl development packages required");
 #endif
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
index c69f891f1..dc958eb5c 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_tpm.sh
@@ -33,7 +33,7 @@ test1()
 			tst_res TFAIL "bios boot aggregate is not 0"
 		fi
 	else
-		boot_aggregate=$(ima_boot_aggregate $tpm_bios | grep "boot_aggregate:" | cut -d':' -f2)
+		boot_aggregate=$(ima_boot_aggregate -f $tpm_bios | grep "sha1:" | cut -d':' -f2)
 		if [ "$boot_hash" = "$boot_aggregate" ]; then
 			tst_res TPASS "bios aggregate matches IMA boot aggregate"
 		else
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
