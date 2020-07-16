Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69C221FBD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:33:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFDE73C4ECF
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:33:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2E52D3C13E1
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:33:23 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9C452100188C
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:33:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C1E1FB;
 Thu, 16 Jul 2020 02:33:20 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE1263F68F;
 Thu, 16 Jul 2020 02:33:19 -0700 (PDT)
Date: Thu, 16 Jul 2020 10:33:17 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716060710.GA3812@dell5510>
User-Agent: NeoMutt/20171215
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr


On 07/16/20 08:07, Petr Vorel wrote:
> Hi Qais,
> 
> thanks for your patch.

Thanks for having a look.

> BTW this has already been reviewed and tested by Huacai Chen [1].
> LGTM, although I'd prefer to detect with with polling, isn't it possible? [1].

FWIW I did try to avoid the sleep [1].

Were you thinking of something like that (pseudo code)?

	for i in $(seq 3)
	do
		sleep 1
		verify()
		if [ sucess ]; then
			break;
		fi
	done

Or you had something more sophisticated in mind?

Thanks

--
Qais Yousef

[1] https://lore.kernel.org/lkml/20200407133520.GI162390@mtj.duckdns.org/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
