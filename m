Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB52D777A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 15:30:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3794A3C227B
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 15:30:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 98B193C18B5
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 15:30:46 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 86A3D140172C
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 15:30:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D96BCC057E3C
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 13:30:43 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F735D6A9
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 13:30:43 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 15 Oct 2019 15:30:36 +0200
Message-Id: <031b8dbecf1c08d3b00f876943b744274e6a5785.1571146155.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 15 Oct 2019 13:30:43 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] pcrypt_aead01: break early when approaching timeout
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

PowerNV (P9 witherspoon, 176CPUs) systems running latest upstream
kernel (5.3.6) have been observed to come very close to test timeout
and also sporadically fail, because they couldn't complete 10000
iterations in time.

Each iteration of test leads to modprobe of cryptomgr and crypto
framework running number of tests, taking up to ~70ms per iteration.

Looking at traces, a significant contributor is wakeup time. After
one crypto test is done, it takes ~0.5ms for other tests to resume:
  (gettimeofday_us)
  1571141551769329      7 kworker/1:1(897):<-crypto_req_done
  1571141551769843   1603 cryptomgr_test(3813):

Booting with powersave=off cuts this latency significantly, single
iteration of test completes in ~10ms.

But changing kernel defaults isn't very practical solution, hence patch
is watching for timeout approaching and breaks the loop early.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/crypto/pcrypt_aead01.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/crypto/pcrypt_aead01.c b/testcases/kernel/crypto/pcrypt_aead01.c
index d9c27f69dce7..3dc8c58c2817 100644
--- a/testcases/kernel/crypto/pcrypt_aead01.c
+++ b/testcases/kernel/crypto/pcrypt_aead01.c
@@ -54,6 +54,12 @@ void run(void)
 		TEST(tst_crypto_del_alg(&ses, &a));
 		if (TST_RET)
 			tst_brk(TBROK | TRERRNO, "del_alg");
+
+		if (tst_timeout_remaining() < 10) {
+			tst_res(TINFO, "Time limit reached, stopping at "
+				"%d iterations", i);
+			break;
+		}
 	}
 
 	tst_res(TPASS, "Nothing bad appears to have happened");
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
