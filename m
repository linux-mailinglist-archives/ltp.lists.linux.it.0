Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383332B438
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 05:52:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E009B3C56EB
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 05:52:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 811DE3C660C
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 05:52:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C4FF320007F
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 05:52:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,219,1610380800"; d="scan'208";a="105072224"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Mar 2021 12:52:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 93DCD4CE8517
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 12:52:36 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Mar 2021 12:52:30 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Mar 2021 12:52:30 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 3 Mar 2021 12:30:13 +0800
Message-ID: <20210303043014.484426-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303043014.484426-1-yangx.jy@cn.fujitsu.com>
References: <20210303043014.484426-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 93DCD4CE8517.AB19F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] docparse/docparse.c: Add missing entries into
 struct implies
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

needs_checkpoints and resource_files imply needs_tmpdir.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 docparse/docparse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docparse/docparse.c b/docparse/docparse.c
index 5879a9944..790c84a84 100644
--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -370,6 +370,8 @@ static struct implies {
 	{"all_filesystems", (const char *[]) {"needs_device", "needs_tmpdir",
 		NULL}},
 	{"needs_device", (const char *[]) {"needs_tmpdir", NULL}},
+	{"needs_checkpoints", (const char *[]) {"needs_tmpdir", NULL}},
+	{"resource_files", (const char *[]) {"needs_tmpdir", NULL}},
 	{NULL, (const char *[]) {NULL}}
 };
 
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
