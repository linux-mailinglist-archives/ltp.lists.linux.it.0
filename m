Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8F1811F9
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:31:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35A453C5F2B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:31:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4E7CE3C5F24
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:31:19 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9390F1000C15
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:31:18 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id l36so541028pjb.3
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YSN/7gIKbvXDNiWZde45e00KWVYDOpAPtcMCg+YsorU=;
 b=nsQbgq9YNKokT+rBcts0RJKdw42pV6FkU3BL6kp/XNn27k96kgSUD1Kx47Bh4Rhj9c
 cvmmMTXxseMDW6li1u6DDeq2Clj6WYQEf+fyIOF4viyORAmpXPnOtCbB5lnsu71UboBS
 gPrMiwtmkbINdlrRrhrufjHOOhIbwe+fXfnsp+acoQ8PgAylzngF5Z7N357SRyjDQybJ
 OgcclGJa5xlMgb/M2LrbxWZV8NYGQV/qs+xDx/i75Kdq9QtU4r4RExkx9yBHZ2oNBcbR
 B3eom5hFFMrr+uED8CoVEu9MOepI0Gn19NldDRt4HL2dHVBVfX3THQVsDmxHBhGT0YJP
 YPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YSN/7gIKbvXDNiWZde45e00KWVYDOpAPtcMCg+YsorU=;
 b=WC2EcUl8yUMaC1GHHHXzrsJDoVXVOxzuLukL7FBeYkUcOBps9IW8MQwPyV+8D66hOy
 9fcIhr60MzV9O2Uqku8RGz/FMOwlwzxz4z9Le2l8xlo/sX7YduZUGQkDn0z8JHhV/jiU
 3ljQzpUFwC2A9rkjPs6e8HwOQvMGsNAWThZRFj3XCwsqvonCZjQEgF+NSPq/FPPOKx9H
 N/IDVSSnMqC9DYpkl2dxenZczRL9SFJFrFowJYEEsSVpFmyOwLRB9SOTtv+dtTWVf1vM
 Ap3nrTiUcmHoWw/1MFl57pujt5D5gm6PrVK96v/fcPJUPIIEv+BHduO29sk2wPSL9GNH
 Gr7w==
X-Gm-Message-State: ANhLgQ205OyKXeiR/1k4KSJ/rrl34C7OLOEd6jxWMdLd4+zNW6DAV/fF
 kSy8iT7mvo0ZA3P0vxtYVzBM5pM0/oE=
X-Google-Smtp-Source: ADFU+vtSzUPlmNWrJiZMHkBbEM/UeO3K0gE+7nN7cM649DC6oAStKcj1djMdxihbmhs9XCZQkR6B/g==
X-Received: by 2002:a17:90b:314:: with SMTP id
 ay20mr2074327pjb.51.1583911877029; 
 Wed, 11 Mar 2020 00:31:17 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id ev22sm4403700pjb.4.2020.03.11.00.31.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 00:31:16 -0700 (PDT)
Date: Wed, 11 Mar 2020 13:01:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200311073113.q7e7jauldjyizz2q@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07-03-20, 20:42, Li Wang wrote:
> On Fri, Mar 6, 2020 at 8:45 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> 
> > ...
> > >
> > > +int tst_is_mounted(const char *path)
> > > +{
> > > +     char cmd[PATH_MAX];
> > > +     int ret;
> > > +
> > > +     snprintf(cmd, sizeof(cmd), "mountpoint -q %s", path);
> > > +     ret = tst_system(cmd);
> >
> > I'm not sure that depending on mountpoint command is right choice, there
> > are all kinds of embedded systems out there that may be missing it.
> 
> 
> Good point, we'd better avoid involving other packages as the dependence of
> LTP.
> 
> 
> > Also this does not even handle the case that the command is missing.
> >
> > Looking at the v4 version, all we need is to correctly parse each line
> > from from /proc/mounts. I would just use strsep() with space as a
> > delimited and took first token that starts with a slash i.e. '/', then
> > we can just strcmp() it against the path. Or do I miss something?
> >
> 
> I'm afraid strcmp() can not satisfy the requirement for us. As you know LTP
> creates the MNTPOINT in temp dir that means it could not accurately match
> the string path which extracts from /proc/mounts with a slash.
> 
> e.g
> #define MNTPOINT "fallocate"
> ...
> /dev/loop4 on /tmp/FPp7kh/fallocate type xfs
> (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
> ...
> strcmp("/tmp/FPp7kh/fallocate", MNTPOINT) will never ruturn 0 to us.
> 
> What I can think of is to use strrchr() to cut the string after last '/',
> but that can only work for test mount fs in LTP ways. Other situations
> might not satisfy.

@Cyril, can we please finalize what you guys want me to do here ? I
don't really want to repost the patch, which still has issues :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
