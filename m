Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1479FD443
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 06:29:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40B723C2397
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 06:29:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B69553C17A2
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 06:29:38 +0100 (CET)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9BCA01000AFB
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 06:29:35 +0100 (CET)
Received: by atcsqa06.andestech.com (Postfix, from userid 5393)
 id 05990C0871; Fri, 15 Nov 2019 13:29:28 +0800 (CST)
From: Dylan Chung <dylan@andestech.com>
To: ltp@lists.linux.it
Date: Fri, 15 Nov 2019 13:29:06 +0800
Message-Id: <20191115052906.2643-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=3.5 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS,TO_NO_BRKTS_DYNIP autolearn=disabled version=3.4.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] pan/ltp-pan.c: Add file parsing protection
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A segmentation fault occurs given the wrong format in test cases file.
for example:
    name  command line
    ----- -----------------
    dio10 diotest4 -b 65536    (O)
    dio10                      (X)
    dio10    diotest4 -b 65536 (X)
This patch adds protection and print warning when the command part
of the tests is empty or multiple whitespaces.

Signed-off-by: Dylan Chung <dylan@andestech.com>
---
 pan/ltp-pan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
index 8ac484ec6..470bcbfc5 100644
--- a/pan/ltp-pan.c
+++ b/pan/ltp-pan.c
@@ -1200,6 +1200,14 @@ static struct collection *get_collection(char *file, int optind, int argc,
 				n->pcnt_f[1] = 's';
 			}
 			n->name = strdup(strsep(&a, " \t"));
+			while (a != NULL && isspace(*a))
+				a++;
+			if (a == NULL || strlen(a) == 0) {
+				fprintf(stderr,
+					"pan(%s): Testcase '%s' requires a command to execute.\n",
+					panname, n->name);
+				return 0;
+			}
 			n->cmdline = strdup(a);
 			n->next = NULL;
 
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
