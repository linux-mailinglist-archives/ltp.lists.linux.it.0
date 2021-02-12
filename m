Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5C31A134
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 16:14:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366373C8D57
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 16:14:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E4D8D3C6BA3
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 16:14:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8DE501000AD7
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 16:14:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0045BAF30
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 15:14:14 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Feb 2021 16:15:25 +0100
Message-Id: <20210212151525.20112-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] mq_timedreceive_5-3: Initialize maxmsg
 properly
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

The test can be actually executed as non-root user but the maxmsg must
be set to a value that is less by user limit for messages and since we
do not send any messages we can safely initialize it to 1.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../conformance/interfaces/mq_timedreceive/5-3.c               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
index cc592f5a7..87f3365d5 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
@@ -55,7 +55,8 @@ int main(void)
 	sprintf(mqname, "/" FUNCTION "_" TEST "_%d", getpid());
 
 	attr.mq_msgsize = BUFFER;
-	attr.mq_maxmsg = BUFFER;
+	attr.mq_maxmsg = 1;
+
 	mqdes = mq_open(mqname, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR, &attr);
 	if (mqdes == (mqd_t) - 1) {
 		perror(ERROR_PREFIX "mq_open");
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
