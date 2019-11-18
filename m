Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE791001EE
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 10:59:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C33463C1841
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 10:59:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6FA6A3C1483
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:59:21 +0100 (CET)
Received: from ATCSQR.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B3FAF1000D24
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:59:17 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id xAIA0COb043882
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 18:00:12 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 18 Nov 2019
 17:58:57 +0800
From: Dylan Chung <dylan@andestech.com>
To: <ltp@lists.linux.it>
Date: Mon, 18 Nov 2019 17:58:58 +0800
Message-ID: <20191118095858.22067-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com xAIA0COb043882
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] pan/ltp-pan.c: Add file parsing protection
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
Cc: alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

------------------
v1->v2:
1.replace "strlen(a)==0" with "a[0]== 0".
2.Add more detail description in commit message.
------------------

This patch adds protection and print warning when the command part
of the tests is empty.
A segmentation fault occurs when given the wrong format in test cases file.
for example:
    name  command line
    ----- -----------------
    dio10 diotest4 -b 65536    (O)
    dio10                      (X)
    dio10    diotest4 -b 65536 (X)
In this patch, ltp-pan will return empty collection when the given
testcase files are wrongly formatted and cause ltp-pan to abort.
The warning message will indicate the name of the error testcase.

Signed-off-by: Dylan Chung <dylan@andestech.com>
---
 pan/ltp-pan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
index 8ac484ec6..e3d2e619d 100644
--- a/pan/ltp-pan.c
+++ b/pan/ltp-pan.c
@@ -1200,6 +1200,14 @@ static struct collection *get_collection(char *file, int optind, int argc,
 				n->pcnt_f[1] = 's';
 			}
 			n->name = strdup(strsep(&a, " \t"));
+			while (a != NULL && isspace(*a))
+				a++;
+			if (a == NULL || a[0] == 0) {
+				fprintf(stderr,
+					"pan(%s): Testcase '%s' requires a command to execute.\n",
+					panname, n->name);
+				return NULL;
+			}
 			n->cmdline = strdup(a);
 			n->next = NULL;
 
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
