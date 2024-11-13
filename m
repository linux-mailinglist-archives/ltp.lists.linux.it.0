Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E29C6DE0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2024 12:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1731497389; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=87qmqyl7nIs5D7bhAXxVvyh2M7HuMj7serJIi2weDV4=;
 b=i9gGk+LwmNOOJW2Zet7z/sgTcZ6L+AEgQbjaRE8EaqlMWRp220cXsP19WirTRD+k9ntDD
 vr7jkTOCssZ3RNcYPeje6oXzaFQkupplFC4DfDErgZo+YwntEyujm2SMQSPlPxdatQuz7Yq
 YlOv8cvWEtg1ldptnM1LkWMJklMVbyk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21393D6608
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2024 12:29:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E55863D6322
 for <ltp@lists.linux.it>; Wed, 13 Nov 2024 12:29:47 +0100 (CET)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 432366215C2
 for <ltp@lists.linux.it>; Wed, 13 Nov 2024 12:29:47 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cb615671acso4990786a12.1
 for <ltp@lists.linux.it>; Wed, 13 Nov 2024 03:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1731497386; x=1732102186; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kuJ2I4ySlBz8w0CWmtIEPOIny8dtYnimi69L5d0B9fo=;
 b=bG74dlQomiuRwB7DBDdm32n1G9QxE2hKM8Zg6dIVfmwdogi+hRKiyIaoHtwg00/YAv
 GdNmLuKBi672JrG4i99jILdefjNtc1anI/HIWPnBM2Wn5uH/GAYs8AytY5mJMpXouDlz
 4RWa2yA1vc3RoMM4fRzBJflRtMgwLiEFH1dVrXuvBcdVyT7C99sWM4yNDVXYScVSxa1d
 OOqM4OqtMRSL3oyu/L3pNYFYgkSPyibR9KCyJTNCB1wbFXhATSRhg6KWDe04WCKuvQq9
 Lf0DzRgLh5Q6w4pZKMYcWH7+nfQoJQUtdVjAnrG3fu5kvGQAp9thn+oZ5byqkvi2i1Qg
 lpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731497386; x=1732102186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kuJ2I4ySlBz8w0CWmtIEPOIny8dtYnimi69L5d0B9fo=;
 b=kRuZipAlerqaJgVmX1AdM9ekHt+6fnTu72pSepGQTtPb0Z0nmIeUFYPfU5qoSoV9kt
 qyg0hqoMmOPXVyafl59uMawAvh1vcQS2oxh5NsA/o9UKfWV3X3U0xJQ1nn/wkYCUIfQE
 414znNUmHsiikDaF3TcsHCdTDm8fSc9gqPGP/vF7dAVK5SdEupu3xDr9un+EsUM7Z9VA
 /LSR3YPb7XA6o2cmxU79d/K2nAttqTx6fcdvRA/7L46tlrSejOOkstiI5JaTlD3h8xjU
 DzVX0vDn/LC9ysfw+WA5S8cmWGHCMaXinrh1xRqZb7A6OCrSQutBvQAb4Z6rq9q10beB
 ocjQ==
X-Gm-Message-State: AOJu0YwrpewkoVwPovew6jYIL4P5f1p9derTteEuG0c47uVboNlM4JYK
 adoLK2fox9NOQ4jkmZbAJZhlopVJ3zhX7jSsZs1W+g47XVodjYcq1s2HjVSdww==
X-Google-Smtp-Source: AGHT+IHXwcrtfyKr9b5Q/UkJj1TZi0I2WAHiB46Art15m++C+2cAh79/Xy73I4WWhleR+vda++JlmQ==
X-Received: by 2002:a05:6402:2106:b0:5cf:4183:6125 with SMTP id
 4fb4d7f45d1cf-5cf4183813dmr12084462a12.4.1731497386550; 
 Wed, 13 Nov 2024 03:29:46 -0800 (PST)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0ad2cdcsm846792166b.87.2024.11.13.03.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 03:29:46 -0800 (PST)
Date: Wed, 13 Nov 2024 06:29:39 -0500
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZzSNo4jTE1v2vAR9@wegao>
References: <20241113105925.295697-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113105925.295697-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] select03: Fix false positive on TCONF
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: Dominique Leuenberger <dleuenberger@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Nov 13, 2024 at 11:59:25AM +0100, Petr Vorel wrote:
> This fixes error on unsupported __NR__newselect:
> select_var.h:89: TCONF: syscall(-1) __NR__newselect not supported on your arch
> select03.c:90: TFAIL: Child exited with 32
> 
> Fixes: ffdd3b36cd ("syscalls: Add missing exit status check")
> Reported-by: Dominique Leuenberger <dleuenberger@suse.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Alternatively, we could revert to previous state (remove
> "!WEXITSTATUS(status)" check), if we really don't care about any other
> exit code.
I suggest remove "!WEXITSTATUS(status)" in current case unless we clearly know all
*correct* value return from do_select_faulty_to.
> 
> Kind regards,
> Petr
> 
>  testcases/kernel/syscalls/select/select03.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
> index 216b22104f..34aea12603 100644
> --- a/testcases/kernel/syscalls/select/select03.c
> +++ b/testcases/kernel/syscalls/select/select03.c
> @@ -77,8 +77,10 @@ static void run(unsigned int n)
>  
>  	SAFE_WAITPID(pid, &status, 0);
>  
> -	if (WIFEXITED(status) && !WEXITSTATUS(status))
> +	if (WIFEXITED(status) &&
> +		(WEXITSTATUS(status) == 0 || WEXITSTATUS(status) == TCONF)) {
>  		return;
> +	}
>  
>  	if (tst_variant == GLIBC_SELECT_VARIANT &&
>  	    tests[n].timeout == &invalid_to &&
> -- 
> 2.45.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
