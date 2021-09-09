Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6A405AF0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 18:32:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C3343C8D8E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 18:32:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 413803C21F8
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 18:32:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 947291A003EC
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 18:32:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 837FC1FD29;
 Thu,  9 Sep 2021 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631205162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tL2pjiNkk3hh2eI+q7Qp37eRy3d1jWvgF3MyEUw6sH4=;
 b=L/hLSCkvyliK0AUhyQIINNpv3hLQ4hGeZ14F0UImVd9ScRzaO9zImoA5XcsXZYhq42lLxc
 tEYIykldcwV1npzQN21VNo15Mm/Jm8VXzGC+XmqdLzD1/tbDQsqTpVMEWC5Wn4qM5ibF1D
 aotFA0K1NLqVQv7Re9YEQrYVK87EWdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631205162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tL2pjiNkk3hh2eI+q7Qp37eRy3d1jWvgF3MyEUw6sH4=;
 b=lPr4py3ItYsJ0dJ6194+NUUc6cetSBPrr0tXuonNgOwk54SGLWnHlQRH2d7BIj3uN/X+mn
 ddjd8Mq2TgOEUuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75B8C13C53;
 Thu,  9 Sep 2021 16:32:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /+JxHCo3OmHccwAAMHmgww
 (envelope-from <pvorel@suse.de>); Thu, 09 Sep 2021 16:32:42 +0000
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 18:32:42 +0200
From: pvorel <pvorel@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20210909155126.2720-8-mdoucha@suse.cz>
References: <20210909155126.2720-1-mdoucha@suse.cz>
 <20210909155126.2720-8-mdoucha@suse.cz>
User-Agent: Roundcube Webmail
Message-ID: <287a9879ef8b3342cb88225e4e319733@suse.de>
X-Sender: pvorel@suse.de
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/8] syscalls/setresuid03: Convert to new API
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

LGTM, nits below.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> The original test looks up specific usernames which may not exist on 
> some
> systems. Use any two non-root UIDs instead.
+1

> +static void run(unsigned int n)
>  {
> -	tst_require_root();
> +	const struct test_data_t *tc = test_data + n;
> 
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> +	TEST(SETRESUID(*tc->real_uid, *tc->eff_uid, *tc->sav_uid));
It's a second test where we could use TST_EXP_FAIL_SILENT() if we had it 
defined.
Maybe I'll add it.

> 
> -	if (getpwnam("nobody") == NULL) {
> -		tst_brkm(TBROK, NULL, "nobody must be a valid user.");
> +	if (TST_RET != -1) {
> +		tst_res(TFAIL | TTERRNO, "%s returned unexpected value %ld",
> +			tc->test_msg, TST_RET);
> +		return;
>  	}
> 
> -	if (getpwnam("bin") == NULL) {
> -		tst_brkm(TBROK, NULL, "bin must be a valid user.");
> +	if (TST_ERR != tc->exp_errno) {
nit: checkpatch complains (TST_ERR should be second)

> +		tst_res(TFAIL | TTERRNO, "%s returned unexpected error",
> +			tc->test_msg);
> +		return;
>  	}
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
