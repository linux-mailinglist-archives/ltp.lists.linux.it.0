Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E05B2B8F4
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Aug 2025 07:52:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D79A33CCA65
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Aug 2025 07:52:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF5413C19CB
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 07:52:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2446260093B
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 07:52:23 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D554C1F749;
 Tue, 19 Aug 2025 05:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1755582743;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u23Yk357+uT7Q6ByTSu7aykFxKPI62nJ1p0JSkGY+N0=;
 b=y54wSLYzLvx6zDmkJv08IDr6y29jFCl3eYHn7zp+kI9QClShKGGN+42IquzJ+OazOxRzNM
 z3jj8FQ/V3M0bcbaeIPmNYqjNSano46RZc5dtScGQxr3F5SWYCxWDHrc7Xp0AMne3OgRfa
 lvKvILVXFVBiyrAeQo2A8hxEJ4th1wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1755582743;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u23Yk357+uT7Q6ByTSu7aykFxKPI62nJ1p0JSkGY+N0=;
 b=xNv2vRi6SxMdiqkpV+YsyHfnh3sTPf+ari+AMbMMEVplHQ0zr7VxZePJp0ZSzQ5ivKrZrH
 PalM6Dv5cPXzorDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=UfCiWCqs;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=1AmPbY0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1755582742;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u23Yk357+uT7Q6ByTSu7aykFxKPI62nJ1p0JSkGY+N0=;
 b=UfCiWCqs8VUwVXCJJ0FQZuWe0UbQx9HJJRiRS3v+XCUJTV1mVKmXJ40rZNAp3Cs/A5scOt
 8DQRgnmgTqIEBaU7Al0obWcNLjlcAhJpJEHaRDd1fCfLxRKIj6yHaZqevvb7zSPt8F/DHo
 +1x0fnAuSpzRHj3L+HPD1zhuiHZBUoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1755582742;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u23Yk357+uT7Q6ByTSu7aykFxKPI62nJ1p0JSkGY+N0=;
 b=1AmPbY0AhfssHbwALPiQRWc2pcRDkOvYILjFLfvrZO9ODit/ZTVq6ymzTMSVQV0Q7mRLz+
 FU4Wdq3Xjot+gcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B88161368C;
 Tue, 19 Aug 2025 05:52:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q8bhKxYRpGhYCAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 19 Aug 2025 05:52:22 +0000
Date: Tue, 19 Aug 2025 07:52:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: =?utf-8?B?6ZmI5Yqb5oGS?= <791960492@qq.com>
Message-ID: <20250819055221.GA189221@pevik>
References: <tencent_D831D00568C246AE9FBCAE9EF5DDAD0B6B05@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_D831D00568C246AE9FBCAE9EF5DDAD0B6B05@qq.com>
X-Spam-Level: 
X-Rspamd-Queue-Id: D554C1F749
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[qq.com]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[qq.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.cz:+]; MISSING_XM_UA(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] sigaltstack01: Fix check about alternative stack
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Liheng Chen,

> Hi Petr Vorel,


> Recently I want to test if Gramine-SGX (emulates Linux in Intel SGX trusted execution environment) works exactly like Linux, and avoid it from harming users.


> sigaltstack01 mallocs a buffer with size SIGSTKSZ (8192) and uses this buffer as an alternative stack. However, in Gramine-SGX, it needs to reserve a large memory to save xstate, sigframe, and restorer's address, thus it needs to reserve memory larger than 11452 bytes, which overflows SIGSTKSZ. In this situation, I noticed the wrong check we talked about. (Detail: https://github.com/gramineproject/gramine/issues/2153&nbsp;, is it OK to paste a link?)

Thanks a lot for sharing the details and your patch!
Merged with added additional info from you to the commit message.

Kind regards,
Petr

> Kind regards,
> Liheng Chen


> ------------------&nbsp;Original&nbsp;------------------


> Hi Liheng,

> &gt; Hi all,

> &gt; This check seems should be (alt_stk < sigstk.ss_sp) || (alt_stk &gt; (sigstk.ss_sp + SIGSTKSZ)), not &amp;&amp;

> You're right. IMHO the error goes down to the original addition in
> 865695bbc89088b9526ea9045410e5afb70a985c

> Out of curiosity, did you find a system where it should fail but it didn't?

> Reviewed-by: Petr Vorel <pvorel@suse.cz&gt;

> &gt; Kind regards,
> &gt; Liheng Chen

> &gt; Signed-off-by: Liheng Chen <791960492@qq.com&gt;
> &gt; ---
> &gt;&nbsp; testcases/kernel/syscalls/sigaltstack/sigaltstack01.c | 2 +-
> &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)

> &gt; diff --git a/testcases/kernel/syscalls/sigaltstack/sigaltstack01.c b/testcases/kernel/syscalls/sigaltstack/sigaltstack01.c
> &gt; index 9a2e3a440..147659467 100644
> &gt; --- a/testcases/kernel/syscalls/sigaltstack/sigaltstack01.c
> &gt; +++ b/testcases/kernel/syscalls/sigaltstack/sigaltstack01.c
> &gt; @@ -142,7 +142,7 @@ int main(int ac, char **av)
> &gt;&nbsp; 			 * Check that main_stk is outside the
> &gt;&nbsp; 			 * alternate stk boundaries.
> &gt;&nbsp; 			 */
> &gt; -			if ((alt_stk < sigstk.ss_sp) &amp;&amp;
> &gt; +			if ((alt_stk < sigstk.ss_sp) ||
> &gt;&nbsp; 			&nbsp;&nbsp;&nbsp; (alt_stk &gt; (sigstk.ss_sp + SIGSTKSZ))) {
> &gt;&nbsp; 				tst_resm(TFAIL,
> &gt;&nbsp; 					 "alt. stack is not within the "

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
