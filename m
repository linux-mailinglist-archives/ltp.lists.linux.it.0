Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E04EC314
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 14:26:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 044843C9E3B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 14:26:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E83F13C9AA2
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 14:26:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2942E10004B9
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 14:26:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C5D01F37B;
 Wed, 30 Mar 2022 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648643214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfHxpEDOTqymVAxCfAd3xOaAEWvbrCphLMoEV30gMUo=;
 b=Jyn6OA1UxjfkExVfkWr0RcXfXsUW5uP8iRIF+xvECVbl01zj1AQU6YpzQ4zRtMsLbptD81
 q+z8hw2L4tCxDUw0BLAeBV6uhlYIAXTkYFCGwTzVzEd9t0k8jm21CfbontXSs6HQ5Nv/ZA
 FujttU6TiEPe2YnIDlAFBTUR228cAqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648643214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfHxpEDOTqymVAxCfAd3xOaAEWvbrCphLMoEV30gMUo=;
 b=ATP0zq8mmyG70GsokrcDulsoN0iXN3Ce2SsPmYs/CD3e1AvbRTfbmsT/sy9xHswpOi44KY
 6pc7buaZVUBr/xDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D67513A60;
 Wed, 30 Mar 2022 12:26:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EEtuEY5MRGLYNgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 30 Mar 2022 12:26:54 +0000
Date: Wed, 30 Mar 2022 14:29:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YkRNGt435X50u8Z9@yuki>
References: <20220328204643.2601-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328204643.2601-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lib: Retry safe_clone() on ENOSPC|EUSERS
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
> In some tests we are creating the namespaces faster than they are being
> asynchronously cleaned up in the kernel:
> 
> $ sudo ./userns08 -i 10
> userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
> userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
> userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
> userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
> userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
> userns08.c:36: TBROK: clone3 failed: ENOSPC (28)
> 
> Thus retrying the clone() on ENOSPC (or EUSERS for kernel < 4.9).
> 
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> changes v1->v2:
> * use TST_RETRY_FN_EXP_BACKOFF() (Cyril)
> 
> NOTE: 0.1s seems to be safe, although using TST_RETRY_FUNC() with 1s
> (the default) would be of course OK.

I would just put in the default 1s to make things extra safe even on
slow hardware.

>  lib/tst_test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 384c73e163..2e89d954ec 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -436,6 +436,9 @@ pid_t safe_fork(const char *filename, unsigned int lineno)
>  	return pid;
>  }
>  
> +/* too fast creating namespaces => retrying */
> +#define TST_CHECK_ENOSPC(x) ((x) >= 0 || !(errno == ENOSPC || errno == EUSERS))

Reading the manual page I do not think that we have to retry on EUSERS,
that used to be the return value where we reached limit of nested
namespaces and that is not going go away if we retry.

Otherwise the rest looks good.

>  pid_t safe_clone(const char *file, const int lineno,
>  		 const struct tst_clone_args *args)
>  {
> @@ -444,7 +447,7 @@ pid_t safe_clone(const char *file, const int lineno,
>  	if (!tst_test->forks_child)
>  		tst_brk(TBROK, "test.forks_child must be set!");
>  
> -	pid = tst_clone(args);
> +	pid = TST_RETRY_FN_EXP_BACKOFF(tst_clone(args), TST_CHECK_ENOSPC, 0.1);
>  
>  	switch (pid) {
>  	case -1:

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
