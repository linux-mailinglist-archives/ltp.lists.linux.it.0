Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC832B437
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 05:52:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A62B73C56FD
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 05:52:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CC8013C56D3
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 05:52:35 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B2AB820007F
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 05:52:34 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,219,1610380800"; d="scan'208";a="105072221"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Mar 2021 12:52:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6CACC4CE8509
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 12:52:30 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Mar 2021 12:52:30 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Mar 2021 12:52:29 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 3 Mar 2021 12:30:12 +0800
Message-ID: <20210303043014.484426-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6CACC4CE8509.AA7D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] docparse/docparse.c: Make docparse check implied
 flags recursively
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

Current docparse cannot check implied flags recursively.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 docparse/docparse.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/docparse/docparse.c b/docparse/docparse.c
index 9f617c8bb..5879a9944 100644
--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -361,14 +361,16 @@ static const char *filter_out[] = {
 
 static struct implies {
 	const char *flag;
-	const char *implies;
+	const char **implies;
 } implies[] = {
-	{"format_device", "needs_device"},
-	{"mount_device", "needs_device"},
-	{"mount_device", "format_device"},
-	{"all_filesystems", "needs_device"},
-	{"needs_device", "needs_tmpdir"},
-	{NULL, NULL}
+	{"mount_device", (const char *[]) {"format_device", "needs_device",
+		"needs_tmpdir", NULL}},
+	{"format_device", (const char *[]) {"needs_device", "needs_tmpdir",
+		NULL}},
+	{"all_filesystems", (const char *[]) {"needs_device", "needs_tmpdir",
+		NULL}},
+	{"needs_device", (const char *[]) {"needs_tmpdir", NULL}},
+	{NULL, (const char *[]) {NULL}}
 };
 
 const char *strip_name(char *path)
@@ -384,7 +386,7 @@ const char *strip_name(char *path)
 
 int main(int argc, char *argv[])
 {
-	unsigned int i;
+	unsigned int i, j;
 	struct data_node *res;
 
 	if (argc != 2) {
@@ -402,15 +404,23 @@ int main(int argc, char *argv[])
 
 	/* Normalize the result */
 	for (i = 0; implies[i].flag; i++) {
-		if (data_node_hash_get(res, implies[i].flag) &&
-		    data_node_hash_get(res, implies[i].implies))
-			fprintf(stderr, "%s: useless tag: %s\n", argv[1], implies[i].implies);
+		if (data_node_hash_get(res, implies[i].flag)) {
+			for (j = 0; implies[i].implies[j]; j++) {
+				if (data_node_hash_get(res, implies[i].implies[j]))
+					fprintf(stderr, "%s: useless tag: %s\n",
+						argv[1], implies[i].implies[j]);
+			}
+		}
 	}
 
 	for (i = 0; implies[i].flag; i++) {
-		if (data_node_hash_get(res, implies[i].flag) &&
-		    !data_node_hash_get(res, implies[i].implies))
-			data_node_hash_add(res, implies[i].implies, data_node_string("1"));
+		if (data_node_hash_get(res, implies[i].flag)) {
+			for (j = 0; implies[i].implies[j]; j++) {
+				if (!data_node_hash_get(res, implies[i].implies[j]))
+					data_node_hash_add(res, implies[i].implies[j],
+							   data_node_string("1"));
+			}
+		}
 	}
 
 	data_node_hash_add(res, "fname", data_node_string(argv[1]));
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
