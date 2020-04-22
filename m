Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 986791B3DDB
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:20:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD3F63C297A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:20:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AABFD3C2965
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:20:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 23EDF1400F43
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:20:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 373B5ABCC
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:20:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 12:20:07 +0200
Message-Id: <20200422102007.14244-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Add tags to setsockopt04 and add it to the CVE runfile
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

Fixes #491

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

This test scenario has some potential to cause false positives if the send
buffer size changes to unsigned type in kernel.

 runtest/cve                                         | 1 +
 testcases/kernel/syscalls/setsockopt/setsockopt04.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/runtest/cve b/runtest/cve
index 629cf7035..942e5a5d7 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -13,6 +13,7 @@ cve-2016-5195 dirtyc0w
 cve-2016-7042 cve-2016-7042
 cve-2016-7117 cve-2016-7117
 cve-2016-9604 keyctl08
+cve-2016-9793 setsockopt04
 cve-2016-10044 cve-2016-10044
 cve-2017-2618 cve-2017-2618
 cve-2017-2671 cve-2017-2671
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt04.c b/testcases/kernel/syscalls/setsockopt/setsockopt04.c
index fda5c6b02..50d82346c 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt04.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt04.c
@@ -61,4 +61,9 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "b98b0bc8c431"},
+		{"CVE", "2016-9793"},
+		{}
+	}
 };
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
