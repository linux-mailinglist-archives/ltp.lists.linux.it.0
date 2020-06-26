Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2920ADD1
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 10:05:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D1013C5843
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 10:05:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 001143C1360
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 10:05:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 690601A017C9
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 10:05:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB978ACF3;
 Fri, 26 Jun 2020 08:05:08 +0000 (UTC)
Date: Fri, 26 Jun 2020 10:05:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200626080529.GA2631@yuki.lan>
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
 <20200625132352.GA28350@yuki.lan>
 <20200626035509.vag5m6fejs6rwl7x@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626035509.vag5m6fejs6rwl7x@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] libs: Import vdso parsing lib from kernel
 tree
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Pushed with minor changes, thanks.
> > 
> > * Moved the comment about the function usage to the header
> > 
> > * Fixed some compiler warnings
> 
> I avoided these so in future we can simply copy paste the file from
> kernel tree to get more updates, and so we keep the delta between them
> to none.

These were minor changes, so we can copy the file over and redo them.

Also it looks like the kernel Makefile does not enable warnings at all,
which probably is not optimal, but who am I to complain...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
