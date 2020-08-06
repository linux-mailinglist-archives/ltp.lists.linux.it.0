Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7D23D87D
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 11:21:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BD073C320D
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 11:21:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A68FD3C13E1
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 11:21:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 59C8420164B
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 11:21:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01C8BADE2;
 Thu,  6 Aug 2020 09:21:55 +0000 (UTC)
Date: Thu, 6 Aug 2020 11:21:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200806092158.GA3315@yuki.lan>
References: <96ce72a605e365a040b258db9323d3962ab80e29.1596545279.git.viresh.kumar@linaro.org>
 <20200805151145.GA631@yuki.lan>
 <20200806043644.n7ea7wxeklix65oq@vireshk-mac-ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806043644.n7ea7wxeklix65oq@vireshk-mac-ubuntu>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8] syscalls: clock_settime: Add test around y2038
 vulnerability
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Other than that these the code looks good. I can fix these two before
> > applying if you agree.
> 
> Sure. Thanks.

In the end I've also added safe macros for sigprocmask() and sigwait()
mainly because sigwait() is one of these funcitons that return error
instead of setting errno. Now the error handling that nobody gets right
is handled in the library...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
