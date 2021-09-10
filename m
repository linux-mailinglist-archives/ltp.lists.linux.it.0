Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B57406CAE
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 15:09:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAECD3C96C8
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 15:09:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A291B3C8CD7
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 15:08:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 913F41A00891
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 15:08:29 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2464920212;
 Fri, 10 Sep 2021 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631279309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzO2rNfG4s8JtNFUQt5Lqmsh/XHzFoTz0q241AYSk28=;
 b=0+PAAnH//MxPslKBchdBIv9HLbmKz2r71txBzOkayQ8cP8wu7IP8UNVajWJ/nog1fD6esV
 yGEDTqRlirsKeLnXknmPk/Lxkr5kClQcsnnCma3zLRw8fXnE0MKwJNVne+sn9B61RMSvD4
 UZ72veD1G+hxLH5eNXV3m0vME8FCRQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631279309;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzO2rNfG4s8JtNFUQt5Lqmsh/XHzFoTz0q241AYSk28=;
 b=xqxVWOz8JYK3Ls+Ih44mkYNUusrGpF/M00sXHn04H5a3uygCPfsRcEaG4StLNC6Vpr/3jB
 BUxRrMlBw8dw+eCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E30F5133D0;
 Fri, 10 Sep 2021 13:08:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eO/zNcxYO2HKdAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 10 Sep 2021 13:08:28 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Sep 2021 15:08:15 +0200
Message-Id: <20210910130820.21141-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910130820.21141-1-pvorel@suse.cz>
References: <20210910130820.21141-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/7] sched/process.c: Open debugfp with freopen()
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

From: Petr Vorel <petr.vorel@gmail.com>

i.e. use the recommended way.

This fixes compilation on MUSL which does not like assignment to stderr:

    process.c:551:14: error: assignment of read-only variable 'stderr'
      551 |      debugfp = fopen(foo, "a+");
          |              ^

Also drop debugfp definition. It'd be more obvious to use FILE pointer
for logging, but some debug functions are intended to use to log into
both stderr and into the log files (or at least logging is before stderr
is redirected into the log files), thus use stderr as file descriptor.

Although not sure why part of the code is logged into stdout and other
part into file, let's keep it.

Suggested-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/sched/process_stress/process.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/sched/process_stress/process.c b/testcases/kernel/sched/process_stress/process.c
index 2dd501f2e..777cdecd4 100644
--- a/testcases/kernel/sched/process_stress/process.c
+++ b/testcases/kernel/sched/process_stress/process.c
@@ -141,12 +141,6 @@ timer_t timer;			/* timer structure */
 
 Pinfo *shmaddr;			/* Start address  of shared memory */
 
-#ifndef _LINUX
-FILE *debugfp = stderr;		/* debug file pointer, used if AUSDEBUG set */
-#else
-#define debugfp stderr
-#endif
-
 struct envstruct *edat = envdata;	/* pointer to environment data */
 
 /* external function declarations */
@@ -260,7 +254,7 @@ void debugout(char *fmt, ...)
 
 	if (AUSDEBUG) {
 		va_start(args, fmt);
-		vfprintf(debugfp, fmt, args);
+		vfprintf(stderr, fmt, args);
 		va_end(args);
 	}
 }
@@ -546,7 +540,12 @@ int spawn(int val)
 			if (!pid) {	/* CHILD */
 				if (AUSDEBUG) {
 					sprintf(foo, "%sslot%d", SLOTDIR, tval);
-					debugfp = fopen(foo, "a+");
+
+					if ((freopen(foo, "w", stderr)) == NULL) {
+						fprintf(stderr, "freopen(%s, w, stderr) failed: %s (%d)\n",
+								foo, strerror(errno), errno);
+						exit(1);
+					}
 				}
 				pinfo = put_proc_info(tval);
 
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
