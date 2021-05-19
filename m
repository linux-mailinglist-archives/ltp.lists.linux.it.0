Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6D388E77
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 14:57:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1AB93C30BE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 14:57:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F4E03C2461
 for <ltp@lists.linux.it>; Wed, 19 May 2021 14:57:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9DACC1400B8E
 for <ltp@lists.linux.it>; Wed, 19 May 2021 14:57:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5F90AED7;
 Wed, 19 May 2021 12:57:52 +0000 (UTC)
Date: Wed, 19 May 2021 14:57:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YKULT1tIBFIR+U70@pevik>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <20210519063109.224352-2-lkml@jv-coder.de> <YKToUgBnK6ZQ5I0Q@yuki>
 <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> HI Cyril,

> On 5/19/2021 12:28 PM, Cyril Hrubis wrote:
> > Hi!
> > > There are some differences especially in signal handling
> > > between the shells, so execute the tests on as many
> > > shells as possible.
> > I'm not sure that we want to support anything but bash, dash and
> > busybox and even these three are enough trouble.

> > One of my friends once told me that it's easier to write a portable
> > shell than portable shell code and it looks like he was right...

> In general I would say: YES
> But if at some point in the future there are features used, that really o=
nly
> work for one shell,
> we can still reduce the tested shells for this script.

> Btw: ksh is not really support, it complains about all local variables,
> because it only allows them in "function <name>"-style functions.
> But the timeout code still works even there.

Although I generally agree that scrips should be portable to some extent
(it's already hard trying to keep it POSIX), it should be for shells which =
are
used on Linux distros as a default shell (/bin/sh). That's why besides the
default bash on most of distros we also care about dash (Debian/Ubuntu by
default) and busybox sh implementation (embedded distros and Alpine).
I'm not aware of any distro using ksh, csh or zsh as a default.

Trying to remember when I met ksh as a default, I guess it was on some old
Solaris, more than decade ago :).

We state this in shell shoding style chapter [1]. Maybe I should have added=
 it
into Supported kernel ... page [2], but not many people run shell tests any=
way.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#=
132-shell-coding-style
[2] https://github.com/linux-test-project/ltp/wiki/Supported-kernel,-libc,-=
toolchain-versions

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
