Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD81223A81
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:28:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 172E73C2912
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:28:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4FCBA3C2218
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:28:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A70A21401B9B
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:28:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DD67AE3C;
 Fri, 17 Jul 2020 11:28:47 +0000 (UTC)
Date: Fri, 17 Jul 2020 13:28:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Qais Yousef <qais.yousef@arm.com>
Message-ID: <20200717112840.GA56792@x230>
References: <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
 <20200716095738.GA9395@dell5510>
 <20200716101250.vd7nan2u2nydzbnf@e107158-lin.cambridge.arm.com>
 <20200716120852.GA22657@dell5510>
 <20200716134939.tqxswbdd2lcpcwp3@e107158-lin.cambridge.arm.com>
 <20200716142153.GA15980@dell5510>
 <20200716153037.3qpeyxjenditkq6k@e107158-lin.cambridge.arm.com>
 <20200716205654.GB15484@x230>
 <20200717112555.qewbnhbnfktzn56k@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717112555.qewbnhbnfktzn56k@e107158-lin.cambridge.arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On 07/16/20 22:56, Petr Vorel wrote:
> > Hi Qais,

> > merged your original patch.
> > Thanks for your time.

> Thanks Petr for your responsiveness and helpful remarks. And Huacai for his
> reviewed-and-tested-by.
I'm sorry, Huacai, I've forgotten to include your tags.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
