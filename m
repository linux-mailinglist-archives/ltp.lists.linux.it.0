Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A734D2F3
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 16:57:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 570273C8D10
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 16:57:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 427683C1A2B
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 16:57:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5DF79200938
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 16:57:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8768EABB1;
 Mon, 29 Mar 2021 14:57:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Mar 2021 16:57:38 +0200
Message-Id: <20210329145738.986-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_mkfs: Add -I option to mkfs.vfat
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to workaround occasional error on tests with .all_filesystems flag:

tst_test.c:888: TINFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0',
 not making filesystem (use -I to override)
tst_test.c:888: TBROK: mkfs.vfat failed with exit code 1

Tested also on BusyBox v1.33.0, which accept but ignores -I since
beginning (1.14.0).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Richard also suggested to wipe the device, but not sure how to do it
quickly and don't bring any more dependency.

Kind regards,
Petr

 lib/tst_mkfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
index 736324f04..2d335a3ad 100644
--- a/lib/tst_mkfs.c
+++ b/lib/tst_mkfs.c
@@ -52,6 +52,16 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 
 	snprintf(mkfs, sizeof(mkfs), "mkfs.%s", fs_type);
 
+	/*
+	 * Workaround a problem:
+	 * mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not
+	 * making filesystem (use -I to override)
+	 */
+	if (!strcmp(fs_type, "vfat")) {
+		argv[pos] = "-I";
+		strcat(fs_opts_str, argv[pos++]);
+	}
+
 	if (fs_opts) {
 		for (i = 0; fs_opts[i]; i++) {
 			argv[pos++] = fs_opts[i];
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
