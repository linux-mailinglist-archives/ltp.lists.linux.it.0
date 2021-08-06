Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF43E22AF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:40:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E3103C7AFA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:40:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E6A83C0926
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:40:37 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1449D1400BC8
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:40:36 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 37FF79F69E;
 Fri,  6 Aug 2021 04:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1628224836; bh=c/9ewAL/2L4+ijaLQkHWzsciYb7FLP2M+89jvwbiaos=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=kmx6LBkYEWgBc83fz1VjGHJ5jUna/AgpOgmCzgPPc94J20qE3DfkFJRTXyvFkDEee
 bLA0cHhvO41b64hpHQ8+Ohc1V1PCdiQJnsgPZtXZaDRsWRlkZQAUfg0kcq4SLXmgC7
 a0akxdq0HcXnE4xFjIAXI1vSS/ykJUWjNNJw78/M=
To: zhanglianjie <zhanglianjie@uniontech.com>, ltp@lists.linux.it
References: <20210806032131.25721-1-zhanglianjie@uniontech.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <b208d879-0d31-ff16-4ef0-d363e9a65c51@jv-coder.de>
Date: Fri, 6 Aug 2021 06:40:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806032131.25721-1-zhanglianjie@uniontech.com>
Content-Language: en-US
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib/tst_tmpdir: tst_get_tmpdir() add error handing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi

On 8/6/2021 5:21 AM, zhanglianjie wrote:
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>
> diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
> index 0c39eb89f..f006e4893 100644
> --- a/lib/tst_tmpdir.c
> +++ b/lib/tst_tmpdir.c
> @@ -108,12 +108,18 @@ int tst_tmpdir_created(void)
>
>   char *tst_get_tmpdir(void)
>   {
> +	char *ret = NULL;
> +
>   	if (TESTDIR == NULL) {
>   		tst_brkm(TBROK, NULL, "you must call tst_tmpdir() first");
>   		return NULL;
>   	}
>
> -	return strdup(TESTDIR);
> +	ret = strdup(TESTDIR);
Is a failing strdup here really a thing? The only reason strdup should 
be able to fail is with ENOMEM.
The only way tst_brkm will work, if strdup fails here is, if TESTDIR is 
an extremely huge string (the NULL case is already handled above).
> +	if (!ret)
> +		tst_brkm(TBROK, NULL, "strdup() failed");
> +
> +	return ret;
>   }
>
>   const char *tst_get_startwd(void)
> --
> 2.20.1
>
>
Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
