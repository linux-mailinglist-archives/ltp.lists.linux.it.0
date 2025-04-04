Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F62A7BC30
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Apr 2025 14:04:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 159693CB31C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Apr 2025 14:04:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB6B73CB087
 for <ltp@lists.linux.it>; Fri,  4 Apr 2025 14:04:15 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 18C1C6009E1
 for <ltp@lists.linux.it>; Fri,  4 Apr 2025 14:04:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A9F72118A;
 Fri,  4 Apr 2025 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1743768253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOxy6alouch3PpCo/kQBE8BnQefViEcYmPDaFt2sf1A=;
 b=jNgl8Io3H2Xa6GdpxUoES97/+bXMSlpmGFae524wTMfq83dksQy4dgjQ0m9TKLup9bJ5ec
 wqoWDW3Ox0UGcrewAnpTXcaMZaEGCIS/j551F96wE2motBWWKh9z38C4+NIdlvxQ22mBSr
 D63UJ9AjhfJ8ZimpFEMvk+qK8d6XU2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1743768253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOxy6alouch3PpCo/kQBE8BnQefViEcYmPDaFt2sf1A=;
 b=mDfDAgGfnw92ODL66QcCCBbIfANGCg/Jyt6T4xVu4YlKkCsEnQfdFqN6pxjw/+yISDLgqp
 xd301kIz7GtYOXBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1743768253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOxy6alouch3PpCo/kQBE8BnQefViEcYmPDaFt2sf1A=;
 b=jNgl8Io3H2Xa6GdpxUoES97/+bXMSlpmGFae524wTMfq83dksQy4dgjQ0m9TKLup9bJ5ec
 wqoWDW3Ox0UGcrewAnpTXcaMZaEGCIS/j551F96wE2motBWWKh9z38C4+NIdlvxQ22mBSr
 D63UJ9AjhfJ8ZimpFEMvk+qK8d6XU2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1743768253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOxy6alouch3PpCo/kQBE8BnQefViEcYmPDaFt2sf1A=;
 b=mDfDAgGfnw92ODL66QcCCBbIfANGCg/Jyt6T4xVu4YlKkCsEnQfdFqN6pxjw/+yISDLgqp
 xd301kIz7GtYOXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55E181364F;
 Fri,  4 Apr 2025 12:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3pTIE73K72cVQAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 04 Apr 2025 12:04:13 +0000
Date: Fri, 4 Apr 2025 14:04:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Z-_K0zj30GOhxYS8@yuki.lan>
References: <20250403113053.20040-1-chrubis@suse.cz>
 <20250403123610.GA465253@pevik> <Z-6XSwc9Rbu2RIzm@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-6XSwc9Rbu2RIzm@yuki.lan>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Fix tst_brk() handling
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
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index c6395a5eb..6b1100b09 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -407,7 +407,8 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
>          * current process.
>          */
>         if (TTYPE_RESULT(ttype) == TBROK) {
> -               tst_atomic_inc(&results->abort_flag);
> +               if (results)
> +                       tst_atomic_inc(&results->abort_flag);
> 
>                 /*
>                  * If TBROK was called from one of the child processes we kill
> 

And it's a bit more complex we also need to make sure to exit properly
when tst_brk() was called before the library was initialized, so we also
need:

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 758e62823..d19908d94 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -386,6 +386,14 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
               va_list va)
 {
        print_result(file, lineno, ttype, fmt, va);
+
+       /*
+        * If tst_brk() is called from some of the C helpers even before the
+        * library was initialized, just exit.
+        */
+       if (!lib_pid)
+               exit(TTYPE_RESULT(ttype));
+
        update_results(TTYPE_RESULT(ttype));

        /*
@@ -415,7 +423,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
                 * the main test process. That in turn triggers the code that
                 * kills leftover children once the main test process did exit.
                 */
-               if (tst_getpid() != main_pid) {
+               if (main_pid && tst_getpid() != main_pid) {
                        tst_res(TINFO, "Child process reported TBROK killing the test");
                        kill(main_pid, SIGKILL);
                }


I will send v2 later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
