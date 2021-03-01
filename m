Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DACE32946F
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:03:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E8293C7F49
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:03:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A253C3C575A
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 69227600A0C
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 007F0AF49;
 Mon,  1 Mar 2021 22:02:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Mar 2021 23:02:22 +0100
Message-Id: <20210301220222.22705-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301220222.22705-1-pvorel@suse.cz>
References: <20210301220222.22705-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] zram: Increase timeout according to used devices
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to avoid unexpected timeout, which occurred even on just 4 zram devices.

On my system where run with ext{2,3,4}, xfs, btrfs, vfat, exfat, ntfs
it run for 12 min, i.e. mean 90s. Multiply by security constant 5,
expecting 450 sec for each filesystem.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* increase timeout based on measurement (Cyril)

 testcases/kernel/device-drivers/zram/zram_lib.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 65e431e86..fe9c915c3 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -47,6 +47,8 @@ zram_load()
 		tst_brk TBROK "dev_num must be > 0"
 	fi
 
+	tst_set_timeout $((dev_num*450))
+
 	tst_res TINFO "create '$dev_num' zram device(s)"
 
 	modprobe zram num_devices=$dev_num || \
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
