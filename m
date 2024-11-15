Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA19CDA0E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2024 08:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1731657072; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=HkLR0//FANPeNU19+twMtkGB+PBYbGWiD8Y0YrX7xgQ=;
 b=QDqQ2GcNOPxGOGNOIfzZDR5UwB55OtkoNOYJe+mYiETzMg+SrgaR06Va+etafr7ppkv5N
 /qKgS27SFH4KqicZXqiZwaWeM7mL4738yIVrXAZWEErLaVBpsC0H8kbiLAth+OMqP3V1KWj
 Zb6f2sR89fgQoTzsUvKs3vwyo9coqu4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8259C3D74D5
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2024 08:51:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D3163D72EC
 for <ltp@lists.linux.it>; Fri, 15 Nov 2024 08:51:00 +0100 (CET)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C430C223D6D
 for <ltp@lists.linux.it>; Fri, 15 Nov 2024 08:50:59 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cf896558c4so1207419a12.2
 for <ltp@lists.linux.it>; Thu, 14 Nov 2024 23:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1731657059; x=1732261859; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k0/hALFIgf+wg+Ti4nWa58RNKv8YJ5d+s1+nUivF9x4=;
 b=g6lQb8kr+lbJTKWWkjV1Ztc+j6yTwk6S3iZtR5sXANpGd0qNBv3wegDI52hWNtn14T
 cbfWZtou+DQ3zjKIkSb1CSRda6/SNRlw7fDKmTUYBY48W+jbqMkTBKQiN2+1610b5oaz
 GNw2WNtlfUT66nCrwXppn4cs0ZlcVYKDnzi2i9vWvjj4jgFrt36APz6fIbtIImiNbrwh
 bQACGAu+rYyF45m3slPoRTGv+mmYBPPeUGzDLAYtj+jjIRvCDWkH9oILwOHuE5yctjos
 EcuLnIPiwj8FBUQHsaFMiDyeg/gGwVLIllFXqLlWX4FppzisAZPcSAmxyHe48oxvygXH
 bBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731657059; x=1732261859;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0/hALFIgf+wg+Ti4nWa58RNKv8YJ5d+s1+nUivF9x4=;
 b=egWyZpdlFWzSjWvoQ/f0OfPU9kFKlN2c0WTMhx4XP9/4YZmofmhbZvlXhhy2K4GtFk
 bbVR42Bm17DL98qOmGLM3Xqce9iiM6mzV0uTwn08JER2aRSevxmjmUZTQroyGW23XjNO
 OmWIMls3Ogl958FljoIKXkN/Dd5S2Vwdrw5qrQOexvXlpwbdoAcDifo4hNKWL3r2hwFw
 gQWvrtTrlvGrLLOlcVRVnYKIx9DDcAALbA2CX/oLHn0tySIXu1rMzZHj9fRdzFq9i5yz
 ctIPGGn3QGqU0mHnDrzn+QfbDsLgpPidrgu6o9eS4pjku4RzhsvB00Njm0gV24VY2Aph
 v/mA==
X-Gm-Message-State: AOJu0Yx59KTSnRU6rQ8I6NNC0ShdyLLDOX+rAUgy/J82vz7QDiDEjb9U
 PO4mmTrOICTV1tqhI6LxX17JIIm+8Q2y05YwHLkhCpe/6qD20iydFmNpQHOuV2mAPIcLFlrUDFA
 =
X-Google-Smtp-Source: AGHT+IHyfYa1pSPYFNROZ47qGUVSLHGIGUkFa5FvhTNJeipfnh/isq9aCKwTwMEePj1oi09MPrpi9Q==
X-Received: by 2002:a05:6402:210a:b0:5ce:fc3c:3c3 with SMTP id
 4fb4d7f45d1cf-5cf8fd03d94mr1274721a12.28.1731657059104; 
 Thu, 14 Nov 2024 23:50:59 -0800 (PST)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1dc72sm1332485a12.79.2024.11.14.23.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:50:58 -0800 (PST)
Date: Fri, 15 Nov 2024 02:50:52 -0500
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Zzb9XKvIe9D6Mcn3@wegao>
References: <20241114172911.362197-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241114172911.362197-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] ioctl01: Workaround segfault on ppc64le
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 14, 2024 at 06:29:11PM +0100, Petr Vorel wrote:
> Testing termio/termios invalid/NULL address for EFAULT fails on ppc64le.
> Use typical LTP workaround to test by forked child + checking the
> terminating signal (on all archs).
Very nit:
The title is "[PATCH 1/1] ioctl01: Workaround segfault on ppc64le" but 
your code is create workaround for all archs, so maybe update some words?

Reviewed-by: Wei Gao <wegao@suse.com>
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl01.c | 45 ++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl01.c b/testcases/kernel/syscalls/ioctl/ioctl01.c
> index c84a72b9a2..e4f32330d0 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl01.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (c) International Business Machines Corp., 2001
>   * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
> - * Copyright (c) Linux Test Project, 2002-2023
> + * Copyright (c) Linux Test Project, 2002-2024
>   * 07/2001 Ported by Wayne Boyer
>   * 04/2002 Fixes by wjhuie
>   */
> @@ -59,8 +59,42 @@ static struct tcase {
>  
>  static void verify_ioctl(unsigned int i)
>  {
> -	TST_EXP_FAIL(ioctl(*(tcases[i].fd), tcases[i].request, tcases[i].s_tio),
> -		     tcases[i].error, "%s", tcases[i].desc);
> +	struct tcase *tc = &tcases[i];
> +
> +	TST_EXP_FAIL(ioctl(*(tc->fd), tc->request, tc->s_tio), tc->error, "%s",
> +		     tc->desc);
> +}
> +
> +static void test_bad_addr(unsigned int i)
> +{
> +	pid_t pid;
> +	int status;
> +
> +	pid = SAFE_FORK();
> +	if (!pid) {
> +		verify_ioctl(i);
> +		_exit(0);
> +	}
> +
> +	SAFE_WAITPID(pid, &status, 0);
> +
> +	if (WIFEXITED(status) && !WEXITSTATUS(status))
> +		return;
> +
> +	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
> +		tst_res(TPASS, "Child killed by expected signal");
> +		return;
> +	}
> +
> +	tst_res(TFAIL, "Child %s", tst_strstatus(status));
> +}
> +
> +static void do_test(unsigned int i)
> +{
> +	if (tcases[i].error == EFAULT)
> +		test_bad_addr(i);
> +	else
> +		verify_ioctl(i);
>  }
>  
>  static void setup(void)
> @@ -86,6 +120,7 @@ static struct tst_test test = {
>  	.needs_tmpdir = 1,
>  	.setup = setup,
>  	.cleanup = cleanup,
> -	.test = verify_ioctl,
> -	.tcnt = ARRAY_SIZE(tcases)
> +	.test = do_test,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.forks_child = 1,
>  };
> -- 
> 2.45.2
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
