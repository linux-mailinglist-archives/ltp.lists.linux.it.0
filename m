Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A16803BD7B4
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:22:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25C7E3C7694
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:22:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5340A3C0F90
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:22:54 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E062A600C46
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:22:53 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1m0l2K-0005g4-1M; Tue, 06 Jul 2021 13:22:52 +0000
Date: Tue, 6 Jul 2021 10:22:47 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YORZJ5vIMabVG0yG@mussarela>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <YNnlIVB9M4/11JmT@yuki>
 <98a17ec4-3697-d5ba-583b-ce539782f18c@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98a17ec4-3697-d5ba-583b-ce539782f18c@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/shmget*: Convert into new api
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 05, 2021 at 12:03:33PM +0200, Krzysztof Kozlowski wrote:
> On 28/06/2021 17:05, Cyril Hrubis wrote:
> > Hi!
> > Pushed with a minor changes, thanks.
> > 
> 
> It looks like this commit not only converted into new API but also
> changed the test. We started noticing shmget02 and shmget03 test
> failures on several systems.
> 
> https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1934432
> 
> Reverting the commit helps and tests pass.
> 
> Since it is one big patch doing multiple things at the same time, it is
> difficult to bisect it more and find the cause.  Any ideas what went
> different here comparing to previous version of these tests?
> 

New tests were added, like testing for EPERM when using SHM_HUGETLB.
However, it does not fail with EPERM with there is sufficient
RLIMIT_MEMLOCK. I have just sent a fix for that.

Cascardo.

> 
> Best regards,
> Krzysztof
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
