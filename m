Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0401E1EB4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 16:56:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7658B3C2262
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 16:56:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E79AA3C12A0
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 16:56:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DECAC6019B5
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 16:56:46 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=calabresa)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1iNI45-0008Ui-JF; Wed, 23 Oct 2019 14:56:46 +0000
Date: Wed, 23 Oct 2019 11:56:41 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191023145640.GD4055@calabresa>
References: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
 <1714198769.8739783.1571839133168.JavaMail.zimbra@redhat.com>
 <20191023140408.GC4055@calabresa>
 <6089b924-8dbe-c43d-72d9-a4086a13b0d5@suse.cz>
 <20191023143510.GA10116@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023143510.GA10116@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_create01: accept kernel ENOTSUPP
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 23, 2019 at 04:35:11PM +0200, Cyril Hrubis wrote:
> Hi!
> > > You are right. We want this to succeed with EOPNOTSUPP, as it's a valid error
> > > from kernel space.
> > 
> > Actually, man says that EOPNOTSUPP is only valid for socket operations.
> > So no, we should not go out of our way to explicitly check timer errors
> > against EOPNOTSUPP either. (It's also a waste of time because on Linux,
> > ENOTSUP == EOPNOTSUPP).
> 
> Beware that kernel defines ENOTSUP that is not equal to EOPNOTSUPP and
> in this case this value leaked to userspace leading to invalid userspace
> errno value.

That was ENOTSUPP (the internal kernel error, defined as 524). ENOTSUP, defined
as EOPNOTSUPP, is the userspace error I guess Martin is saying should not be
used either.

In that case, we need to fix the kernel to return EINVAL instead. Looking at
older changes here, I see commit 98d6f4dd84a134d942827584a3c5f67ffd8ec35f
("alarmtimer: return EINVAL instead of ENOTSUPP if rtcdev doesn't exist")
claiming exactly this. Though it was about clock_getres and clock_gettime,
quoting from that commit:

"
    Second, Posix and Linux man pages agree that clock_gettime and
    clock_getres should return EINVAL if clk_id argument is invalid.
    While the arugment that the clockid is valid, but just not supported
    on this hardware could be made, this is just a technicality that
    doesn't help userspace applicaitons, and only complicates error
    handling.
"

> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
