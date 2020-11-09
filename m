Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E12AB856
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:34:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3257E3C2F7A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:34:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 45B1B3C0888
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:34:43 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 14BA61A00EB4
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:34:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; d="scan'208";a="101095640"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 20:34:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BFE7A4CE3A76
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 20:34:40 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 20:34:40 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 9 Nov 2020 07:34:31 -0500
Message-ID: <1604925271-4811-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BFE7A4CE3A76.AB6C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] pan/ltp-pan.c: fix file descriptors leaks
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

ltp-pan will leak file descriptors of fopen() into the child process
of the test case, fix this problem by using mode "e" for fopen().

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 pan/ltp-pan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
index 8b9fbe5..25e554f 100644
--- a/pan/ltp-pan.c
+++ b/pan/ltp-pan.c
@@ -336,7 +336,7 @@ int main(int argc, char **argv)
 		if (!strcmp(logfilename, "-")) {
 			logfile = stdout;
 		} else {
-			if ((logfile = fopen(logfilename, "a+")) == NULL) {
+			if ((logfile = fopen(logfilename, "a+e")) == NULL) {
 				fprintf(stderr,
 					"pan(%s): Error %s (%d) opening log file '%s'\n",
 					panname, strerror(errno), errno,
@@ -453,7 +453,7 @@ int main(int argc, char **argv)
 	}
 
 	if (failcmdfilename) {
-		if (!(failcmdfile = fopen(failcmdfilename, "a+"))) {
+		if (!(failcmdfile = fopen(failcmdfilename, "a+e"))) {
 			fprintf(stderr,
 				"pan(%s): Error %s (%d) opening fail cmd file '%s'\n",
 				panname, strerror(errno), errno,
@@ -463,7 +463,7 @@ int main(int argc, char **argv)
 	}
 
 	if (tconfcmdfilename) {
-		tconfcmdfile = fopen(tconfcmdfilename, "a+");
+		tconfcmdfile = fopen(tconfcmdfilename, "a+e");
 		if (!tconfcmdfile) {
 			fprintf(stderr, "pan(%s): Error %s (%d) opening "
 				"tconf cmd file '%s'\n", panname,
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
