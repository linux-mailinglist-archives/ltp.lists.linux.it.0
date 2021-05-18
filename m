Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA8387F5E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 20:15:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9BA63C87D0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 20:15:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AA783C87D0
 for <ltp@lists.linux.it>; Tue, 18 May 2021 20:15:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3A1E5200D4A
 for <ltp@lists.linux.it>; Tue, 18 May 2021 20:15:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 629DBAD10;
 Tue, 18 May 2021 18:15:41 +0000 (UTC)
Date: Tue, 18 May 2021 19:49:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YKP+KakyxIuGc/fo@yuki>
References: <20210518173039.4657-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518173039.4657-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] doc: Add supported distros (kernel, libc,
 toolchain)
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, automated-testing@yoctoproject.org,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> diff --git a/doc/supported-kernel-libc-versions.txt b/doc/supported-kernel-libc-versions.txt
> new file mode 100644
> index 000000000..a2dd66070
> --- /dev/null
> +++ b/doc/supported-kernel-libc-versions.txt
> @@ -0,0 +1,67 @@
> +Supported kernel, libc, toolchain versions
> +==========================================
> +
> +1. Build testing with Travis CI
> +-------------------------------
> +
> +We test master branch in https://travis-ci.org/github/linux-test-project/ltp/builds[travis CI]
> +to ensure LTP builds on various distributions including old, current and bleeding edge.
> +We test both gcc and clang toolchains, various arch with cross-compilation.
                                                  ^
						  This should be plural
						  so 'archs' I guess
> +For list of tested distros see
> +https://github.com/linux-test-project/ltp/blob/master/.travis.yml[.travis.yml].
> +
> +
> +NOTE: Travis does only build testing, passing the CI means only that the
> +      test compiles fine on variety of different distributions and releases.
> +      Also it uses the latest distribution image of a particular release.
           ^
	  Travis also uses...
> +1.1 Oldest tested distributions
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[align="center",options="header"]
> +|==============================================================
> +| Distro                       | kernel | glibc | gcc   | clang
> +| CentOS 7                     | 3.10   | 2.17  | 4.8.5 | -
> +| Ubuntu 16.04 LTS xenial      | 4.4    | 2.23  | 5.3.1 | -
> +| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
> +|==============================================================
> +
> +Older distributions are not officially supported, which means that it
> +may or may not work. It all depends on your luck. It should be possible
> +to compile latest LTP even on slightly older distributions than we
> +support with a few manual tweaks, e.g. disabling manually tests for
> +newly added syscalls manually, etc. Trivial fixes/workarounds may be accepted,
                          ^
			  This 'manually' is redundant and should be removed.

> +but users are encouraged to move to a newer distro.
> +
> +If latest LTP cannot be compiled even with some amount of workarounds,
> +you may result to older LTP releases, however these are _not_ supported
> +in any way. Also if you are trying to run LTP on more than 10 years old
> +distribution you may as well reconsider you life choices.

So in the end you haven't changed this for the nicer version I've
proposed?

> +1.2 Tested architectures
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[align="center",options="header"]
> +|==================================
> +| arch          | build
> +| x86_64        | native
> +| x86 emulation | native
> +| aarch64       | cross compilation
> +| ppc64le       | cross compilation
> +| s390x         | cross compilation
> +|==================================
> +
> +1.3 Supported libc
> +~~~~~~~~~~~~~~~~~~
> +
> +[align="center",options="header"]
> +|==================================
> +| Libc      | Note
> +| https://www.gnu.org/software/libc/[GNU C Library (glibc)] | Targetted libc, tested both compilation and actual test results.
> +| https://uclibc-ng.org/[uClibc-ng] | Although not being tested it should work as well as it attempt to maintain a glibc compatible interface.
> +| https://www.uclibc.org/[uClibc]   | Older https://www.uclibc.org/[uClibc] might have problems.
> +| https://musl.libc.org/[musl] | Not yet fully supported (see
> +                                 https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh[travis script]
> +                                 for list of files which need to be deleted in order to compile under musl).
> +| binder (Android) | Please use https://android.googlesource.com/platform/external/ltp/[AOSP fork].
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
