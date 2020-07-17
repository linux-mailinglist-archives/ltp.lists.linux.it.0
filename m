Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D75223A7B
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:26:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFB333C2912
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:26:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C2D853C2218
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:26:02 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2D35E10018B3
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:26:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B3ED6E;
 Fri, 17 Jul 2020 04:25:59 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86EFA3F66E;
 Fri, 17 Jul 2020 04:25:58 -0700 (PDT)
Date: Fri, 17 Jul 2020 12:25:56 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200717112555.qewbnhbnfktzn56k@e107158-lin.cambridge.arm.com>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
 <20200716095738.GA9395@dell5510>
 <20200716101250.vd7nan2u2nydzbnf@e107158-lin.cambridge.arm.com>
 <20200716120852.GA22657@dell5510>
 <20200716134939.tqxswbdd2lcpcwp3@e107158-lin.cambridge.arm.com>
 <20200716142153.GA15980@dell5510>
 <20200716153037.3qpeyxjenditkq6k@e107158-lin.cambridge.arm.com>
 <20200716205654.GB15484@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716205654.GB15484@x230>
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

On 07/16/20 22:56, Petr Vorel wrote:
> Hi Qais,
> 
> merged your original patch.
> Thanks for your time.

Thanks Petr for your responsiveness and helpful remarks. And Huacai for his
reviewed-and-tested-by.

Thanks!

--
Qais Yousef

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
