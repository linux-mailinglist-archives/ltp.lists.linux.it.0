Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FCAD96C2
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CC4C3C22C1
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9791B3C1445
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 14DAD600294
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A95E5B371;
 Wed, 16 Oct 2019 16:15:55 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: pvorel@suse.cz,
	liwang@redhat.com,
	ltp@lists.linux.it
Date: Wed, 16 Oct 2019 18:15:18 +0200
Message-Id: <20191016161519.11256-3-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191016161519.11256-1-cfamullaconrad@suse.de>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/4] tst_common.h: Use tst_multiply_timeout in
 TST_RETRY_FN()
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

Because of timeout problems when using TST_RETRY_FN() we want a LTP_TIMEOUT_MUL
adopted timeout value here as well.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 include/tst_common.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/tst_common.h b/include/tst_common.h
index c21505450..b901273b0 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -50,12 +50,14 @@
 	TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, 1)
 
 #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)	\
-({	int tst_delay_ = 1;						\
+({	unsigned int tst_delay_, tst_max_delay_;			\
+	tst_delay_ = 1;							\
+	tst_max_delay_ = tst_multiply_timeout(MAX_DELAY * 1000000);	\
 	for (;;) {							\
 		typeof(FUNC) tst_ret_ = FUNC;				\
 		if (tst_ret_ == ERET)					\
 			break;						\
-		if (tst_delay_ < MAX_DELAY * 1000000) {			\
+		if (tst_delay_ < tst_max_delay_) {			\
 			usleep(tst_delay_);				\
 			tst_delay_ *= 2;				\
 		} else {						\
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
