Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1337132B639
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 10:35:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1C873C56A8
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 10:35:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 78ACD3C568E
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 10:35:45 +0100 (CET)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 830B66002EA
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 10:35:44 +0100 (CET)
X-Originating-IP: 78.113.208.92
Received: from localhost.localdomain (92.208.113.78.rev.sfr.net
 [78.113.208.92]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 802A1240004;
 Wed,  3 Mar 2021 09:35:43 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Wed,  3 Mar 2021 10:35:42 +0100
Message-Id: <20210303093542.9292-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] cmdlib: Update exists function to exit with TCONF
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
Cc: thomas.petazzoni@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The exists function which tests the existence of a command was returning
an error.
Update it to return TCONF and exit with the value 32.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

This function is only used by ftp01.sh test.
The real effort should be to rewrite ftp01 test to the new API, but I did
not manage to do it properly and makes it compatible with the other
ftp clients.

 testcases/lib/cmdlib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/cmdlib.sh b/testcases/lib/cmdlib.sh
index e4986c39c..ad93e3cc8 100644
--- a/testcases/lib/cmdlib.sh
+++ b/testcases/lib/cmdlib.sh
@@ -103,8 +103,8 @@ exists()
 {
     for cmd in $*; do
         if ! command -v $cmd >/dev/null 2>&1; then
-            end_testcase "$cmd: command not found"
-            exit 1
+            tst_brkm TCONF NULL "$1: command $2 not found."
+            exit 32
         fi
     done
 }
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
