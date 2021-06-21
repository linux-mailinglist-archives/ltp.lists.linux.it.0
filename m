Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB863AE469
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 09:59:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EDDC3C703D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 09:59:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E74D3C240F
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 09:59:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F51460047F
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 09:59:11 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C901B1FD2A;
 Mon, 21 Jun 2021 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624262350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY792cC/d7d1DMgD9iBuiHu/NOwzgk7RurwH5JgZgcM=;
 b=VTKTklKTSO/kHlZ3Ffq2YKEc9DJ982asc2Jim/iDgMZMnR1atVr8xhE9NbrlHA+pSek1p5
 try5zvcDJbiNm23EmFzIcRfGE9ht0nHTbyzs2M0EnsSW8t/JEALdch7hqXTGNGEU2Bzpua
 dY1OP4o8Y1JKqP7k2y+Yq1QjD0NtEMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624262350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY792cC/d7d1DMgD9iBuiHu/NOwzgk7RurwH5JgZgcM=;
 b=jNnna9nKpEjZvP/qijcMn7mHCWm89sMb9iQkVNz/8fmh4B5qSY8s7qYJHb3Vo9F62Mkqg3
 o6CF5j4dNcxrNYAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 92708118DD;
 Mon, 21 Jun 2021 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624262350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY792cC/d7d1DMgD9iBuiHu/NOwzgk7RurwH5JgZgcM=;
 b=VTKTklKTSO/kHlZ3Ffq2YKEc9DJ982asc2Jim/iDgMZMnR1atVr8xhE9NbrlHA+pSek1p5
 try5zvcDJbiNm23EmFzIcRfGE9ht0nHTbyzs2M0EnsSW8t/JEALdch7hqXTGNGEU2Bzpua
 dY1OP4o8Y1JKqP7k2y+Yq1QjD0NtEMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624262350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY792cC/d7d1DMgD9iBuiHu/NOwzgk7RurwH5JgZgcM=;
 b=jNnna9nKpEjZvP/qijcMn7mHCWm89sMb9iQkVNz/8fmh4B5qSY8s7qYJHb3Vo9F62Mkqg3
 o6CF5j4dNcxrNYAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ykQHIs5G0GDfFgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 21 Jun 2021 07:59:10 +0000
Date: Mon, 21 Jun 2021 09:59:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: dongshijiang <dongshijiang@inspur.com>
Message-ID: <YNBGza7f7dOawiaF@pevik>
References: <20210617070806.174220-1-dongshijiang@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617070806.174220-1-dongshijiang@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
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
Cc: libtirpc-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 Steve Dickson <SteveD@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

[Cc libtirpc ML and Steve]

> "Segmentation fault (core dumped)" due to the failure of svcfd_create during the rpc test, so you need to check the return value of the "svcfd_create" function

I'm not sure what is the value of TI-RPC tests. IMHO really messy code does
not in the end cover much of libtirpc functionality. That's why I'm thinking
to propose deleting whole testcases/network/rpc/rpc-tirpc/. libtirpc is being
used in nfs-utils, thus it'd deserve to have some testing, but IMHO this
should be libtirpc.

I'm not planning to dive into the technology to understand it enough be
able to written the tests from scratch and I'm not aware of anybody else
planning it.

> Signed-off-by: dongshijiang <dongshijiang@inspur.com>
> ---
>  .../rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c      | 5 +++++
>  .../rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c   | 5 +++++
>  .../rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c       | 5 +++++
>  .../rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c   | 5 +++++
>  4 files changed, 20 insertions(+)

> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
> index 60b96cec3..3557c0068 100644
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
> +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
> @@ -46,6 +46,11 @@ int main(void)

>  	//First of all, create a server
>  	svcr = svcfd_create(fd, 0, 0);
> +
> +	//check returned value
> +	if ((SVCXPRT *) svcr == NULL) {
> +		return test_status;
> +	}

>  	//Then call destroy macro
>  	svc_destroy(svcr);
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
> index ecd145393..5a4331f4d 100644
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
> +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy_stress.c
> @@ -55,6 +55,11 @@ int main(int argn, char *argc[])
>  	//First of all, create a server
>  	for (i = 0; i < nbCall; i++) {
>  		svcr = svcfd_create(fd, 0, 0);
> +
> +		//check returned value
> +		if ((SVCXPRT *) svcr == NULL)
> +			continue;
> +		svcr = NULL;
man svc_destroy(3) states that it deallocates private data structures, including
xprt itself.

Kind regards,
Petr

>  		//Then call destroy macro
>  		svc_destroy(svcr);
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
> index da3b93022..de4df15f1 100644
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
> +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/rpc_xprt_register.c
> @@ -48,6 +48,11 @@ int main(void)

>  	//create a server
>  	svcr = svcfd_create(fd, 1024, 1024);
> +
> +	//check returned value
> +	if ((SVCXPRT *) svcr == NULL) {
> +		return test_status;
> +	}

>  	//call routine
>  	xprt_register(svcr);
> diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
> index d0b7a20d4..fbaec25ad 100644
> --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
> +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/rpc_xprt_unregister.c
> @@ -52,6 +52,11 @@ int main(int argn, char *argc[])

>  	//create a server
>  	svcr = svcfd_create(fd, 1024, 1024);
> +
> +	//check returned value
> +	if ((SVCXPRT *) svcr == NULL) {
> +		return test_status;
> +	}

>  	xprt_register(svcr);
>  	//call routine

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
