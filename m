Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9036E7D5
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 11:21:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57D533C6195
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 11:21:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9FCF3C2B9F
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 11:21:37 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 528F21001280
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 11:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1619688095; i=@fujitsu.com;
 bh=Rj3JfgwaPZlVzkgqs9x9e8B70Z+wdD4R4EnjfBvt0bk=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=vK4vBHVN/sCNjPi/8t4EZ/6i6FPdKuyJTv8eBhG9KtHrLT8rmpkg8UXsHbcA9AI0/
 qANPO6m9MksxEJR+UFjRqJqgw2TOAWuSPPPgDVl3B1dJHS/X7Vq/BATblR0Wcrh2h9
 LZYW4hldaut+F7/z+OwzOoFHUI5GoNu/doq+0OKHSWO8/Z9LjqqzLEhjaodR4ZbT0i
 juWRaQxMvZbDo4S0JXSRKVtreKACHOv3ESx2Yf19zh/Ev2pKdl631vYlJuRGrnHUvV
 1oN0+ODaSU5bO4g9y3uZgET2XOHTaA1Dvq1OjrGWdKrDXYvahPv61TwR8re6NIPOiL
 Z7BlJ7j0C0+QA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 19/DE-38008-F9A7A806;
 Thu, 29 Apr 2021 09:21:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MxVXd+VVe
 CwaKvLBaTDqdarPi+g9GByWPf73WsHu/3XWULYIpizcxLyq9IYM1YdPgHc8EtkYqnHZdZGxgP
 C3YxcnEICbxmlJhx9horhLObUaJhyTGWLkZODjYBTYlnnQuYQWwRAUmJjy2f2EFsZgFbiecPL
 7GB2MICARLL7jwFi7MIqEocbXwOFucV8JBo6pnNBGJLCChITHn4nhkiLihxcuYTFog5EhIHX7
 xghqhRlLjU8Y0Rwq6U6Fy/gHECI+8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6J
 rZGCql1ilm6SXWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAy6lEKWszsYv7z+oHeIUZKD
 SUmUd0tnZ4IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4dFV0JQoJFqempFWmZOcAIgElLcPAoi
 fCeKwFK8xYXJOYWZ6ZDpE4xKkqJ854F6RMASWSU5sG1waLuEqOslDAvIwMDgxBPQWpRbmYJqv
 wrRnEORiVhXo5KoCk8mXklcNNfAS1mAlq87HwbyOKSRISUVAOT/w1/taUvkxr4dHflqlWurv9
 08IKnCvP26olhe2Z7lDPWT7UTKNpYISWTlrzF+u1FdpF4c4bShtTPy07ZLeLydl+18opehIVq
 z1PjVx8qVmjNsJO7xMAsN3lq9r/7/wWucQak9fo8KClb/o7p3WL1ZRHcSSy2W30DDofsuS/ya
 v3yAsPJm/oXcf142HP54UGJ5TvinGNndx/MqtlScNHhvtnUwsKvTE/cTl5U/vtj5t6bClOWmF
 rc0WiLODXj1jyGyOZTTgcjH2hFxAhutOH9venT3y0rTHwDjRaEVO8IYTBuO/D3wp+TH9dbCyw
 PzHz49A0L77NIxl0Vevun385mV1tw5OIZzycC859tbyhLV2Ipzkg01GIuKk4EAGl8fFc1AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-17.tower-248.messagelabs.com!1619688094!255516!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24599 invoked from network); 29 Apr 2021 09:21:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-17.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Apr 2021 09:21:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T9LTXv025303
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 29 Apr 2021 10:21:34 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 10:21:27 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <jstancek@redhat.com>
Date: Thu, 29 Apr 2021 17:21:46 +0800
Message-ID: <1619688106-2179-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix/mlock_8-1,
 munlock_10-1: document the introduced patch
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The previous patch f52839ba25 ("openposix/mlock_8-1,munlock_10-1: document known aarch64 issue")
has documented the fix patch, I have verified the introdueced patch is 057d3389108ed
("mm: untag user pointers passed to memory syscalls"). So add it in comment and make testers known
 whether it is a regression test or a new bug when hitting the EINVAL error.

Also modify the kernel version scope of the problem.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../conformance/interfaces/mlock/8-1.c                     | 7 +++++--
 .../conformance/interfaces/munlock/10-1.c                  | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
index b2cd21c95..d8722c7f6 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
@@ -13,10 +13,13 @@
  *
  * Assume that the value LONG_MAX is an invalid pointer.
  *
- * aarch64 linux versions v5.3 up to v5.6-rc1 may incorrectly report
- * EINVAL instead of ENOMEM, see:
+ * aarch64 linux versions v5.4-rc1 up to v5.6-rc3 may incorrectly report
+ * EINVAL instead of ENOMEM, the fix patch see:
  *   597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
  *   d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")
+ *
+ * this bug was introduced because of the following commit, see:
+ *   057d3389108e ("mm: untag user pointers passed to memory syscalls")
  */
 
 #include <sys/mman.h>
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
index 93414df46..e1c13d5fc 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
@@ -13,10 +13,13 @@
  *
  * Assume that the value LONG_MAX is an invalid pointer.
  *
- * aarch64 linux versions v5.3 up to v5.6-rc1 may incorrectly report
- * EINVAL instead of ENOMEM, see:
+ * aarch64 linux versions v5.4-rc1 up to v5.6-rc3 may incorrectly report
+ * EINVAL instead of ENOMEM, the fix patch see:
  *   597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
  *   d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")
+ *
+ * this bug was introduced because of the following commit, see:
+ *   057d3389108e ("mm: untag user pointers passed to memory syscalls")
  */
 
 #include <sys/mman.h>
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
