Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4432B0916
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:57:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A47DA3C5FFB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:57:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D21233C5FF6
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:57:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 88AB26005D4
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:57:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA267AF99;
 Thu, 12 Nov 2020 15:57:05 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Nov 2020 16:47:47 +0100
Message-Id: <20201112154748.17857-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112154748.17857-1-chrubis@suse.cz>
References: <20201112154748.17857-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: tst_bool_expr: Add support for strings
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

There are cases where special characters, e.g. parentesis appear in the
value of a kernel config variable, so in order to be able to parse
boolean variables such as "CONFIG_DEFAULT_HOSTNAME=\"(none)\"" the
tokenizer must be able to parse strings.

The implementation is easy, when in string we do not split the input
into tokens.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/config01        | 1 +
 lib/newlib_tests/config02        | 1 +
 lib/newlib_tests/config03        | 1 +
 lib/newlib_tests/config04        | 1 +
 lib/newlib_tests/config05        | 1 +
 lib/newlib_tests/test_kconfig.c  | 1 +
 lib/newlib_tests/tst_bool_expr.c | 3 +++
 lib/tst_bool_expr.c              | 7 +++++++
 8 files changed, 16 insertions(+)

diff --git a/lib/newlib_tests/config01 b/lib/newlib_tests/config01
index 96d68d836..1d94d810a 100644
--- a/lib/newlib_tests/config01
+++ b/lib/newlib_tests/config01
@@ -2,3 +2,4 @@
 CONFIG_MMU=y
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=4
+CONFIG_DEFAULT_HOSTNAME="(none)"
diff --git a/lib/newlib_tests/config02 b/lib/newlib_tests/config02
index 2de45cff8..e1b0e8086 100644
--- a/lib/newlib_tests/config02
+++ b/lib/newlib_tests/config02
@@ -2,3 +2,4 @@
 # CONFIG_MMU is not set
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=4
+CONFIG_DEFAULT_HOSTNAME="(none)"
diff --git a/lib/newlib_tests/config03 b/lib/newlib_tests/config03
index 1a3b9e648..05c8e194a 100644
--- a/lib/newlib_tests/config03
+++ b/lib/newlib_tests/config03
@@ -2,3 +2,4 @@
 CONFIG_MMU=y
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=44
+CONFIG_DEFAULT_HOSTNAME="(none)"
diff --git a/lib/newlib_tests/config04 b/lib/newlib_tests/config04
index cce7051ae..da01579b6 100644
--- a/lib/newlib_tests/config04
+++ b/lib/newlib_tests/config04
@@ -2,3 +2,4 @@
 CONFIG_MMU=y
 CONFIG_EXT4_FS=y
 CONFIG_PGTABLE_LEVELS=4
+CONFIG_DEFAULT_HOSTNAME="(none)"
diff --git a/lib/newlib_tests/config05 b/lib/newlib_tests/config05
index a9d7bab4d..490f94fa6 100644
--- a/lib/newlib_tests/config05
+++ b/lib/newlib_tests/config05
@@ -1,3 +1,4 @@
 # Everything is wrong
 CONFIG_EXT4_FS=y
 CONFIG_PGTABLE_LEVELS=44
+CONFIG_DEFAULT_HOSTNAME=""
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfig.c
index 1f659b95a..9280f07ca 100644
--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -16,6 +16,7 @@ static const char *kconfigs[] = {
 	"CONFIG_PGTABLE_LEVELS=4",
 	"CONFIG_MMU & CONFIG_EXT4_FS=m",
 	"CONFIG_EXT4_FS=m | CONFIG_MMU",
+	"CONFIG_DEFAULT_HOSTNAME=\"(none)\"",
 	NULL
 };
 
diff --git a/lib/newlib_tests/tst_bool_expr.c b/lib/newlib_tests/tst_bool_expr.c
index f9bb1780d..8f0929d35 100644
--- a/lib/newlib_tests/tst_bool_expr.c
+++ b/lib/newlib_tests/tst_bool_expr.c
@@ -102,6 +102,9 @@ static void do_test(void)
 	do_eval_test("False & A", 1, 0, 0, 0);
 	do_eval_test("! Undefined", 0, 0, 0, -1);
 
+	do_eval_test("\"(none)\"", 0, 0, 0, -1);
+	do_eval_test("\"(none)\" & \" \"", 0, 0, 0, -1);
+
 	parse_fail("A!");
 	parse_fail("A &");
 	parse_fail("A B");
diff --git a/lib/tst_bool_expr.c b/lib/tst_bool_expr.c
index dd147cde3..387c38b91 100644
--- a/lib/tst_bool_expr.c
+++ b/lib/tst_bool_expr.c
@@ -81,6 +81,13 @@ static unsigned int tokenize(const char *expr, struct tst_expr_tok *last)
 			token_cnt += new_tok(&last, &expr[j], i - j);
 			j = i+1;
 		break;
+		case '"':
+			while (expr[i+1] != '"' && expr[i+1])
+				i++;
+
+			if (expr[i+1] == '"')
+				i++;
+		break;
 		default:
 		break;
 		}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
