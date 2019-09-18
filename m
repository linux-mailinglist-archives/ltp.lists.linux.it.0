Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9EB5AF5
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 07:35:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C1E93C20AE
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 07:35:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5E3693C2080
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 07:35:27 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A812C20126E
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 07:35:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09B5710DCC81;
 Wed, 18 Sep 2019 05:35:25 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD4FF5D6A5;
 Wed, 18 Sep 2019 05:35:23 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 18 Sep 2019 13:35:19 +0800
Message-Id: <20190918053519.26244-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Wed, 18 Sep 2019 05:35:25 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

As the tst_taint_init comments described, If the tainted-flags are already set
by the kernel, there is no reason to continue and TCONF is generated. But in
the function achieve, it uses TBROK.

  cmdline="cve-2017-17053"
  tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
  tst_taint.c:88: BROK: Kernel is already tainted: 536871424

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Chang Yin <cyin@redhat.com>
Cc: Michael Moese <mmoese@suse.de>
---

Notes:
    Hi Cyril & Michael,
    
    I'm not sure if that's a good choice to skip whole test if the kernel already
    tainted, so maybe we could also perform it but not do a strict tainted-flags
    check after testing? The reason I think is it probably have chance to find
    new issue even with a tainted kernel.
    
    Any suggestion?

 lib/tst_taint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_taint.c b/lib/tst_taint.c
index a5dbf77d2..f7cafb96f 100644
--- a/lib/tst_taint.c
+++ b/lib/tst_taint.c
@@ -85,7 +85,7 @@ void tst_taint_init(unsigned int mask)
 
 	taint = tst_taint_read();
 	if ((taint & mask) != 0)
-		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
+		tst_brk(TCONF, "Kernel is already tainted: %u", taint);
 }
 
 
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
