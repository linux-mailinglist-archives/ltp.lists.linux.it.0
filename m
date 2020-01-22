Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FD145A0B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 17:41:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C83513C207E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 17:41:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8E1BA3C12A9
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 17:41:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1B21820126C
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 17:41:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2BD0AE46;
 Wed, 22 Jan 2020 16:41:36 +0000 (UTC)
Date: Wed, 22 Jan 2020 17:41:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200122164134.GB20996@dell5510>
References: <20200108103413.29096-1-pvorel@suse.cz>
 <20200122144917.GB29412@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122144917.GB29412@rei>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] TI-RPC: enhancements (pkg-config, libntirpc,
 travis)
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
Cc: libtirpc-devel@lists.sourceforge.net, Daniel Gryniewicz <dang@redhat.com>,
 Mike Frysinger <vapier@gentoo.org>, Steve Dickson <SteveD@redhat.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> I've looked over the patchset and it looks fine to me, acked.
Thanks for your review and ack.
Unfortunately there are errors, so I'm working on v2.

Missing AC_SUBST in first patch for TI-RPC CFLAGS and LIBS hide them,
when fixed it shows that TI-RPC is really just for libtirpc - not for glibc
nor for libntirpc due missing xdr_{u_,}char dependency (although I got some
reply on ticket for libntirpc [1]: use xdr_get{u,}int8 and xdr_put{u,}int8 in
libntirpc, so it might be fixed). This is dependency for both TI-RPC tests and
basic RPC tests (testcases/network/rpc/basic_tests). libntirpc might have also some
missing dependency for TI-RPC (pmap_unset, which is in glibc).

I still don't know whether current goal for libntirpc is to be API
compatible with libtirpc (similar to kerberos, which override libtirpc functions
with it's gssrpc_* variants via gssrpc/rename.h [2]).

On the other hand svc_unreg() is in both libtirpc and libntirpc, but missing in
glibc.

But I'm going to merge commit travis: Merge debian.cross-compile.*.sh
which is correct.

BTW I also get some "funny" errors on s390 on travis [3]:
install: error writing '/root/ltp-install/testcases/bin/mkdir05': No space left on device
(I never experienced lack of space on travis on intel, I guess non-intel archs are a bit experimental.)

Kind regards,
Petr

[1] https://github.com/nfs-ganesha/ntirpc/issues/200
[2] https://github.com/krb5/krb5/blob/master/src/include/gssrpc/rename.h
[3] https://api.travis-ci.org/v3/job/640230579/log.txt

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
