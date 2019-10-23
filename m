Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF697E1DA7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 16:04:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF5BE3C1CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 16:04:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AAA3F3C1C9A
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 16:04:14 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3A29E2009C1
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 16:04:13 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=calabresa)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1iNHFE-00056A-Rc; Wed, 23 Oct 2019 14:04:13 +0000
Date: Wed, 23 Oct 2019 11:04:09 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191023140408.GC4055@calabresa>
References: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
 <1714198769.8739783.1571839133168.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1714198769.8739783.1571839133168.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On Wed, Oct 23, 2019 at 09:58:53AM -0400, Jan Stancek wrote:
> 
> 
> ----- Original Message -----
> > ENOTSUP in userspace is alias for EOPNOTSUPP, so the test still fails.
> > Add definition of kernel's ENOTSUPP and use that.
> > 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> 
> I think I misread the original commit. Seems we want this to fail for ENOTSUPP.
> 

You are right. We want this to succeed with EOPNOTSUPP, as it's a valid error
from kernel space.

However, we don't want to validate kernels that wrongly return ENOTSUPP, as
it's not a valid userspace errno. Any kernel code that exposes ENOTSUPP to
userspace is buggy and should be fixed. So, in fact, we would like to flag such
return values as failures/kernel bugs.

Cascardo.

> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
