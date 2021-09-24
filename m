Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36841416ECD
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 11:21:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E38843C8F24
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 11:21:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C9693C8610
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 11:21:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 610122011C7
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 11:21:34 +0200 (CEST)
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id C1FED22405;
 Fri, 24 Sep 2021 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1632475293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uZ8PHT5ZMmWymSx2ib4p7Q6vDeedeQ6DPqjDBGWgNAQ=;
 b=lQgPBI6I40ZC6G1CCJI7B/HWBn0d2+MVui2Koa8RS0Sy60nCtzJAYMOfgRYIXBnfgmFYbM
 rD9QpKVnYMc8epYPct2W5ada5CTEdffYQ8rAQvIDMf7TxFARjentiYPDgnYMHfGINma7Uw
 E20WW3sUxlxc4oB5VqOvmD/5JS+riik=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay1.suse.de (Postfix) with ESMTP id 90CDE25D40;
 Fri, 24 Sep 2021 09:21:33 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 24 Sep 2021 10:21:10 +0100
Message-Id: <20210924092111.20012-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] msgrcv07: Check negative msg type filters
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It should leave higher message types on the queue if they are above
the specified type's magnitude.

Also check what happens when MSG_EXCEPT is passed with a negative msg
type. This behavior is unspecified, but presently the kernel ignores
the flag if the type is negative. The motivation to check this is long
handling in 32bit compat mode. If the msg type is not sign extended
then it will be treated as a large positive integer. In this case we
should receive the remaining message.

On the current kernel under x86 the test passes because the system
call has an explicit compat variant which performs the sign
extension. Otherwise it would fail.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index 2c687c5c8..8635ef7a4 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -232,6 +232,13 @@ static void test_negative_msgtyp(void)
 			"-msgtyp didn't get the first message in the queue with the lowest type");
 	}
 
+	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, IPC_NOWAIT),
+		     ENOMSG,
+		     "-msgtype didn't recv next lowest msg");
+	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, MSG_EXCEPT | IPC_NOWAIT),
+		     ENOMSG,
+		     "-msgtype (with except) didn't recv next lowest msg");
+
 exit:
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 	queue_id = -1;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
