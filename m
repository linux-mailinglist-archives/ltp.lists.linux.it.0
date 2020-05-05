Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBBC1C5636
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 851F53C5832
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 11F9C3C2637
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:02:08 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3C2541A01206
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:02:07 +0200 (CEST)
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jVsWj-0001qD-Ao; Tue, 05 May 2020 08:02:05 +0000
Date: Tue, 5 May 2020 10:02:04 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Florian Weimer <fw@deneb.enyo.de>
Message-ID: <20200505080204.sdoxna53tjmgtcyd@wittgenstein>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505075938.slkllo2awlop33pu@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505075938.slkllo2awlop33pu@wittgenstein>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 05 May 2020 15:05:13 +0200
Subject: Re: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 05, 2020 at 09:59:38AM +0200, Christian Brauner wrote:
> On Tue, May 05, 2020 at 09:49:50AM +0200, Florian Weimer wrote:
> > * Jan Stancek via Libc-alpha:
> > 
> > > I'm seeing an issue with CLONE_IO and libc' clone() on ppc64le,
> > > where flags parameter appears to be sign extended before it's passed
> > > to kernel syscall.
> > 
> > Interesting, thanks for reporting this.  The manual page clearly
> > documents the interface as;
> > 
> >        int clone(int (*fn)(void *), void *child_stack,
> >                  int flags, void *arg, ...
> >                  /* pid_t *ptid, void *newtls, pid_t *ctid */ );
> > 
> > But the kernel uses unsigned long for clone_flags.  This looks like an
> > unintended userspace ABI breakage.
> > 
> > Rather than dropping the invalid flags check in the kernel (having the
> > check is valuable), I think the parameter should be changed to int or
> > unsigned int, or the flags check should be written in such a way that
> > it disregards bits that result from sign extensions: fail if
> > clone_flags != (int) clone_flags, otherwise set clone_flags = 0xFFFFFFFF.
> 
> Let me take a quick look. This just affects legacy clone it seems. Maybe
> we can do something to avoid that breakage without having to change
> extensions. Legacy clone shouldn't care about invalid flag checking
> since it never used to do that anyway, only clone3() does.

Oh I see. Ugh.

Christian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
