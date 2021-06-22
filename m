Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5683B02D9
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:35:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74E783C7072
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:35:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20A6F3C229B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7119860070A
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 27ABD21984;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyb4VTfDDy7Sg4da4d2iSz/9XBN/qDQ2ICe92g45zsI=;
 b=kgK+03+cBWjsbSW6OGPmNAsdO6PAYsftV8FJVnNvNDb7oUGnEnZoYVF7Sj0RVam5F4Bapi
 jwofPafnvi58Afj9juJHJKqDIYu28vYKyjY+gKL/ef4h/9zsqIQlatw06TNwhGf7F0cg2a
 zTI8zIpEbM2H9V5mgOts3kCYtugyO1Y=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id EEEB2A3B84;
 Tue, 22 Jun 2021 11:35:39 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:07 +0100
Message-Id: <20210622113514.22284-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/8] ipc: Fix uninitialized var error by removing
 useless arg
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 libs/libltpipc/libipc.c                         | 4 +---
 testcases/kernel/syscalls/ipc/semctl/semctl01.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/libs/libltpipc/libipc.c b/libs/libltpipc/libipc.c
index d94880f54..c2ecbf02d 100644
--- a/libs/libltpipc/libipc.c
+++ b/libs/libltpipc/libipc.c
@@ -122,13 +122,11 @@ void init_buf(MSGBUF * m_buf, int type, int size)
  */
 void rm_sema(int sem_id)
 {
-	union semun arr;
-
 	if (sem_id == -1) {	/* no semaphore to remove */
 		return;
 	}
 
-	if (semctl(sem_id, 0, IPC_RMID, arr) == -1) {
+	if (semctl(sem_id, 0, IPC_RMID) == -1) {
 		tst_resm(TINFO, "WARNING: semaphore deletion failed.");
 		tst_resm(TINFO, "This could lead to IPC resource problems.");
 		tst_resm(TINFO, "id = %d", sem_id);
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl01.c b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
index b12385970..ff691adf8 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl01.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
@@ -196,10 +196,8 @@ static void func_sall(void)
 
 static void func_sval(void)
 {
-	int semv;
-	union semun arr;
+	int semv = SAFE_SEMCTL(sem_id, 4, GETVAL);
 
-	semv = SAFE_SEMCTL(sem_id, 4, GETVAL, arr);
 	if (semv != INCVAL)
 		tst_res(TFAIL, "semaphore value is not what was set");
 	else
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
