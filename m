Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E737380C8A
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 17:07:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD5B73C89CA
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 17:07:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80CF63C63A2
 for <ltp@lists.linux.it>; Fri, 14 May 2021 17:06:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9D86468FF58
 for <ltp@lists.linux.it>; Fri, 14 May 2021 17:06:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC22FB1A5;
 Fri, 14 May 2021 15:06:55 +0000 (UTC)
Date: Fri, 14 May 2021 17:06:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJ6SDSAsLoXHgnOc@pevik>
References: <20210514132639.4181-1-pvorel@suse.cz>
 <YJ6A0gcR9L+P9IXm@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ6A0gcR9L+P9IXm@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [RFC PATCH 1/1] doc: Add supported
 kernel, libc versions
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, automated-testing@yoctoproject.org,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

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

> I'm not sure that this is a good suggestion.

> I would write something as:

> Older distributions are not officially supported, which means that it
> may or may not work. It all depends on your luck. It should be possible
> to compile latest LTP even on slightly older distributions than we
> support with a few manual tweaks, e.g. disabling manually tests for
> newly added syscalls manually, etc.

> If latest LTP cannot be compiled even with some amount of workarounds,
> you may result to older LTP releases, however these are _not_ supported
> in any way. Also if you are trying to run LTP on more than 10 years old
> distribution you may as well reconsider you life choices.
+1 (although not sure about the latest sentence :))

> > +1.2 Supported architectures
>         ^
> 	Tested?
+1

> We do support more than we test, right?

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
> 					  fully?
+1

> > +(see https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh[travis script]
> > +for list of files which need to be deleted in order to compile under musl).
> > +
> > +For bionic libc please (Android) use https://android.googlesource.com/platform/external/ltp/[AOSP fork].


> Thanks a lot for starting this.

Thanks a lot for all the feedback, I'll take it all for v2.
It'd be nice to get it merged before the release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
