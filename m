Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B9FAF853
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 10:57:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07AB83C2091
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 10:57:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C108E3C182C
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 10:57:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7947F1001BD8
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 10:57:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CED48B667
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 08:57:22 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: ltp@lists.linux.it
Date: Wed, 11 Sep 2019 10:55:36 +0200
Message-Id: <20190911085536.25546-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Use LTP_TIMEOUT_MUL in TST_RETRY_FN()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We discovered timeout problems for well known candidates.
Most of the time we already use LTP_TIMEOUT_MUL in other cases to
globally increase timeout value. So doing it for this function as well.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 testcases/lib/tst_test.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0b24c6b9..80b8871cb 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -162,9 +162,11 @@ EXPECT_FAIL()
 
 TST_RETRY_FN_EXP_BACKOFF()
 {
+	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
+
 	local tst_fun="$1"
 	local tst_exp=$2
-	local tst_sec=$(expr $3 \* 1000000)
+	local tst_sec=$(expr $3 \* 1000000 \* $LTP_TIMEOUT_MUL)
 	local tst_delay=1
 
 	if [ $# -ne 3 ]; then
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
