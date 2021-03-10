Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B16333D25
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:58:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA5A73C6A2D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:58:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 431943C4B4F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:58:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC4791401165
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:58:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28E67AE89
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 12:58:39 +0000 (UTC)
Date: Wed, 10 Mar 2021 13:58:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YEjCfVLhoLPMDEgu@pevik>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310122625.25425-2-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: Add proper filesystem skiplist
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

3 very minor nits below.

> diff --git a/include/tst_fs.h b/include/tst_fs.h
...
>  /*
>   * Return 1 if a specified fiilsystem is supported
>   * Return 0 if a specified fiilsystem isn't supported
Please, while at it, could you fix "fiilsystem" typo?

...
> diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
> index 00ede549d..cd505f570 100644
> --- a/lib/tst_supported_fs_types.c
> +++ b/lib/tst_supported_fs_types.c
> @@ -45,13 +45,34 @@ static int has_mkfs(const char *fs_type)
>  	return 1;
>  }

> -static int has_kernel_support(const char *fs_type, int flags)
> +int tst_fs_in_skiplist(const char *fs_type, const char *const *skiplist)
> +{
> +	unsigned int i;
> +
> +	if (!skiplist)
> +		return 0;
> +
> +	for (i = 0; skiplist[i]; i++) {
> +		if (!strcmp(fs_type, skiplist[i])) {
> +			tst_res(TINFO,
It'd be nice if skipping message could be TCONF to avoid:
tst_supported_fs_types.c:57: TINFO: Skipping tmpfs as requested by the test
tst_test.c:1056: TCONF: Skipping due to unsupported filesystem

but understand why - it'd make code more complicated (has_kernel_support() which
is used in tst_fs_is_supported() should not emit TCONF).

> +			        "Skipping %s as requested by the test", fs_type);
checkpatch complain here about mixing spaces and tabs.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
