Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B813DF96C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:53:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63FCB3C87E7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:53:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C87DC3C1882
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:53:23 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08D4B6005E0
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:53:22 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 1741qtM7034024;
 Wed, 4 Aug 2021 09:52:55 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 4 Aug 2021
 09:52:56 +0800
Date: Wed, 4 Aug 2021 09:52:53 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210804015248.GA22328@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 1741qtM7034024
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v6,
 1/4] lib: tst_umount: umount a mount point instead of a device
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Current check inside tst_umount for whehter a device is mounted is ambiguous.
Fix it by checking for the existance of the exact mount point the fs is mounted upon,
and use the mount point instead of the device to do the umount process.
This patch make tst_umount umount TST_MNTPOINT by default,
and reject any argument that does not start with '/'.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 testcases/lib/tst_test.sh | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c6aa2c487..1060bda2f 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -277,31 +277,35 @@ tst_mount()
 
 tst_umount()
 {
-	local device="${1:-$TST_DEVICE}"
+	local mntpoint="${1:-$TST_MNTPOINT}"
 	local i=0
 
-	[ -z "$device" ] && return
+	[ -z "$mntpoint" ] && return
 
-	if ! grep -q "$device" /proc/mounts; then
-		tst_res TINFO "The $device is not mounted, skipping umount"
+	if [[ "$mntpoint" != /* ]]; then
+		tst_brk TCONF "The $mntpoint is not an absolute path"
+	fi
+
+	if ! grep -q "${mntpoint%/}" /proc/mounts; then
+		tst_res TINFO "The $mntpoint is not mounted upon, skipping umount"
 		return
 	fi
 
 	while [ "$i" -lt 50 ]; do
-		if umount "$device" > /dev/null; then
+		if umount "$mntpoint" > /dev/null; then
 			return
 		fi
 
 		i=$((i+1))
 
-		tst_res TINFO "umount($device) failed, try $i ..."
+		tst_res TINFO "umount($mntpoint) failed, try $i ..."
 		tst_res TINFO "Likely gvfsd-trash is probing newly mounted "\
 		              "fs, kill it to speed up tests."
 
 		tst_sleep 100ms
 	done
 
-	tst_res TWARN "Failed to umount($device) after 50 retries"
+	tst_res TWARN "Failed to umount($mntpoint) after 50 retries"
 }
 
 tst_mkfs()
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
