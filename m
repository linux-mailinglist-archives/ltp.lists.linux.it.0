Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE53088FD
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 13:18:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0205D3C77EB
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 13:18:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id ADB0D3C2F7A
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 13:18:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4CFCD1A00700
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 13:18:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80468ABDA;
 Fri, 29 Jan 2021 12:18:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 13:18:13 +0100
Message-Id: <20210129121817.12563-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129121817.12563-1-pvorel@suse.cz>
References: <20210129121817.12563-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] zram: Require root
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

Calling modprobe, rmmod and working with zram device requires root.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index bdbf2453a..6fa6552ca 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -7,6 +7,7 @@ dev_makeswap=-1
 dev_mounted=-1
 
 TST_NEEDS_TMPDIR=1
+TST_NEEDS_ROOT=1
 TST_SETUP="zram_load"
 TST_CLEANUP="zram_cleanup"
 TST_NEEDS_DRIVERS="zram"
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
