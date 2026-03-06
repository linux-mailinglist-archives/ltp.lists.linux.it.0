Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDK4FX+6qmmiVwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 12:29:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10021FA6D
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 12:29:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A0013CF18A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 12:29:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7AC2B3C21D7
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 12:28:51 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0A3E31000EB1
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 12:28:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4986D5BCC7;
 Fri,  6 Mar 2026 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772796530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+jX7tZpIOiG1/RBgo2UdJyKbvNrbd/hw4xCQC8bzFA=;
 b=EEs8iNg0FGhyXAkCWi/+oHZZCb4y1GHIgJaLwR+mdQU/e4Hted6ibJBxhF5mvDnK0xaC8i
 +Q/l/OgcUvWOx2XH1rrTlhRYuzr6ZwJrC0mKgtAgx8990kfaIy0eJE+EknkY8sdQ7NxvaM
 MCTj2Kso/AnUNlSRMu7ZUxL76nqER+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772796530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+jX7tZpIOiG1/RBgo2UdJyKbvNrbd/hw4xCQC8bzFA=;
 b=NdcpZ4kzrZNz6SsQEq8MnbmxM0spIckatk8WpzpurYhtKvGWX3FbZLUyWgdFc+kjwxwkJ5
 KSRVx/OJ9U5eq0Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772796530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+jX7tZpIOiG1/RBgo2UdJyKbvNrbd/hw4xCQC8bzFA=;
 b=EEs8iNg0FGhyXAkCWi/+oHZZCb4y1GHIgJaLwR+mdQU/e4Hted6ibJBxhF5mvDnK0xaC8i
 +Q/l/OgcUvWOx2XH1rrTlhRYuzr6ZwJrC0mKgtAgx8990kfaIy0eJE+EknkY8sdQ7NxvaM
 MCTj2Kso/AnUNlSRMu7ZUxL76nqER+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772796530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+jX7tZpIOiG1/RBgo2UdJyKbvNrbd/hw4xCQC8bzFA=;
 b=NdcpZ4kzrZNz6SsQEq8MnbmxM0spIckatk8WpzpurYhtKvGWX3FbZLUyWgdFc+kjwxwkJ5
 KSRVx/OJ9U5eq0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AD1D3EA75;
 Fri,  6 Mar 2026 11:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uBFEDXK6qmnMdwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 06 Mar 2026 11:28:50 +0000
Date: Fri, 6 Mar 2026 12:28:57 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aaq6eVykSC-dSZHg@yuki.lan>
References: <69a70250.050a0220.3bc433.165d@mx.google.com>
 <20260306072008.3111-1-always.starving0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306072008.3111-1-always.starving0@gmail.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: clean up build and make check findings
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
X-Rspamd-Queue-Id: EC10021FA6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	NEURAL_SPAM(0.00)[0.829];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Rspamd-Action: no action

Hi!
> For the -Wformat-truncation warning in inotify02.c, how about fixing it
> by adjusting the snprintf() call?
> 
> For example:
>   snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
>   snprintf(fname3, BUF_SIZE, "%.*s.rename2", (int)(BUF_SIZE -
>                                             sizeof(".rename2")), fname1);
> 
> Also, regarding the make check warning about ENOSYS: if I revert the code,
> the warning will remain. Should this just be left as-is, or is there
> another way to handle it?
> 
>   inotify.h:36: WARNING: ENOSYS means 'invalid syscall nr' and nothing else

The easiest solution is to make fname2 and fname3 array larger:

diff --git a/testcases/kernel/syscalls/inotify/inotify02.c b/testcases/kernel/syscalls/inotify/inotify02.c
index 314c1bd49..21a29676a 100644
--- a/testcases/kernel/syscalls/inotify/inotify02.c
+++ b/testcases/kernel/syscalls/inotify/inotify02.c
@@ -35,7 +35,7 @@
 #define EVENT_BUF_LEN        (EVENT_MAX * (EVENT_SIZE + 16))

 #define BUF_SIZE 256
-static char fname1[BUF_SIZE], fname2[BUF_SIZE], fname3[BUF_SIZE];
+static char fname1[BUF_SIZE], fname2[BUF_SIZE+32], fname3[BUF_SIZE + 32];
 static int fd, fd_notify, reap_wd;
 static int wd;

@@ -86,7 +86,7 @@ void verify_inotify(void)
        test_cnt++;

        SAFE_GETCWD(fname1, BUF_SIZE);
-       snprintf(fname2, BUF_SIZE, "%s.rename1", fname1);
+       snprintf(fname2, sizeof(fname2), "%s.rename1", fname1);
        SAFE_RENAME(fname1, fname2);
        event_set[test_cnt].mask = IN_MOVE_SELF;
        strcpy(event_set[test_cnt].name, "");
@@ -103,7 +103,7 @@ void verify_inotify(void)
         * we can correct determine kernel bug which exist before
         * 2.6.25. See comment below.
         */
-       snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
+       snprintf(fname3, sizeof(fname3), "%s.rename2", fname1);
        SAFE_RENAME(fname2, fname3);

        SAFE_RENAME(fname3, fname1);


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
