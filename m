Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 495ED34E376
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:46:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94E23C2793
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:46:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9133E3C2805
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:21:31 +0100 (CET)
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A33CA1A0119E
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:21:30 +0100 (CET)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 25 Mar 2021 11:21:22 -0700
Received: from ubuntu.localdomain (unknown [10.166.136.228])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id BC0C1205E0;
 Thu, 25 Mar 2021 11:21:25 -0700 (PDT)
From: Sharan Turlapati <sturlapati@vmware.com>
To: <ltp@lists.linux.it>
Date: Thu, 25 Mar 2021 11:21:25 -0700
Message-ID: <20210325182125.2646-1-sturlapati@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sturlapati@vmware.com does not
 designate permitted sender hosts)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 30 Mar 2021 10:46:26 +0200
Subject: [LTP] [PATCH] realtime/scripts: Fix indentation error in parser.py
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
Cc: anishs@vmware.com, vsirnapalli@vmware.com, akaher@vmware.com,
 ankitja@vmware.com, bordoloih@vmware.com, bvikas@vmware.com,
 srivatsa@csail.mit.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

An indentation error in parser.py causes certain blocks
of code to run even before dependent variables are
initialized when the code in this file is imported
by parse-testpi1.py or parse-testpi2.py.

Post running tests like testpi-2 or testpi-4, the
results of these tests are parsed and added to the
logs/ directory. This bug prevents the results of such
tests from being parsed and thus masks the results of
these tests.

Signed-off-by: Sharan Turlapati <sturlapati@vmware.com>
---
 testcases/realtime/scripts/parser.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/realtime/scripts/parser.py b/testcases/realtime/scripts/parser.py
index 85226deb6..2acbe7d67 100644
--- a/testcases/realtime/scripts/parser.py
+++ b/testcases/realtime/scripts/parser.py
@@ -33,15 +33,15 @@ class Log:
 	def __init__(self,filename):
 		if filename:
 			log_file=filename
-	try:
-		self.__log_file = open(log_file, "r")
-	except IOError as errmsg:
-		sys.exit(errmsg)
+		try:
+			self.__log_file = open(log_file, "r")
+		except IOError as errmsg:
+			sys.exit(errmsg)
 
 	def read(self):
 		for line in self.__log_file.read().split("\n"):
 			yield line
-	self.__log_file.close()
+		self.__log_file.close()
 
 	def eval(self):
 		pass
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
