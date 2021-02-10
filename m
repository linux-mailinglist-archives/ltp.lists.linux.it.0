Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FC31727D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 22:39:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1FA63C6F21
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 22:39:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 124523C6272
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 22:39:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2FE502009DC
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 22:39:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D429AC88;
 Wed, 10 Feb 2021 21:39:27 +0000 (UTC)
Date: Wed, 10 Feb 2021 22:39:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YCRSjQal+HFnzHs6@pevik>
References: <YCQvL8/DMNVLLuuf@pevik>
 <b74d54ed-85ba-df4c-c114-fe11d50a3bce@gmail.com>
 <270c474f-476a-65d2-1f5b-57d3330efb04@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <270c474f-476a-65d2-1f5b-57d3330efb04@kernel.dk>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] CVE-2020-29373 reproducer fails on v5.11
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
Cc: Pavel Begunkov <asml.silence@gmail.com>, Nicolai Stange <nstange@suse.de>,
 io-uring@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jens, Pavel,

> On 2/10/21 12:32 PM, Pavel Begunkov wrote:
> > On 10/02/2021 19:08, Petr Vorel wrote:
> >> Hi all,

> >> I found that the reproducer for CVE-2020-29373 from Nicolai Stange (source attached),
> >> which was backported to LTP as io_uring02 by Martin Doucha [1] is failing since
> >> 10cad2c40dcb ("io_uring: don't take fs for recvmsg/sendmsg") from v5.11-rc1.

> > Thanks for letting us know, we need to revert it

> I'll queue up a revert. Would also be nice to turn that into
> a liburing regression test.
Thanks a lot for a quick feedback and fix!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
