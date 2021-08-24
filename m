Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37D3F5DC6
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:18:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A58CF3C31FA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:18:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E95F3C03AB
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:18:43 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 53D8E1A00141
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:18:40 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17OCIDFt075888;
 Tue, 24 Aug 2021 20:18:13 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu02 (10.0.12.212) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 24 Aug 2021 20:18:12 +0800
Date: Tue, 24 Aug 2021 20:18:06 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <YSTjfqHs/vgYmU2l@ubuntu02>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.212]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17OCIDFt075888
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v7, 2/4] doc: change the default behavior of tst_umount
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

Modify tst_umount to umount TST_MNTPOINT by default in previous commit.
Modify the document accordingly.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 doc/shell-test-api.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index bf297ab07..ecdbe9e6a 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -515,11 +515,11 @@ The 'tst_mount' mounts '$TST_DEVICE' of '$TST_FS_TYPE' (optional) to
 '$TST_MNT_PARAMS'. The '$TST_MNTPOINT' directory is created if it didn't
 exist prior to the function call.
 
-If the path passed (optional, defaults to '$TST_DEVICE') to the 'tst_umount' is
+If the path passed (optional, defaults to '$TST_MNTPOINT') to the 'tst_umount' is
 not mounted (present in '/proc/mounts') it's noop.
-Otherwise it retries to umount the filesystem a few times on a failure, which
-is a workaround since there are a daemons dumb enough to probe all newly
-mounted filesystems, which prevents them from umounting shortly after they
+Otherwise it retries to umount the filesystem a few times on failure.
+This is a workaround since there are daemons dumb enough to probe all newly
+mounted filesystems, and prevents them from being umounted shortly after they
 were mounted.
 
 ROD and ROD_SILENT
-- 
2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
