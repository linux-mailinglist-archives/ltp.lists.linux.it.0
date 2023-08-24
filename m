Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FE7864BF
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Aug 2023 03:43:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 744ED3CC669
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Aug 2023 03:43:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B6F33CC5B3
 for <ltp@lists.linux.it>; Thu, 24 Aug 2023 03:43:12 +0200 (CEST)
Received: from smtp.priv.miraclelinux.com
 (202x210x215x66.ap202.ftth.ucom.ne.jp [202.210.215.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9264720116E
 for <ltp@lists.linux.it>; Thu, 24 Aug 2023 03:43:10 +0200 (CEST)
Received: from localhost.localdomain (21A0035i-SL7B460.priv.miraclelinux.com
 [10.2.1.161])
 by smtp.priv.miraclelinux.com (Postfix) with ESMTP id 2EEEC140052;
 Thu, 24 Aug 2023 10:43:03 +0900 (JST)
From: Souta Kawahara <souta.kawahara@miraclelinux.com>
To: ltp@lists.linux.it
Date: Thu, 24 Aug 2023 10:33:08 +0900
Message-Id: <f8c3549f405479aa521dd654c105a2ba8d4d6f36.1692839061.git.souta.kawahara@miraclelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/1] doc/c-test-api.txt: fix broken example code
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

There is double definition of 'test'.
Fixed it.

Signed-off-by: Souta Kawahara <souta.kawahara@miraclelinux.com>
---
 doc/c-test-api.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index e4e88edec..560a1a203 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -36,7 +36,7 @@ static void setup(void)
 		tst_brk(TBROK | TERRNO, "setenv() failed");
 }
 
-static void test(void)
+static void run(void)
 {
 	char *ret;
 
@@ -64,7 +64,7 @@ next:
 }
 
 static struct tst_test test = {
-	.test_all = test,
+	.test_all = run,
 	.setup = setup,
 };
 -------------------------------------------------------------------------------
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
