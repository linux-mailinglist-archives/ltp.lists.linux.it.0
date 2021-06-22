Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE83B02E3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1960D3C7027
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CED73C700B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1DA8F1A00882
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:42 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CC25C21984;
 Tue, 22 Jun 2021 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBSbTls7yulr4egdYLmW750TKTk3kelDOlCBBM/ZVDQ=;
 b=OR+9igRqlM2+3TES+8XkLE9HMNW8nDgVFKr1xT4XkDTjWWkmPQu2wbxqnGHHjJveXgRHHu
 0hZu2C+WdqTykNZSWQ+6sPbj9LDQrHsqOFMZ3CCGvYdbdvz9F2r5L3Aohu+4NGRZSs26uj
 jYEAcDfy7yQD6XXhenwNcZ9wIg3cLiQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 9529DA3B85;
 Tue, 22 Jun 2021 11:35:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:13 +0100
Message-Id: <20210622113514.22284-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 7/8] crash02: Save actual child PID instead of
 uninitialized variable
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
 testcases/misc/crash/crash02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
index e46c2aa66..66f308b70 100644
--- a/testcases/misc/crash/crash02.c
+++ b/testcases/misc/crash/crash02.c
@@ -197,9 +197,8 @@ void monitor_fcn(int sig)
 void badboy_fork(void)
 {
 	int status, pid;
-	pid_t child;
-	child = fork();
-	badboy_pid = status;
+	pid_t child = fork();
+
 	switch (child) {
 	case -1:
 		perror("fork");
@@ -211,6 +210,7 @@ void badboy_fork(void)
 #endif
 		exit(0);
 	default:
+		badboy_pid = child;
 		if (verbose_level > 3)
 			printf("badboy pid = %d\n", badboy_pid);
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
