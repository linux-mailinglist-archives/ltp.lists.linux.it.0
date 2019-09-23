Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BECBB1B0
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 11:52:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 812BD3C1D02
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 11:52:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E205F3C1C7C
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 11:52:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C5F4F1001563
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 11:51:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E7B6AF65
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 09:52:04 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Sep 2019 11:52:03 +0200
Message-Id: <20190923095203.30362-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/getxattr01: Fix rare failures
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

The test was observed to fail on s390x, the cause is obviously that we
use strcmp() for something that is not guaranteed to be null terminated.
That is because we store the string without the terminating null into
the extended attribute and the allocated buffer we read the attribute to
is not initialized either.

Fix the test by checking the returned size first then using memcmp()
instead of strcmp(). This change is just pre-release band-aid with
minimal changes, I've opened issue #583 so that we don't forget to
rewrite the test later on.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/getxattr/getxattr01.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/getxattr/getxattr01.c b/testcases/kernel/syscalls/getxattr/getxattr01.c
index be410a536..54ca65390 100644
--- a/testcases/kernel/syscalls/getxattr/getxattr01.c
+++ b/testcases/kernel/syscalls/getxattr/getxattr01.c
@@ -121,7 +121,14 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		if (strcmp(tc[i - 1].value, XATTR_TEST_VALUE))
+		if (TEST_RETURN != XATTR_TEST_VALUE_SIZE) {
+			tst_resm(TFAIL,
+				 "getxattr() returned wrong size %ld expected %d",
+				 TEST_RETURN, XATTR_TEST_VALUE_SIZE);
+			continue;
+		}
+
+		if (memcmp(tc[i - 1].value, XATTR_TEST_VALUE, XATTR_TEST_VALUE_SIZE))
 			tst_resm(TFAIL, "Wrong value, expect \"%s\" got \"%s\"",
 				 XATTR_TEST_VALUE, tc[i - 1].value);
 		else
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
