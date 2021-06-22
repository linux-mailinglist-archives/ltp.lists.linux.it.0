Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B903B02E2
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88C123C700B
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 371BA3C7012
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D3804200AE7
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 837992197D;
 Tue, 22 Jun 2021 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ortettxNI0+Ho/Gfxm10UajmpVFnGK/OUS7ictsdmI=;
 b=Q0kaSDbAbzQiXVwpYubO1+algNibqblSbnUlQPj2sAibGL0wxE8iyr+7CSM5S6HrwbpF4x
 xsSs4g2wAahnQkf/46SeZazcrjPjnPpnrBgvrkKQ1caBVYZqHTrA1GpznJHh0VwC67HN7c
 OK0eh7qGC946Bladduo9q2XX8mby45w=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 4DB40A3B84;
 Tue, 22 Jun 2021 11:35:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:12 +0100
Message-Id: <20210622113514.22284-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 6/8] shmat01: Fix uninitialized var error
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

The compiler is confused by SAFE_WAITPID which it thinks will return
after an error. Setting status to zero silences the error.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/ipc/shmat/shmat01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmat/shmat01.c b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
index f75914799..606bdd154 100644
--- a/testcases/kernel/syscalls/ipc/shmat/shmat01.c
+++ b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
@@ -82,7 +82,7 @@ static void verify_shmat(unsigned int n)
 {
 	int *addr;
 	pid_t pid;
-	int status;
+	int status = 0;
 	struct shmid_ds buf;
 
 	struct test_case_t *tc = &tcases[n];
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
