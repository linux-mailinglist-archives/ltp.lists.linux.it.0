Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9E2F5B82
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 08:46:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD9BB3C3170
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 08:46:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AAD613C2660
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 08:46:17 +0100 (CET)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BB030600977
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 08:46:15 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10E7hGll018808
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 15:43:16 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Thu, 14 Jan 2021
 15:46:02 +0800
Date: Thu, 14 Jan 2021 15:46:03 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210114074603.GB32318@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10E7hGll018808
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] device-drivers/zram: Fix false-judgement on
 zram's presence
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

Date: Thu, 14 Jan 2021 15:27:34 +0800
From: Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: [LTP][PATCH 1/1] device-drivers/zram: Fix false-judgement on zram's presence

zram_lib.sh uses the return value of modinfo to check if zram module exists,
but the behavior of modinfo implemented by busybox is different.

The busybox-implemented modinfo would also return true (code: 0)
even if zram module is not present,
so grep the info that only shows when the module exists.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 3f4d1d55f..04d4a4da6 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -211,5 +211,5 @@ zram_mount()
 	tst_res TPASS "mount of zram device(s) succeeded"
 }
 
-modinfo zram > /dev/null 2>&1 ||
+modinfo zram | grep "filename" > /dev/null 2>&1 ||
 	tst_brk TCONF "zram not configured in kernel"
-- 
2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
