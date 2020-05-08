Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E81CA6A4
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 10:57:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56D1F3C56E7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 10:57:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 806203C25D9
 for <ltp@lists.linux.it>; Fri,  8 May 2020 10:57:02 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90F7D6013A6
 for <ltp@lists.linux.it>; Fri,  8 May 2020 10:56:47 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id r10so93755pgv.8
 for <ltp@lists.linux.it>; Fri, 08 May 2020 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F6STjshmPSnpXm/awVQLrhlg0acn1D3Wa2ViaMhFbeE=;
 b=NsFAuHvRdcxA6MlmaBcdrgPFglLrzpHxlKi+L+2YwKXmY0/FMgT+TDGcFys3amxnGd
 M7nXrUKKn9AbbFvk830Rm9f7wY7wJw2/aKoktPraQ50vg7Hm1TUpZJTUjX4z2AipM8vo
 pBgIgsvVrXr+AgEXZuJV+eAesK1b46qYQCA44y5mhfzZeKX21TyMom1hWlyxk1us1uFT
 YxLXdQUHYm91+D2fIejTTNnP0QDoqR2cq/bA+3+6RJLsWmqFRMgBxdXWqRd8y+gMuQBf
 kVl1EkrEeSCWnaCBwDrXXnUbyH2WNZxr4vzOa57YI/Sc/1526+W85DYK7NTjkyq3G7VO
 tDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F6STjshmPSnpXm/awVQLrhlg0acn1D3Wa2ViaMhFbeE=;
 b=DqtKhZIR0tpqc5vSY3ZBH823drNaoP3FpLktzsM96YHFzHFB+aSms8ilbY74vs8pcc
 AgSr501HwgLOa1SR7B6huHBE4uhLcbfPBb3VjVW79jkRzltQHGguML6JjmVYZZmjNs/L
 AGDn67Ej6CoF2wzJhn0nQnu10lyhDS8GH0PhLpYldkyv50wSNBaw+2Xvhi/u01knuqbg
 jn+FojCHOtKlC+erUNS3S4vIqOVw+LHBFLQyKlGhp5RAKvI3m8iW2iLRlMk0kmp2XM1V
 cXvWv0BPN1iaUS0PUvgCtg/aAbPTpYwGzAZWL84fjVnEjxKy3E5emlFNHEKuz9F3KP1y
 jHOg==
X-Gm-Message-State: AGi0Pua52YzT6Ezce/PBozGwi1Lp9bjgft4dHO0rWfWKa15bK8SstTMH
 3q52mMXCGZ+0xQt+V4eBcx70RPeTCQo=
X-Google-Smtp-Source: APiQypKvEn0C/JvAa7gUYjc1PV4fhJRC/U+iX8ce3u2W50Gb5cwKFWeXMnmkgb29wcb0DSt7eDIY7A==
X-Received: by 2002:a62:38cc:: with SMTP id f195mr1704829pfa.85.1588928220560; 
 Fri, 08 May 2020 01:57:00 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 128sm1079157pfy.5.2020.05.08.01.56.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 01:56:59 -0700 (PDT)
Date: Fri, 8 May 2020 14:26:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200508085657.ousiwqakcq7zegpo@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-05-20, 09:18, Arnd Bergmann wrote:
> On Fri, May 8, 2020 at 6:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > +
> > +static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
> > +               void *timeout)
> > +{
> > +       return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
> > +}
> > +
> > +static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
> > +                                       size_t nsops, void *timeout)
> > +{
> > +       return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
> > +}
> > +
> > +struct test_variants {
> > +       int (*semop)(int semid, struct sembuf *sops, size_t nsops);
> > +       int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
> > +       enum tst_ts_type type;
> > +       char *desc;
> > +} variants[] = {
> > +       { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> > +#if defined(TST_ABI32)
> > +       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
> > +       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
> > +#endif
> > +
> > +#if defined(TST_ABI64)
> > +       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
> > +#endif
> 
> 
> It feels like this is more complicated than it need to be. The line
> 
> semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc =
> "semtimedop: syscall with kernel spec32"},
> 
> should apply to any kernel that has "__NR_semtimedop !=
> __LTP__NR_INVALID_SYSCALL",
> regardless of any other macros set, and then you don't need the separate line
> 
> { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc =
> "semtimedop: syscall with kernel spec64"},
 
> which is not what the ABI is meant to be anyway (sys_semtimedop takes
> a __kernel_old_timespec,
> not a __kernel_timespec).

There is some misunderstanding here, surely from my side. The sys_
helpers here are the direct syscalls called from userspace with help
of tst_syscall().

AFAIU, on 32 bit systems we need to call __NR_semtimedop with the 32
bit and 64 bit timespec (both), and on 64 bit systems which don't
implement __NR_semtimedop_time64, we need to call __NR_semtimedop with
the 64 bit timespec only.

What you are telling now is very different from that and so I don't
get it.

> Similarly, the line
> 
>  { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> 
> should apply to both 32 and 64 bit machines

Yes and so it is called without ifdef hackery. Isn't that correct ? 

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
