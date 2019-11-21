Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBDD104A59
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 06:45:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49E0E3C22C8
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 06:45:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 962753C1454
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 06:45:11 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 819031000D44
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 06:45:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89421AC18;
 Thu, 21 Nov 2019 05:45:09 +0000 (UTC)
Date: Thu, 21 Nov 2019 06:45:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191121054507.GB59487@x230>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> > @Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if =
not really needed?
> > __u64 can be uint64_t etc (as it's also visible in struct dqblk in <sys=
/quota.h>
> > in various libc headers).
> > We used this approach for /usr/include/linux/bpf.h and for fanotify fix=
es for
> > musl (testcases/kernel/syscalls/fanotify/fanotify.h).

> > So unless you're against this approach here I'll change it before merge
> > (and add this info to next version of library API writing guidelines pa=
tch
> > https://patchwork.ozlabs.org/patch/1166786/).

> I have no objection about using uint64_t becuase Q_GETNEXTQUOTA man-pages=
 also uses it.
> I used  struct if_nextdqblk as same as <linux/quota.h> defined. But I don=
't know why we can't use
> <linux/type.h> in lapi/quotactl.h and I also use it in lapi/seccomp.h. IM=
HO, they affected nothing.
> Or, they have some redefined errors or not having this headers files in s=
pecial linux distribution.

Based on Jan's comment [1], maybe he meant it specifically for __kernel_fsi=
d_t in
fanotify.h, not as a general approach. __kernel_fsid_t is more complicated =
than
uint64_t. That's why I'm asking whether there is a general approach we want=
 to
take.

> > > +	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device->dev,
> > > +		test_id, (void *) &res_ndq));
> > > +	if (TST_ERR =3D=3D EINVAL || TST_ERR =3D=3D ENOSYS)
> > Does EINVAL really mans not supported? Shouldn't be just for ENOSYS.

> EINVAL can mean non-supported=A0 by using correct argument.

> look do_quotactl function in fs/quota/quota.c.

> static int do_quotactl(struct super_block *sb, int type, int cmd, qid_t i=
d,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void _=
_user *addr, const struct path *path)
> {

> =A0=A0=A0 switch (cmd) {
> =A0=A0=A0=A0=A0=A0=A0 case Q_QUOTAON:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return quota_quotaon(sb, ty=
pe, id, path);
> =A0=A0=A0=A0=A0=A0=A0 case Q_QUOTAOFF:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return quota_quotaoff(sb, t=
ype);
> =A0=A0=A0=A0=A0=A0=A0 case Q_GETFMT:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return quota_getfmt(sb, typ=
e, addr);
> =A0=A0=A0=A0=A0=A0=A0 case Q_GETINFO:
> =A0=A0=A0 =A0=A0=A0 ......

> =A0=A0=A0 =A0=A0=A0=A0 default:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> =A0=A0=A0=A0=A0=A0=A0 }
> }

> So if it doesn't have Q_GETNEXTQUOTA cmd, it should report EINVAL(we use =
correct argument and correct environment, so there is no failure).
OK, you're right, thanks for info :).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1178182/#2281586

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
