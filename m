Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F3106959
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:57:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 472F43C23E2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:57:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3614D3C2241
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:57:00 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3ED70200D2D
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:56:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91DD8AE2C
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 09:56:58 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Nov 2019 10:56:58 +0100
Message-Id: <20191122095658.20836-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] network/fanout01: Add CVE and git tags
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/network/packet/fanout01.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/network/packet/fanout01.c b/testcases/network/packet/fanout01.c
index f5ce19a12..5067d83a8 100644
--- a/testcases/network/packet/fanout01.c
+++ b/testcases/network/packet/fanout01.c
@@ -106,4 +106,10 @@ static struct tst_test test = {
 	.test_all = run,
 	.cleanup = cleanup,
 	.needs_root = 1,
+	.tags = (const struct tst_tag[]) {
+		{"CVE", "2017-15649"},
+		{"linux-git", "4971613c1639"},
+		{"linux-git", "008ba2a13f2d"},
+		{}
+	}
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
