Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5290519D494
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:05:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0CC73C2FAB
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:05:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BF41B3C2F7A
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:05:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2C09160158E
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:05:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E730CAC92;
 Fri,  3 Apr 2020 10:05:12 +0000 (UTC)
Date: Fri, 3 Apr 2020 12:05:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <20200403100511.GA23296@dell5510>
References: <MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <5E86F92F.9080200@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5E86F92F.9080200@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LIBTIRPC Error
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Deepa Ballari <deepa@exaleapsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pankaj, Xiao,

> > Hi,
> > I am trying to run ltp on 5.4.3 kernel with our custom yocto distro but
> > i am facing following issue , i have installed

> > pkg-config libtirpc-dev libtirpc1 but still the same error is getting
> > encountered,can someone help us to solve it??

> > .*/configure: line 6794: syntax error near unexpected token `LIBTIRPC,'
> > **./configure: line 6794: ` PKG_CHECK_MODULES(LIBTIRPC, libtirpc >*

> It seems that pkg-config package(it provides pkg-config command) is not
> installed on your enviroment.
+1
You need to have pkg.m4 (usually /usr/share/aclocal/pkg.m4).

Distros might have it in different packages than pkg-config or pkgconf,
but they usually install it as a dependency.
openSUSE have it in pkgconf-m4, but installed as dependency with pkg-config.
Debian have it in pkg-config and pkgconf.

Yes, this has been documented on usual places:
https://github.com/linux-test-project/ltp/#quick-guide-to-running-the-tests
If you have git, autoconf, automake, m4 and pkg-config, the linux headers and
the common developer packages installed ...

https://github.com/linux-test-project/ltp/blob/master/INSTALL
If you want to use auto configuration you also need autoconf-2.61+, automake-1.10+
and pkg-config.

(+ also in travis scripts (in travis/ directory) and also in the commit, but
both aren't that much visible for users).

But apparently that's not enough (you mentioned pkg-config, so you have read the
docs. Maybe I should state that the dependency is on pkg-config autotools
integration (pkg.m4).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
