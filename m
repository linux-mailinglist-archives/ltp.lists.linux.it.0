Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE04B5389
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Feb 2022 15:41:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A19E33C9FCF
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Feb 2022 15:41:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7083C3C812E
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 15:41:23 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D61E8200BCF
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 15:41:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7C4B1F38B;
 Mon, 14 Feb 2022 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644849681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEd8NpJYQ56PgsoFwLSeUkjc6igz4QY2oOEpSrC7wmc=;
 b=Nd8lJHvtLnVjH6SRBiM6Ggt6cOxjn5xcqSMM1pIJsC0qbphu4scGyJHCvWr2alloAsgMSh
 hwo/RZGWpFbFllZb6OxFkvKYc9QEtyytlfhBqvcZ1ROKrB41jrzMlaZYTHAoEEzYgATXRi
 UpGD1PTg1hsRZaxmRA5cYgPNudeSk9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644849681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEd8NpJYQ56PgsoFwLSeUkjc6igz4QY2oOEpSrC7wmc=;
 b=QLSG++YmNKQHHQKGe5w44mp2LpWIr7A2kK2DOgFqWNCRTgaV4GQMRhIdfDEXViA0LvyTat
 H6zkA5H/HNJMfoCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9322D13B3A;
 Mon, 14 Feb 2022 14:41:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vAWrIxFqCmLyTAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 14 Feb 2022 14:41:21 +0000
Date: Mon, 14 Feb 2022 15:43:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YgpqjzgEADLg5cXb@yuki>
References: <20220210110712.23596-1-andrea.cervesato@suse.de>
 <20220210110712.23596-4-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210110712.23596-4-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] Rewrite process_vm_writev02.c using new
 LTP API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Applied with minor changes, thanks.

diff --git a/testcases/kernel/syscalls/cma/process_vm_writev02.c b/testcases/kernel/syscalls/cma/process_vm_writev02.c
index b535a8ff1..991110d24 100644
--- a/testcases/kernel/syscalls/cma/process_vm_writev02.c
+++ b/testcases/kernel/syscalls/cma/process_vm_writev02.c
@@ -109,11 +109,9 @@ static void run(void)
 
 	SAFE_WAITPID(pid_write, &status, 0);
 	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-		tst_res(TFAIL, "child 1: returns %s", tst_strstatus(status));
+		tst_res(TFAIL, "write child: %s", tst_strstatus(status));
 
 	TST_CHECKPOINT_WAKE(0);
-
-	SAFE_WAITPID(pid_alloc, &status, 0);
 }
 
 static struct tst_test test = {


I've adjusted the FAIL message a bit and also removed the waitpid(), if
we want the library to collect the alloc child the test library has to
wait() it not us.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
