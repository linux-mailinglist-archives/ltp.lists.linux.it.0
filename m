Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8872E1BF5
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 12:37:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 289A13C56DF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 12:37:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6ECD13C2A9D
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 12:37:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B4F60200DCE
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 12:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608723434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ME9TQzFfIJBzFUlnLNN5CBZwDrL5Ko0Auu8FUBk2NVY=;
 b=qbx8lQl9ffWESOzP+LcHfCC8P8eUaRcqFUUFaUv7PbT+9JlCIpEv0o9uGSL+c+kE6n7zki
 khNRlSu7gcZGGbRVipJvLrDEsCoVCydFgEm+d+TIpBMISYCsvkIFmVm/zqPuMQVpuXLvv4
 BQNlDNe8HUdmsgVWOHowaf/v+rBlV+Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D107AE57;
 Wed, 23 Dec 2020 11:37:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 23 Dec 2020 11:36:36 +0000
Message-Id: <20201223113636.9617-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] af_alg07: Add linux-git reference to more general fix
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While trying to reintroduce this error on kernel 5.10 I found that a
secondary fix has been applied which fixes many more socket types and
may obsolete the original fix. Ideally we would create a new test
based on Eric's reproducer, but for now I will just include a
reference to the second fix.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/crypto/af_alg07.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
index c94bb292f..ef13ad764 100644
--- a/testcases/kernel/crypto/af_alg07.c
+++ b/testcases/kernel/crypto/af_alg07.c
@@ -15,13 +15,22 @@
  *
  * The race window is small and it's hard to trigger a kernel crash but
  * fchownat() will return ENOENT as it should only when the bug is not
- * present. Race fixed in:
+ * present. Race fixed specifically for af_alg in:
  *
  *  commit 9060cb719e61b685ec0102574e10337fa5f445ea
  *  Author: Mao Wenan <maowenan@huawei.com>
  *  Date:   Mon Feb 18 10:44:44 2019 +0800
  *
  *  net: crypto set sk to NULL when af_alg_release.
+ *
+ * It was observed that the same bug is present on many other
+ * protocols. A more general fix is in:
+ *
+ *  commit ff7b11aa481f682e0e9711abfeb7d03f5cd612bf
+ *  Author: Eric Biggers <ebiggers@google.com>
+ *  Date:   Thu Feb 21 14:13:56 2019 -0800
+ *
+ *  net: socket: set sock->sk to NULL after calling proto_ops::release()
  */
 
 #include <sys/types.h>
@@ -118,6 +127,7 @@ static struct tst_test test = {
 	.min_cpus = 2,
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.tags = (const struct tst_tag[]) {
+		{"linux-git", "ff7b11aa481f"},
 		{"linux-git", "9060cb719e61"},
 		{"CVE", "2019-8912"},
 		{}
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
