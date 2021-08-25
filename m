Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D73F775F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:28:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71A423C3127
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:28:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35B4F3C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:28:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B5B51600942
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:28:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19ACE20121;
 Wed, 25 Aug 2021 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629901720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRRnYDu/yaghNDmQn5v9yow2M6UCZU4uTi/9E4NAZHM=;
 b=z5GFWTyAVhPbIPFJvspdYDNFopYidjcoJSo7+TIj1y6c4XMh46OVKPJZta+WAid12Gzhao
 zff6hY8RoSwSL/uJFaBoquczbhgw3SYhsywVWgU0mOb/k5UpWv5xdn8ZKH+gXlfnxvuaGD
 /Z0Y6vXdDVLgkUp9i8PsKD/jW/bGlw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629901720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRRnYDu/yaghNDmQn5v9yow2M6UCZU4uTi/9E4NAZHM=;
 b=Sy3WvvqukhDWWHfggxUpnFlBBF0iTvYTYtIUuHo75LqQ5O52NDY20SvJ3iJuty4N0KqNya
 lyZdQys1xtOC/yBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 000CB13C26;
 Wed, 25 Aug 2021 14:28:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fO+MOZdTJmFRagAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 14:28:39 +0000
Date: Wed, 25 Aug 2021 16:28:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YSZTn5KKmOgFINNX@yuki>
References: <20210813072657.21976-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813072657.21976-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] syscalls/clone05: Convert to new API
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
>  static int child_exited = 0;
               ^
	       This should be volatile to avoid compiler miscompilation,
	       also there is no point in setting it to 0 either, it's
	       global variable and these are initialized to zero
	       regardless.

> +static void *child_stack;
> 
> -int main(int ac, char **av)
> +static int child_fn(void *unused __attribute__((unused)))
>  {
> +	int i;
> 
> -	int lc, status;
> -	void *child_stack;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	child_stack = malloc(CHILD_STACK_SIZE);
> -	if (child_stack == NULL)
> -		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		TEST(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
> -		               CHILD_STACK_SIZE, child_stack));
> -
> -		if ((TEST_RETURN != -1) && (child_exited))
> -			tst_resm(TPASS, "Test Passed");
> -		else
> -			tst_resm(TFAIL, "Test Failed");
> +	for (i = 0; i < 100; i++) {
> +		sched_yield();
> +		usleep(1000);
> +	}
> 
> -		if ((wait(&status)) == -1)
> -			tst_brkm(TBROK | TERRNO, cleanup,
> -				 "wait failed, status: %d", status);
> +	child_exited = 1;
> +	_exit(0);
> +}
> 
> -		child_exited = 0;
> -	}
> +static void verify_clone(void)
> +{
> +	TST_EXP_POSITIVE(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
> +					CHILD_STACK_SIZE, child_stack), "clone with vfork");
> 
> -	free(child_stack);
> +	if (!TST_PASS)
> +		return;
> 
> -	cleanup();
> -	tst_exit();
> +	TST_EXP_PASS(!child_exited);

This is misuse of the macro, since the macro checks for -1 on failure
and we will get 1 on failure here.

I guess that we should add TST_EXP_VAL() instead for cases like this and
we would do:

	TST_EXP_VAL(child_exited, 1);

Will you send a patch or should I add it?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
