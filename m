Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FE4D61B7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:41:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A9163C8C86
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:41:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A0BA3C8B2E
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:41:29 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6514D1400B90
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:41:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99DD61F381;
 Fri, 11 Mar 2022 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647002488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIFjLZDlNjFTpJLUVF7emcUIvNanuHQaU9bKtA05h0Q=;
 b=KY9aWCA0+xWQTPixsKDAEHI3U2AjWI3E2Vg1VFWAwi2WqJ4l2RM2QgvecBLvXg2BzYe0oZ
 uAFkRN1hUD4WrABNXiTJW1adrdwf+QWoT5HqgENGjM6xjf8OAlpVKXuw+fAn+0tRaXNSiO
 jJENjG+gL7eSt8pWQGmCBU2CUbg0/zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647002488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIFjLZDlNjFTpJLUVF7emcUIvNanuHQaU9bKtA05h0Q=;
 b=tGqV3ob8fXOdjXvNYqAtVMtquyZ3RaSUL3lMhJVVw0A/f7+RBsGGVHwItDFv2ECIqthE9M
 1UTzFBF0ZUmPW6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85A5713A85;
 Fri, 11 Mar 2022 12:41:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UdLIH3hDK2KWOwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 11 Mar 2022 12:41:28 +0000
Date: Fri, 11 Mar 2022 13:43:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YitEA0Pot/ivUQa6@yuki>
References: <20220311110015.20951-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311110015.20951-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] nfs01_open_files: Fix pattern for deleted
 files
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
Cc: Neil Brown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Reported-by: Neil Brown <neilb@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/nfs/nfs_stress/nfs01_open_files.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs01_open_files.c b/testcases/network/nfs/nfs_stress/nfs01_open_files.c
> index 9342f11ba9..c5627058dc 100644
> --- a/testcases/network/nfs/nfs_stress/nfs01_open_files.c
> +++ b/testcases/network/nfs/nfs_stress/nfs01_open_files.c
> @@ -10,7 +10,8 @@
>  #include <sys/stat.h>
>  #include <unistd.h>
>  
> -#define TEMPLATE "ltpXXXXXX"
> +#define TEMPLATE_PREFIX "ltp"
> +#define TEMPLATE TEMPLATE_PREFIX "XXXXXX"
>  
>  int write_something(int);
>  void delete_files(void);
> @@ -101,7 +102,7 @@ void delete_files(void)
>  
>  	dirp = opendir(".");
>  	for (entp = readdir(dirp); entp; entp = readdir(dirp))
> -		if (!strncmp(entp->d_name, "apt", 3)) {
> +		if (!strncmp(entp->d_name, TEMPLATE_PREFIX, 3)) {

Maybe we should also do:

#define TEMPLATE_PREFIX_LEN (sizeof(TEMPLATE_PREFIX) - 1)

And use TEMPLATE_PREFIX_LEN instead of the hardcoded 3


Otherwise it looks obviously correct:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
