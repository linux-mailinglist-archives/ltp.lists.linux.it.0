Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF86170F00
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 04:25:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E5223C25AB
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 04:25:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 032CD3C110C
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 04:25:29 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 262D6601DC4
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 04:25:29 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id t3so703996pgn.1
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 19:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aGApe6hwbcOVxqrl69EZcd9WR08uRd0bjiISl8qd98s=;
 b=b/FowgBrC03bm7gAQ06kXBIRIN0vpwYgX3sEW6JwJ9ibfwgGnKjzVlWqWZU/WVXlj4
 l9XvG9ZQInhQQEXEJS4FSpc/t49rMJaTe2zpQ8e0howKrG1LsgCiYRc6VvjqrrpQExOa
 Wjw8wa0cGYB4wmtcvZgM4WlNMi9vcf/Jlna9Wz+nlIzDqAMQqe7tP9MgVqBCB/5XuJZh
 5O+arc6+JeGPEHY+3RkkJGuMP93XYdsqdP3/Tr1tRQvUxx/6RBcW5tF2mlno7m4u+oaj
 9PwmEbePH8o52EVx6q5Imj/6RoS5yWLgfZF/HDeYD/nYbSltZilTSgl+YzV+q8GBI92F
 8ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aGApe6hwbcOVxqrl69EZcd9WR08uRd0bjiISl8qd98s=;
 b=B54df5QZiQpr+o4Ghawz8xuSzaFLi6LJfhTunGkDtpSdRWVB9seMSDZ4DHQTHJej8D
 pfDxxfM/JOO5SRaaSh1t6Ra1JyhtgctG/GxK8zKq3hda3ntLOyMqsXAOlQ0UGrFJcEvs
 hNCqbhPKzcWFH1boDLbxpA7Q1FovrRRCDaXJ4k2YaBh/KwbJSzNNCEWOoAMOYf0NPAoo
 4td2iFGvw/m8vjka5yYra/t3SHEAaQT1kyW3WJO5nyf0XwsFVDmQ1cDfCr27q9OIkleS
 hn8m8KMj+kxiEF1CYZ4NXF5DipSyXMVySO7mNY6QvYD7CsaRhPstgCNZHdR6TWHq/Wpz
 2BfA==
X-Gm-Message-State: APjAAAXLJEEjiYRpbYACgcHHpHFE6/kc1ei3b/sbyVKlpSFBSs4L9EWn
 GiQ+MMPVJez3wkite2dzpCEqaw==
X-Google-Smtp-Source: APXvYqyuuvp10M03jLALP6+MxZMEwRK9VCpP0lciZ2i68uCKNLrGW9+Jw8ywepsu5ZBUevBvT5ELcQ==
X-Received: by 2002:a63:b515:: with SMTP id y21mr2025828pge.148.1582773927337; 
 Wed, 26 Feb 2020 19:25:27 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z27sm4802508pfj.107.2020.02.26.19.25.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 19:25:26 -0800 (PST)
Date: Thu, 27 Feb 2020 08:55:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200227032524.yldx3diebom3wqod@vireshk-i7>
References: <20200226232649.8736-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226232649.8736-1-pvorel@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lap/syscalls: Update syscall numbers
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

On 27-02-20, 00:26, Petr Vorel wrote:
> From: Viresh Kumar <viresh.kumar@linaro.org>
> 
> to sync with the kernel v5.6-rc3.

This doesn't look right, you missed some text here ?

> As this was performed in some sort of automated way, few extra changes
> may be noticed while converting from kernel files to LTP, like a
> different format of defining syscalls or removal of obsolete syscalls.
> 
> The diff generated against sh.in file is enormous and looks like someone
> did a mistake while adding the syscall numbers there as they look to be
> mostly incorrect from 220 to 393. They are fixed as a consequence of
> this exercise.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> [ pvorel: various fixes for 32bit syscalls in 64bit arch and vice versa ]

Sorry about making these mistakes :(

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1->v2:
> * remove wrong umount in ia64
> * fixed typo sched_rr_get_interval_ti (=> sched_rr_get_interval_time64)
> * various fixes for 32bit syscalls in 64bit arch and vice versa
> 
> TODO: not sure about spu and nospu ABI in powerpc (whether they go to
> 32 bit or 64 bit or is ignored)
> 
> === DIFF from v1 ===
> diff --git include/lapi/syscalls/s390.in include/lapi/syscalls/s390.in
>  pkey_free 386
> -semtimedop 392

Why is this removed ?

> diff --git include/lapi/syscalls/s390x.in include/lapi/syscalls/s390x.in
> index dfb7ee811..88cc9b86b 100644
> --- include/lapi/syscalls/s390x.in
> +++ include/lapi/syscalls/s390x.in
> @@ -10,17 +10,12 @@ link 9
>  unlink 10
>  execve 11
>  chdir 12
> -time 13

And the ones like these..

Because they are only for 32 bit arch and not 64 ?

> diff --git include/lapi/syscalls/sparc.in include/lapi/syscalls/sparc.in
> -sched_rr_get_interval_ti423
> +sched_rr_get_interval_time64 423

Really bad that I made these mistakes with my vim tricks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
