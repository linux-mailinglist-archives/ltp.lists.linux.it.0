Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C51C547F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 13:34:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67F1C3C5822
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 13:34:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A8CEC3C5813
 for <ltp@lists.linux.it>; Tue,  5 May 2020 13:34:46 +0200 (CEST)
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DAE6E6006CC
 for <ltp@lists.linux.it>; Tue,  5 May 2020 13:34:33 +0200 (CEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jVvqU-0002tI-Bl; Tue, 05 May 2020 11:34:42 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jVvqU-00073v-91; Tue, 05 May 2020 13:34:42 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Christian Brauner <christian.brauner@ubuntu.com>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
 <87a72m4uqm.fsf@mid.deneb.enyo.de>
 <20200505091554.eq7kzvb4twe2wgvl@wittgenstein>
 <871rny4taz.fsf@mid.deneb.enyo.de>
 <20200505095813.z7kakdbiwq7ewnmx@wittgenstein>
 <20200505102154.2sxm7yt5v3up55v3@wittgenstein>
Date: Tue, 05 May 2020 13:34:42 +0200
In-Reply-To: <20200505102154.2sxm7yt5v3up55v3@wittgenstein> (Christian
 Brauner's message of "Tue, 5 May 2020 12:21:54 +0200")
Message-ID: <87h7wu399p.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

* Christian Brauner:

> diff --git a/kernel/fork.c b/kernel/fork.c
> index 8c700f881d92..e192089f133e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2569,12 +2569,15 @@ SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>                  unsigned long, tls)
>  #endif
>  {
> +       /* Ignore the upper 32 bits. */
> +       unsigned int flags = (clone_flags & 0xfffffff);
> +
>         struct kernel_clone_args args = {
> -               .flags          = (clone_flags & ~CSIGNAL),
> +               .flags          = (flags & ~CSIGNAL),
>                 .pidfd          = parent_tidptr,
>                 .child_tid      = child_tidptr,
>                 .parent_tid     = parent_tidptr,
> -               .exit_signal    = (clone_flags & CSIGNAL),
> +               .exit_signal    = (flags & CSIGNAL),
>                 .stack          = newsp,
>                 .tls            = tls,
>         }
>
> (Note that kernel_clone_args->flags is a 64 bit unsigned integer.)

This looks reasonable to me, but I have not tested it.  I think it
will restore the expected no-check behavior for clone flags.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
