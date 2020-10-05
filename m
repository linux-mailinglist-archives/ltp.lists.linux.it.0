Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA82283314
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 11:21:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5AE33C59B3
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 11:21:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0C5853C2601
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 11:20:47 +0200 (CEST)
Received: from mo-csw.securemx.jp (mo-csw1514.securemx.jp [210.130.202.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 38B721400DCB
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 11:20:42 +0200 (CEST)
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0959KdX7025217;
 Mon, 5 Oct 2020 18:20:39 +0900
X-Iguazu-Qid: 34trc0u0FBqxsGGyVJ
X-Iguazu-QSIG: v=2; s=0; t=1601889639; q=34trc0u0FBqxsGGyVJ;
 m=aippuYxWK0LA7b7z2kgJr6wNpwwdWGWXSL6raWXcGpw=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1511) id 0959Kc7b016270;
 Mon, 5 Oct 2020 18:20:39 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
 by imx12.toshiba.co.jp  with ESMTP id 0959Kcsk021220
 for <ltp@lists.linux.it>; Mon, 5 Oct 2020 18:20:38 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 0959Kcob006854
 for <ltp@lists.linux.it>; Mon, 5 Oct 2020 18:20:38 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: ltp@lists.linux.it
Date: Mon,  5 Oct 2020 18:20:29 +0900
X-TSB-HOP: ON
Message-Id: <20201005092029.3482531-1-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 05 Oct 2020 11:21:37 +0200
Subject: [LTP] [PATCH] syscalls/mq_notify: Don't fail if mq_notify is not
 supported
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
Cc: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When CONFIG_POSIX_MQUEUE is configured off, the mq_notify02 test
erroneously reports a failure rather than a missing configuration.

Update the test case to call this out separate to the failure case.

Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
Hi,

Noticed the issue while analysing test report on a system with
CONFIG_POSIX_MQUEUE turned off.

Please cc me on comments as I'm not subscribed to the list.

Thanks,
Punit

 testcases/kernel/syscalls/mq_notify/mq_notify02.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify02.c b/testcases/kernel/syscalls/mq_notify/mq_notify02.c
index fe59b5a11..e2269cd8e 100644
--- a/testcases/kernel/syscalls/mq_notify/mq_notify02.c
+++ b/testcases/kernel/syscalls/mq_notify/mq_notify02.c
@@ -77,6 +77,8 @@ static void mq_notify_verify(struct test_case_t *test)
 
 	if (TEST_ERRNO == test->exp_errno) {
 		tst_resm(TPASS | TTERRNO, "mq_notify failed as expected");
+	} else if (TEST_ERRNO == ENOSYS) {
+		tst_resm(TCONF | TTERRNO, "mq_notify not available (ENOSYS)");
 	} else {
 		tst_resm(TFAIL | TTERRNO,
 			 "mq_notify failed unexpectedly; expected: %d - %s",
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
