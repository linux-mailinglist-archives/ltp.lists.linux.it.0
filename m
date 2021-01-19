Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B32FB669
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:41:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F033B3C30C8
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:41:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 74AF43C2557
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:40:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 478321400BC0
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:40:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB5BCABDA
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 13:40:57 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 Jan 2021 14:40:57 +0100
Message-Id: <20210119134057.17785-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Reduce ksm06 memory footprint
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

Allocating 10,000 pages requires over 600MB on PPC64. This may result in some
pages being pushed to swap even if the test machine has 1GB of RAM per NUMA
node. Reduce memory footprint a little to avoid bogus failures.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/mm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runtest/mm b/runtest/mm
index 481d39691..eeebd878e 100644
--- a/runtest/mm
+++ b/runtest/mm
@@ -70,7 +70,7 @@ ksm04_1 ksm04 -u 128
 ksm05 ksm05 -I 10
 ksm06 ksm06
 ksm06_1 ksm06 -n 10
-ksm06_2 ksm06 -n 10000
+ksm06_2 ksm06 -n 8000
 
 cpuset01 cpuset01
 
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
