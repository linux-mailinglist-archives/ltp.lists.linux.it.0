Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id 94F18163F42
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:33:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77E6F3C244B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:33:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7ECFB3C237E
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:33:16 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3C56D1001270
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:32:33 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id ep11so2264642pjb.2
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 00:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cS4MKX4wl32rNoJBsQXcULax9FwKknO5QWhgSWwBFgc=;
 b=XIKGz43kf/yyXQRknl1dym1U76uHynCFMivWqrsayMBnZGg3GG5Vz83KkXq6b+rD4E
 cL3RdE+9r0KVpmkJJUa+5bWHoCwQy1lExR3A7KEAZwG2o4BY6j9ajcpYq+u/jeVtHGe9
 VTY5m6+v4VimhT6j0YzPY9c9pMiLT1U7IGrqR3CGiQKh/aGxw3pthEvhW8rPSNBPv6Yq
 7RPrvcOORDJ8fzUuU3n4pSFFs+anP8ELB0a/VfRmjIBMNzQgA+7t9f85dSHIU6y2Lx1y
 vjz0N3/VwQ2cTD2H2qfpuBiXTRj6m0UlQwO8vzervevCdI+v6mdl/B6hnKNgztpbtw9j
 d+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cS4MKX4wl32rNoJBsQXcULax9FwKknO5QWhgSWwBFgc=;
 b=fIM+jmfeiVyC3AmL6BXm9CnVQYzK8dztNW4KBP4t5rF162hnpaqMc3NBUeJ8L8JnOx
 355Q373xvZz10rndrrNnTD4/9NHR806aANKSQR9XnqtlZGydqwyycyEMK69lxdfg+iOY
 hcelJzo9dyhBPU+iG2bNOYo5p85FOr1s9Ph4qhZlmLJ2Qxm77URBlIrmBneBWJHWeSrF
 +bQYIIAMYB3ctiCvOeTsUr9K5/GnR7hDOZBrTd19jgvuIRYh0hk4gfT6NkKBcYChl1DR
 wxn+edp/G50OrpZqRe/bH52LHr/DIYKeoSRWOaN8vIv/YY9GwdrM6UTPRsLXLHLSmT4K
 c/WQ==
X-Gm-Message-State: APjAAAWx0ZbKOFpBjgBQFZF7BgNcApxHy6I43QuHaYbQHpWUcMfVfWen
 ZDTxoVnkZQaGYlEL1fYOzCF5Pg==
X-Google-Smtp-Source: APXvYqyuzOsDG8xfDKzDINKdccRDcyZryyXv3aYXJTl8sdxZNuFi/EEfhkisJjUF/Y6bpxV/o7vypA==
X-Received: by 2002:a17:902:8343:: with SMTP id
 z3mr25659328pln.105.1582101193635; 
 Wed, 19 Feb 2020 00:33:13 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id b25sm1702468pfo.38.2020.02.19.00.33.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 00:33:12 -0800 (PST)
Date: Wed, 19 Feb 2020 14:03:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200219083310.e7ole7n37cpvsrh2@vireshk-i7>
References: <20200219083019.22799-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219083019.22799-1-pvorel@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fsmount01: Avoid leaving file descriptor open
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

On 19-02-20, 09:30, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> this is probably not needed, as fd will be closed at program exit
> anyway.
> 
> Kind regards,
> Petr
> 
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
> index 83185b48a..aea050506 100644
> --- a/testcases/kernel/syscalls/fsmount/fsmount01.c
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -16,6 +16,7 @@
>  
>  #define LINELENGTH 256
>  #define MNTPOINT "newmount_point"
> +
>  static int sfd, mfd, is_mounted;
>  
>  static int ismount(char *mntpoint)
> @@ -38,6 +39,9 @@ static int ismount(char *mntpoint)
>  
>  static void cleanup(void)
>  {
> +	if (sfd > 0)
> +		SAFE_CLOSE(sfd);
> +
>  	if (is_mounted)
>  		SAFE_UMOUNT(MNTPOINT);
>  }
> @@ -67,7 +71,6 @@ static void test_fsmount(void)
>  		tst_brk(TBROK | TTERRNO, "fsmount() failed to create a mount object");
>  	mfd = TST_RET;
>  	tst_res(TPASS, "fsmount() created a mount object");
> -	SAFE_CLOSE(sfd);
>  
>  	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
>  	if (TST_RET < 0)

My patchset is making enough changes to this file and fixes this issue as well.
I won't ask you to not get this merged as you already sent it before me :)

My V2 will be on list very soon.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
