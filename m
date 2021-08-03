Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0613DE856
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:26:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DCD63C8131
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:26:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E5143C5771
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:26:02 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 99D4E200B85
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627979160; i=@fujitsu.com;
 bh=yMNe34rmJal8pPIr7TfbqmKQQpHjsj0Ft+ra315dBPY=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=S1h35TW2X3u4MNvVAXvdZiPkO7zbAy5IVw2mM/T4A9rMsKYQgwV5CnD/t6S7CFN1v
 IcQGMurCxhV+7ea2q/8XPo1h54voHgGrJnL7bMwnN2/MOksfRR5RwAaBfI9z6/m1er
 OGFI/x0wssg4L2vSuzZMyYBAOeCMDjJ/c+VsQdaJNf+LKqmbXo1CLjh0OCBWFzELwE
 AH4A2q9So8GojxAgoi5O8XE4FhKPhs4JrKhb9WdxBxFIX+kTPkg3zLYWFqgi4yakDo
 q77an8ttWY3feN0X1De5xLX9kQag+x8/c9K5edUw0IlIF3mEBfYAbEziQghJKILZVV
 x+khj3ImUpB2A==
Received: from [100.113.0.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 7B/57-09935-89DF8016;
 Tue, 03 Aug 2021 08:26:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRojvjL0e
 iQe97AYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNePi5+VsBTf5KyYfnsPSwLiDt4uRi0NIoJlJ
 ouP/EvYuRk4gZzejxPvVySA2m4CmxLPOBcwgtoiAhERHw1uwGmYBdYnlk34xdTFycAgLBEpcX
 iUIEmYRUJF49GkCI4jNK+Au8WrWMjBbQkBBYsrD98wQcUGJkzOfsECMkZA4+OIFM0SNosSljm
 9Q9RUSs2a1MU1g5J2FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11DXSNTI30Eqt0E/V
 SS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgeGVUsjwZwfj6jcf9A4xSnIwKYnyyt7kSBTi
 S8pPqcxILM6ILyrNSS0+xCjDwaEkwSv8GygnWJSanlqRlpkDDHWYtAQHj5IIbxxImre4IDG3O
 DMdInWKUVFKnJfrD1BCACSRUZoH1waLr0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnPg0
 zhycwrgZv+CmgxE9DiqRmsIItLEhFSUg1MkacF/RzFrv0Mvq+11nrqyu23Fva/ebjinp+gSkt
 SyaeJ4gfLPbkEl94seRa2NeSGsV/Xtzu9IpectJeZLWllZJ2gbp5YlrPq9LeuFK9Vz+rWr+jz
 CZJaOJ9/2vmk3yZK1fvaOy+IfVBZNu+Q2EeJl7Hz/4v+sinKNTSZuc6x3c1z25qw4kk+Zx+nf
 bphw+S5vu2BActfE8O07KiAhd0bWrLdPh+ViLNasUAvWTW1/qsK3xnJB991so/GvdLlTT1m8e
 Hb1jD7oJi6gqhb8XL9HtEfOV5KSWuIPTR4/M1M+ZrUXv+Jh7j1/oaWNV9aEuFt/mNXdsoOpkM
 T1nWeDhetuN61tcJecs+DV25H/buUWIozEg21mIuKEwECpK6eKgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-10.tower-226.messagelabs.com!1627979159!160607!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6074 invoked from network); 3 Aug 2021 08:26:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-10.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2021 08:26:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1738PqbE027488
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 3 Aug 2021 09:25:59 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 3 Aug 2021 09:25:50 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 3 Aug 2021 16:26:06 +0800
Message-ID: <1627979166-967-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/madvise06: Add madvise WILLNEED performance
 problem tag
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

When running this case on 5.10-rc1 kernel, it will trigger the following failure
......
madvise06.c:74: TINFO:  memory.kmem.usage_in_bytes: 1752 Kb
madvise06.c:208: TPASS: more than 102400 Kb were moved to the swap cache
madvise06.c:217: TINFO: PageFault(madvice / no mem access): 102400
madvise06.c:221: TINFO: PageFault(madvice / mem access): 105600
madvise06.c:82: TINFO: After page access
madvise06.c:84: TINFO:  Swap: 307540 Kb
madvise06.c:86: TINFO:  SwapCached: 100480 Kb
madvise06.c:88: TINFO:  Cached: 102056 Kb
madvise06.c:74: TINFO:  memory.current: 204636 Kb
madvise06.c:74: TINFO:  memory.swap.current: 411476 Kb
madvise06.c:74: TINFO:  memory.kmem.usage_in_bytes: 1752 Kb
madvise06.c:226: TFAIL: 3200 pages were faulted out of 2 max

It fails because of madvise WILLNEED performance problem, so add the introduced and
fixed commit.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/madvise/madvise06.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 63d8d5452..f2f65ff96 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -35,6 +35,12 @@
  * faults. Two faults are allowed incase some tasklet or something
  * else unexpected, but irrelevant procedure, registers a fault to
  * our process.
+ *
+ * It also can reproduce the MADV_WILLNEED preformance problem.
+ * It was introduced since 5.9 kernel with the following commit
+ *   e6e88712e43b ("mm: optimise madvise WILLNEED")
+ * and fixed since 5.10-rc5 kernel with the following commit
+ *   66383800df9c ("mm: fix madvise WILLNEED performance problem").
  */
 
 #include <errno.h>
@@ -242,6 +248,8 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "55231e5c898c"},
 		{"linux-git", "8de15e920dc8"},
+		{"linux-git", "e6e88712e43b"},
+		{"linux-git", "66383800df9c"},
 		{}
 	}
 };
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
