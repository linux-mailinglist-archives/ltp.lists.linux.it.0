Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4D9FEF30
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2024 12:56:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E36F3EE0AC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2024 12:56:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92BD13EC821
 for <ltp@lists.linux.it>; Tue, 31 Dec 2024 12:56:17 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B58351002048
 for <ltp@lists.linux.it>; Tue, 31 Dec 2024 12:56:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A13191F381;
 Tue, 31 Dec 2024 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735646175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5iw2JJA8MNK7p+kF+xYgKqcquRfVMpcGJCxpzneaNA=;
 b=fhWkhYnaIqgA2jmlhGtLGlzxgWWpm+GPI0jhLGH3HLuZ+eBIgOSl/4IWpFvwCkMXHdvMgi
 euDgCo7/v0yM8Pi90AdMAxeN2NCwQwlA6JYH/jcCyJ8VroeP8bYZpWoCuyb2sVGkR3wPJB
 6UAKk/GbZW+J6pWSPUBP1gIqKLdQbOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735646175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5iw2JJA8MNK7p+kF+xYgKqcquRfVMpcGJCxpzneaNA=;
 b=wNNqYaDNQ8qquIYDIdP/Oq//VwDauxJoImI7BDjWweizjpPSiWunLixXxJAfd+g6P7b08t
 bUWOOWmZx90qUJDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=fhWkhYna;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=wNNqYaDN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735646175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5iw2JJA8MNK7p+kF+xYgKqcquRfVMpcGJCxpzneaNA=;
 b=fhWkhYnaIqgA2jmlhGtLGlzxgWWpm+GPI0jhLGH3HLuZ+eBIgOSl/4IWpFvwCkMXHdvMgi
 euDgCo7/v0yM8Pi90AdMAxeN2NCwQwlA6JYH/jcCyJ8VroeP8bYZpWoCuyb2sVGkR3wPJB
 6UAKk/GbZW+J6pWSPUBP1gIqKLdQbOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735646175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5iw2JJA8MNK7p+kF+xYgKqcquRfVMpcGJCxpzneaNA=;
 b=wNNqYaDNQ8qquIYDIdP/Oq//VwDauxJoImI7BDjWweizjpPSiWunLixXxJAfd+g6P7b08t
 bUWOOWmZx90qUJDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68DDD13ABB;
 Tue, 31 Dec 2024 11:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sPT3F9/bc2cxKQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 31 Dec 2024 11:56:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 31 Dec 2024 12:56:07 +0100
Message-ID: <20241231115607.56105-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231115607.56105-1-pvorel@suse.cz>
References: <20241231115607.56105-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A13191F381
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/2] device-drivers: *module: Use helpers for
 module signature enforcement
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>,
 "Ricardo B . Marliere" <rbm@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* tpci.c: move tst_check_module_signature_enforced() after tst_sig(FORK, DEF_HANDLER, cleanup);
* finit_module01.c: restore sig_enforce()

 testcases/kernel/device-drivers/acpi/ltp_acpi.c       | 11 +----------
 .../device-drivers/block/block_dev_user/block_dev.c   |  9 +--------
 testcases/kernel/device-drivers/pci/tpci_user/tpci.c  | 11 +----------
 testcases/kernel/device-drivers/uaccess/uaccess.c     | 11 +----------
 testcases/kernel/firmware/fw_load_user/fw_load.c      | 10 +---------
 .../kernel/syscalls/delete_module/delete_module01.c   |  9 +--------
 .../kernel/syscalls/delete_module/delete_module03.c   |  9 +--------
 .../kernel/syscalls/finit_module/finit_module01.c     |  9 +--------
 .../kernel/syscalls/finit_module/finit_module02.c     |  7 +------
 testcases/kernel/syscalls/init_module/init_module01.c |  8 +-------
 testcases/kernel/syscalls/init_module/init_module02.c |  7 +------
 11 files changed, 11 insertions(+), 90 deletions(-)

diff --git a/testcases/kernel/device-drivers/acpi/ltp_acpi.c b/testcases/kernel/device-drivers/acpi/ltp_acpi.c
index c674b20321..eb5e197239 100644
--- a/testcases/kernel/device-drivers/acpi/ltp_acpi.c
+++ b/testcases/kernel/device-drivers/acpi/ltp_acpi.c
@@ -22,7 +22,6 @@
 #include <stdlib.h>
 
 #include "test.h"
-#include "tst_kconfig.h"
 #include "old_module.h"
 #include "safe_macros.h"
 
@@ -129,20 +128,12 @@ static void test_run(void)
 int main(int argc, char *argv[])
 {
 	int acpi_disabled;
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
 
 	tst_parse_opts(argc, argv, NULL, NULL);
-
 	tst_require_root();
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brkm(TCONF, tst_exit, "module signature is enforced, skip test");
-
 	tst_sig(FORK, DEF_HANDLER, cleanup);
 
+	tst_check_module_signature_enforced();
 	tst_module_load(NULL, module_name, NULL);
 	module_loaded = 1;
 
diff --git a/testcases/kernel/device-drivers/block/block_dev_user/block_dev.c b/testcases/kernel/device-drivers/block/block_dev_user/block_dev.c
index 2c3ffd9203..98b786a90b 100644
--- a/testcases/kernel/device-drivers/block/block_dev_user/block_dev.c
+++ b/testcases/kernel/device-drivers/block/block_dev_user/block_dev.c
@@ -17,7 +17,6 @@
 #include <unistd.h>
 #include <string.h>
 
-#include "tst_kconfig.h"
 #include "tst_test.h"
 #include "tst_module.h"
 
@@ -42,13 +41,7 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brk(TCONF, "module signature is enforced, skip test");
+	tst_check_module_signature_enforced();
 
 	/*
 	 * test-cases #8 and #9 can crash the kernel.
diff --git a/testcases/kernel/device-drivers/pci/tpci_user/tpci.c b/testcases/kernel/device-drivers/pci/tpci_user/tpci.c
index aa07fdb427..faace7727b 100644
--- a/testcases/kernel/device-drivers/pci/tpci_user/tpci.c
+++ b/testcases/kernel/device-drivers/pci/tpci_user/tpci.c
@@ -27,7 +27,6 @@
 #include <errno.h>
 
 #include "test.h"
-#include "tst_kconfig.h"
 #include "safe_macros.h"
 #include "old_module.h"
 
@@ -50,17 +49,9 @@ static void cleanup(void)
 
 void setup(void)
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
 	tst_require_root();
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brkm(TCONF, tst_exit, "module signature is enforced, skip test");
-
 	tst_sig(FORK, DEF_HANDLER, cleanup);
+	tst_check_module_signature_enforced();
 }
 
 static void run_pci_testcases(int bus, int slot)
diff --git a/testcases/kernel/device-drivers/uaccess/uaccess.c b/testcases/kernel/device-drivers/uaccess/uaccess.c
index c6dfeb8456..58bef13ef3 100644
--- a/testcases/kernel/device-drivers/uaccess/uaccess.c
+++ b/testcases/kernel/device-drivers/uaccess/uaccess.c
@@ -27,7 +27,6 @@
 #include <unistd.h>
 
 #include "test.h"
-#include "tst_kconfig.h"
 #include "old_module.h"
 #include "safe_macros.h"
 
@@ -93,20 +92,12 @@ static void tc_write_userspace(void)
 
 int main(int argc, char *argv[])
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
 	tst_parse_opts(argc, argv, NULL, NULL);
 
 	tst_require_root();
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brkm(TCONF, tst_exit, "module signature is enforced, skip test");
-
 	tst_sig(FORK, DEF_HANDLER, cleanup);
 
+	tst_check_module_signature_enforced();
 	tst_module_load(NULL, module_name, NULL);
 	module_loaded = 1;
 
diff --git a/testcases/kernel/firmware/fw_load_user/fw_load.c b/testcases/kernel/firmware/fw_load_user/fw_load.c
index b34b56fae5..7ebb2cc8ed 100644
--- a/testcases/kernel/firmware/fw_load_user/fw_load.c
+++ b/testcases/kernel/firmware/fw_load_user/fw_load.c
@@ -29,7 +29,6 @@
 #include <string.h>
 
 #include "test.h"
-#include "tst_kconfig.h"
 #include "safe_macros.h"
 #include "old_module.h"
 
@@ -103,9 +102,6 @@ static void help(void)
 
 void setup(int argc, char *argv[])
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
 	tst_parse_opts(argc, argv, options, help);
 
 	if (nflag) {
@@ -116,11 +112,7 @@ void setup(int argc, char *argv[])
 	}
 
 	tst_require_root();
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brkm(TCONF, tst_exit, "module signature is enforced, skip test");
+	tst_check_module_signature_enforced();
 
 	char fw_size_param[19];
 	snprintf(fw_size_param, 19, "fw_size=%d", fw_size);
diff --git a/testcases/kernel/syscalls/delete_module/delete_module01.c b/testcases/kernel/syscalls/delete_module/delete_module01.c
index 5ccbe6fd5b..48b324309f 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module01.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module01.c
@@ -17,7 +17,6 @@
 #include <stdlib.h>
 #include "tst_test.h"
 #include "tst_module.h"
-#include "tst_kconfig.h"
 #include "lapi/syscalls.h"
 
 #define MODULE_NAME	"dummy_del_mod"
@@ -27,13 +26,7 @@ static int module_loaded;
 
 static void do_delete_module(void)
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brk(TCONF, "module signature is enforced, skip test");
+	tst_check_module_signature_enforced();
 
 	if (!module_loaded) {
 		tst_module_load(MODULE_NAME_KO, NULL);
diff --git a/testcases/kernel/syscalls/delete_module/delete_module03.c b/testcases/kernel/syscalls/delete_module/delete_module03.c
index 76ccfb1e25..be358381ef 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module03.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module03.c
@@ -16,7 +16,6 @@
 #include <errno.h>
 #include "tst_test.h"
 #include "tst_module.h"
-#include "tst_kconfig.h"
 #include "lapi/syscalls.h"
 
 #define DUMMY_MOD		"dummy_del_mod"
@@ -52,13 +51,7 @@ static void do_delete_module(void)
 
 static void setup(void)
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
-		tst_brk(TCONF, "module signature is enforced, skip test");
+	tst_check_module_signature_enforced();
 
 	/* Load first kernel module */
 	tst_module_load(DUMMY_MOD_KO, NULL);
diff --git a/testcases/kernel/syscalls/finit_module/finit_module01.c b/testcases/kernel/syscalls/finit_module/finit_module01.c
index d75e5e4753..ea00e48356 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module01.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -17,7 +17,6 @@
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
-#include "tst_kconfig.h"
 
 #define MODULE_NAME	"finit_module.ko"
 
@@ -27,12 +26,7 @@ static char *mod_path;
 
 static void setup(void)
 {
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
-
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
+	if (tst_module_signature_enforced())
 		sig_enforce = 1;
 
 	tst_module_exists(MODULE_NAME, &mod_path);
@@ -43,7 +37,6 @@ static void setup(void)
 static void run(void)
 {
 	if (sig_enforce == 1) {
-		tst_res(TINFO, "module signature is enforced");
 		TST_EXP_FAIL(finit_module(fd, "status=valid", 0), EKEYREJECTED);
 		return;
 	}
diff --git a/testcases/kernel/syscalls/finit_module/finit_module02.c b/testcases/kernel/syscalls/finit_module/finit_module02.c
index dc81ae727d..e16164ee25 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module02.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -18,7 +18,6 @@
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
-#include "tst_kconfig.h"
 #include "tst_capability.h"
 
 #define MODULE_NAME	"finit_module.ko"
@@ -77,12 +76,8 @@ static struct tcase tcases[] = {
 static void setup(void)
 {
 	unsigned long int i;
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
 
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
+	if (tst_module_signature_enforced())
 		sig_enforce = 1;
 
 	tst_module_exists(MODULE_NAME, &mod_path);
diff --git a/testcases/kernel/syscalls/init_module/init_module01.c b/testcases/kernel/syscalls/init_module/init_module01.c
index d7ed08b143..850f826e62 100644
--- a/testcases/kernel/syscalls/init_module/init_module01.c
+++ b/testcases/kernel/syscalls/init_module/init_module01.c
@@ -17,7 +17,6 @@
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
-#include "tst_kconfig.h"
 
 #define MODULE_NAME	"init_module.ko"
 
@@ -28,12 +27,8 @@ static int sig_enforce;
 static void setup(void)
 {
 	int fd;
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
 
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
+	if (tst_module_signature_enforced())
 		sig_enforce = 1;
 
 	tst_module_exists(MODULE_NAME, NULL);
@@ -47,7 +42,6 @@ static void setup(void)
 static void run(void)
 {
 	if (sig_enforce == 1) {
-		tst_res(TINFO, "module signature is enforced");
 		TST_EXP_FAIL(init_module(buf, sb.st_size, "status=valid"), EKEYREJECTED);
 		return;
 	}
diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
index 3eb99574d9..c3979c08aa 100644
--- a/testcases/kernel/syscalls/init_module/init_module02.c
+++ b/testcases/kernel/syscalls/init_module/init_module02.c
@@ -17,7 +17,6 @@
 #include <stdlib.h>
 #include <errno.h>
 #include "lapi/init_module.h"
-#include "tst_kconfig.h"
 #include "tst_module.h"
 #include "tst_capability.h"
 
@@ -53,12 +52,8 @@ static void setup(void)
 {
 	struct stat sb;
 	int fd;
-	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
-	struct tst_kconfig_var kconfig = TST_KCONFIG_INIT("CONFIG_MODULE_SIG_FORCE");
 
-	tst_kcmdline_parse(&params, 1);
-	tst_kconfig_read(&kconfig, 1);
-	if (params.found || kconfig.choice == 'y')
+	if (tst_module_signature_enforced())
 		sig_enforce = 1;
 
 	tst_module_exists(MODULE_NAME, NULL);
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
