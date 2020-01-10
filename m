Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE3136D09
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 13:30:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7426C3C2594
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 13:30:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CF6AB3C2501
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 13:30:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 426D1201128
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 13:30:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C71FAF2D;
 Fri, 10 Jan 2020 12:30:13 +0000 (UTC)
Date: Fri, 10 Jan 2020 13:30:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200110123012.GA14140@rei.lan>
References: <1578299418-4961-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200108131231.GA23619@rei.lan>
 <bee8d39f-723f-491d-8676-a1c303f0a5bb@cn.fujitsu.com>
 <CAFA6WYMk-bT7xKG7nov8mzd=b4T1gzghxrFz9x_OegU8mtSNVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMk-bT7xKG7nov8mzd=b4T1gzghxrFz9x_OegU8mtSNVA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Maybe, I am fine with your way(I tested it). I only  refer to kernel
> > documention [1] .sysfs and proc file  use the same source for the
> > information and so should not differ. So I use fixed format as kernel
> > function to exact.  Also, I want to listen advise from Sumit.
> >
> 
> TBH, I think it's just a matter of taste. I am fine with either approach.

I dot not like that much that we generate the scanf format string on the
fly in the version that parses /proc/diskstat.

In the end we have to merge one of them, I slightly prefer mine, but I
do not have a strong feelings about this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
