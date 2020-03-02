Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDE1753DA
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 07:37:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39AF03C6806
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 07:37:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3F5543C67FC
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 07:37:19 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DBCDF60069D
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 07:37:18 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id y30so4910347pga.13
 for <ltp@lists.linux.it>; Sun, 01 Mar 2020 22:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O4g9upqllRffGr9KjRhJnRif7J1MYZgmVWVKMiox15Q=;
 b=RDyqmMoa6TGtlS8ViZFA6u3fy2ZEJdffZqSlSPucu7o/BVYd359a5QhEc5kigFLTjp
 vxd9pPjft2Zon/QHQwTaiuCLTDhXe8Th4NlJW4qlAqUlP3iRSdaQFlJULZJbvdFk1vcm
 3n88XbK/zH50/ICVWTMkakMU/KIxkNVxiZwYbJjdbD/YeT/dryyLkAvIxZzTXkx2nb0G
 4fmcbhaX5KCayHJ8X5y4PRXF5eEeI4nvoaewsCqu5340DkSuiE46MKg6kPyk/CDfto06
 Ea7rZ7KVFgh2qJWLtGB2VW4JyShwaABkTXRgQ+7hPOp24HJir2lCUje1sRQ7Ekfouulc
 v+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O4g9upqllRffGr9KjRhJnRif7J1MYZgmVWVKMiox15Q=;
 b=ln+E+XqxOUIf1qaug9xKWpEJxhoF+Vm+1aanGlIgH2LdGvinsyGL6TKpYJzoKDcjZ0
 rL609YNQfkQ5PPFDKuied6ji5Hi+8Gw+UcWKl62n9TIErJZTagxZOc95Z3xaLDPhfmfU
 fi18L+FV5urIyLFbZs3nD2zx+xnHAnuzBucQ6BaqwXM/AHmDSaJuYO9Pd08p+waiXxKo
 4EtJyBmS4lYR4MxnS040LXbeecTzCugkx5p66Sd1AaurdvyI6C2hJHo7PUn/l6LIJ2Gc
 fjOr7eAJ77sqHMj6wFzE9SQ0g6jBGRBud1m/fLSERR+Slx9m/EvkrcIWK1HfwUFLOZN4
 lG1g==
X-Gm-Message-State: ANhLgQ26SlNWKWY9taS3hchHLi6w8fIHeuLcIwYv2vu/nx6cSVE8MJB9
 Yve9p+xA1H4VKyJtE3nUs6g46w==
X-Google-Smtp-Source: ADFU+vtZVhuBPq1yHcYJXR3639kn6elRdAYwXLgBjjlOU5W6/UX+jtLJ/m+XhkdRp0JmZCmLGuqlmQ==
X-Received: by 2002:a63:1547:: with SMTP id 7mr3399470pgv.353.1583131037156;
 Sun, 01 Mar 2020 22:37:17 -0800 (PST)
Received: from localhost ([122.167.24.230])
 by smtp.gmail.com with ESMTPSA id k9sm10706186pjo.19.2020.03.01.22.37.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Mar 2020 22:37:16 -0800 (PST)
Date: Mon, 2 Mar 2020 12:07:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228132210.GC8324@rei>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28-02-20, 14:22, Cyril Hrubis wrote:
> > +static void run(unsigned int n)
> > +{
> > +	int fd;
> > +	struct stat file_stat;
> > +	struct tcase *tc = &tcases[n];
> > +	struct open_how how = {
> > +		.flags = tc->flags | O_CREAT,
> > +		.mode = tc->mode,
> > +		.resolve = tc->resolve
> > +	};
> 
> This structure should be allocated tst_buffers, see capget01.c for
> example.

This changed few things.

I am getting a build warning now (same happen if I build bpf stuff as
well). I don't understand why this warning comes though.

openat202.c:69:1: warning: missing initializer for field 'caps' of 'struct tst_test' [-Wmissing-field-initializers]
 };
 ^
In file included from openat202.c:7:0:
../../../../include/tst_test.h:236:18: note: 'caps' declared here
  struct tst_cap *caps;
                  ^~~~


Also for the failure test where larger size was passed, the error
reported now is EFAULT as kernel can't access out of bound dynamically
allocated memory (instead of stack one earlier). In order to get
E2BIG, I need to add some hacks (allocate more memory and write
non-zero value to excess memory) and I don't think that would be worth
it, so my test will expect EFAULT now.

> > +	TEST(fd = openat2(*tc->dfd, tc->pathname, &how, sizeof(how)));
> > +	if (fd == -1) {
> > +		tst_res(TFAIL | TTERRNO, "openat2() failed (%d)", n);
> > +		return;
> > +	}
> > +
> > +	SAFE_FSTAT(fd, &file_stat);
> > +
> > +	if (file_stat.st_size == 0)
> > +		tst_res(TPASS, "openat2() passed (%d)", n);
> > +	else
> > +		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
> 
> So this is very basic test that just checks that openat() can open a
> file and we would need a few more for each of the newly introduced
> RESOLVE_* flags.

Hmm, this file is already testing openat2() with all different type of
resolve flags. What kind of further tests are you suggesting here ?

> > +	{AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 2 * sizeof(struct open_how), E2BIG},
>                                                              ^
> 							     What
> 							     happends if
> 							     we pass
> 							     size
> 							     smaller
> 							     than the
> 							     sizeof(struct open_how) ?
> 
> Do we get EINVAL just like for 0?

Yes, added a test for that as well.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
