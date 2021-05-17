Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F253823D8
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 07:55:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B0F43C3118
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 07:55:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F065E3C30EF
 for <ltp@lists.linux.it>; Mon, 17 May 2021 07:55:51 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4CD441400B70
 for <ltp@lists.linux.it>; Mon, 17 May 2021 07:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621230948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5mvgPVEoXQKpZhUcibqGvMRWZ/pbNbeiTZpl72mOI4=;
 b=BOruJx+Mb6QInNjqS8ExIOXw/OSGa5PPWl10RiRPbpARJAFaXPW+Xit5Ie5G165tJj7k8P
 7Ov5JY43uCJ1G+R4jsqVyIy+pCOm+eMrND9N+aGjwlqQWxH7eq6Z5CW10mnKUMt3XKvefK
 XsqkXxN1dZYfIKwp/11ZmqIP6HhmWF8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-XBVqLS0PPxyX6MLCY75I-g-1; Mon, 17 May 2021 01:55:45 -0400
X-MC-Unique: XBVqLS0PPxyX6MLCY75I-g-1
Received: by mail-oo1-f72.google.com with SMTP id
 n3-20020a4ae1c30000b0290201e0069e50so4748246oot.1
 for <ltp@lists.linux.it>; Sun, 16 May 2021 22:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5mvgPVEoXQKpZhUcibqGvMRWZ/pbNbeiTZpl72mOI4=;
 b=TruMFi6jvF+As3EBLoykkRUnRqYzqOAdU0FePnFbSz7ptDM8RR2bPUaxDrhRU5Ta1t
 8Dl/zT9qhCHPpfHgvkQefKmFVvkf6efQdRlVvd/b/oObZ+GxWv5B9t7HDPd5ijAF0UgG
 3+B+xUHzcDywyEV5aE0lUIEmsiyMJBumjEbt9OJttu3tCwXUeAFZ5HHI97P+dYV/5+TO
 G2KKUFLmvI6UGJgGPCbjhBVPWAS5rIbj6drePzcugrBYOgr9w2Y7kcSCcaMSjpOtZYSM
 Il+AnUoEin9b5NJudKdp6g/Wr88xVgdz2uU0RSOp8QyFYFX2NILS97qoFlyN74pqNRdD
 EUWA==
X-Gm-Message-State: AOAM530J5NaXOGmd7Tpc+75RHzW6dOjXcZ5ZZQfdvdLBlqMriUa4p05j
 9NOdBUQmDj87Kc69t3KY2XbEjf6wLG711QmwLcMcaopRBGxpLC/47yamiqcqdas+Sdwvs5mND30
 6LnP+QxvSTtt/sbgpKsVq0mzW7/0=
X-Received: by 2002:aca:aa08:: with SMTP id t8mr14347793oie.66.1621230944924; 
 Sun, 16 May 2021 22:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjZk69osi3JzpgvTdJY30l3ZGbbkCChPpJlQMZeSOv+EyQND7KN4YkKHOM4Zv7ELO1KnqlHPCXwS66QZmpUvo=
X-Received: by 2002:aca:aa08:: with SMTP id t8mr14347767oie.66.1621230944642; 
 Sun, 16 May 2021 22:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210514132639.4181-1-pvorel@suse.cz> <YJ6A0gcR9L+P9IXm@yuki>
In-Reply-To: <YJ6A0gcR9L+P9IXm@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 17 May 2021 07:55:27 +0200
Message-ID: <CAASaF6ytbCjwOSOywR4JUToJb_u9fOe2a2y4zE7_n99cgre5TQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add supported kernel, libc versions
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
Cc: automated-testing <automated-testing@yoctoproject.org>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, May 14, 2021 at 4:19 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > +Supported kernel, libc, toolchain versions
> > +==========================================
> > +
> > +1. Build testing with Travis CI
> > +-------------------------------
> > +
> > +We test master branch in https://travis-ci.org/github/linux-test-project/ltp/builds[travis CI]
> > +to ensure LTP builds on various distributions including old, current and bleeding edge.
> > +We test both gcc and clang toolchains, various arch with cross-compilation.
> > +
> > +For list of tested distros see
> > +https://github.com/linux-test-project/ltp/blob/master/.travis.yml[.travis.yml].
> > +
> > +
> > +NOTE: Travis does only build testing, passing the CI means only that the
> > +      test compiles fine on variety of different distributions and releases.
> > +
> > +1.1 Oldest tested distributions
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +[align="center",options="header"]
> > +|==============================================================
> > +| Distro                       | kernel | glibc | gcc   | clang
> > +| CentOS 7                     | 3.10   | 2.17  | 4.8.5 | -
> > +| Ubuntu 16.04 LTS xenial      | 4.4    | 2.23  | 5.3.1 | -
> > +| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
> > +|==============================================================
> > +
> > +For older versions please use https://github.com/linux-test-project/ltp/releases[older LTP releases].
>
> I'm not sure that this is a good suggestion.
>
> I would write something as:
>
> Older distributions are not officially supported, which means that it
> may or may not work. It all depends on your luck. It should be possible
> to compile latest LTP even on slightly older distributions than we
> support with a few manual tweaks, e.g. disabling manually tests for
> newly added syscalls manually, etc.
>
> If latest LTP cannot be compiled even with some amount of workarounds,
> you may result to older LTP releases, however these are _not_ supported
> in any way. Also if you are trying to run LTP on more than 10 years old
> distribution you may as well reconsider you life choices.

Should we also give some hint about accepting patches/wokrarounds for
very old distros?
For example: "Trivial fixes/workarounds may be accepted, but users are
encouraged to move to newer distro."

>
> > +1.2 Supported architectures
>         ^
>         Tested?
>
> We do support more than we test, right?
>
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +[align="center",options="header"]
> > +|==================================
> > +| arch          | build
> > +| x86_64        | native
> > +| x86 emulation | native
> > +| aarch64       | cross compilation
> > +| ppc64le       | cross compilation
> > +| s390x         | cross compilation
> > +|==================================
> > +
> > +1.3 Supported libc
> > +~~~~~~~~~~~~~~~~~~
> > +
> > +Targeted libc is https://www.gnu.org/software/libc/[GNU C Library (glibc)].
> > +
> > +https://uclibc-ng.org/[uClibc-ng] is not being tested should work as well as it
> > +attempt to maintain a glibc compatible interface
> > +(older https://www.uclibc.org/[uClibc] might have problems).
> > +
> > +https://musl.libc.org/[musl] is not yet supported
>                                           ^
>                                           fully?
> > +(see https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh[travis script]
> > +for list of files which need to be deleted in order to compile under musl).
> > +
> > +For bionic libc please (Android) use https://android.googlesource.com/platform/external/ltp/[AOSP fork].
>
>
> Thanks a lot for starting this.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
