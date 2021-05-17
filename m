Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90A3824C3
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 08:50:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68AF93C30F4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 08:50:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60BAF3C2091
 for <ltp@lists.linux.it>; Mon, 17 May 2021 08:50:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D0C41400BCD
 for <ltp@lists.linux.it>; Mon, 17 May 2021 08:50:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A07CCAAFD;
 Mon, 17 May 2021 06:50:55 +0000 (UTC)
Date: Mon, 17 May 2021 08:50:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YKISTkJGjp4blNH+@pevik>
References: <20210514132639.4181-1-pvorel@suse.cz>
 <60A2040A.4080002@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60A2040A.4080002@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Petr
> > Signed-off-by: Petr Vorel<pvorel@suse.cz>
> > ---
> >   doc/supported-kernel-libc-versions.txt | 57 ++++++++++++++++++++++++++
> >   1 file changed, 57 insertions(+)
> >   create mode 100644 doc/supported-kernel-libc-versions.txt

> > diff --git a/doc/supported-kernel-libc-versions.txt b/doc/supported-kernel-libc-versions.txt
> > new file mode 100644
> > index 000000000..b7ae01f11
> > --- /dev/null
> > +++ b/doc/supported-kernel-libc-versions.txt
> > @@ -0,0 +1,57 @@
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
> AFAIK, travis uses lastest distribution image to build. So it may exist 
> the situation that it build pass on lastest centos7 and build failed on 
> older centos7. I think we should add a note in here.
+1

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
This means we need to update time to time, at least for CentOS and Debian.

Debian moves to another release after current testing gets released.
We might want to use names (e.g. stretch) instead of "oldstable", "stable".
(I slightly prefer current approach, but not having a strong opinion)

> > +
> > +For older versions please use https://github.com/linux-test-project/ltp/releases[older LTP releases].
> > +
> > +1.2 Supported architectures
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
nit: not sure if having this as a table and supported libc (next section) just
paragraphs.

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
> > +(see https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh[travis script]
> > +for list of files which need to be deleted in order to compile under musl).
> > +
> > +For bionic libc please (Android) use https://android.googlesource.com/platform/external/ltp/[AOSP fork].

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
