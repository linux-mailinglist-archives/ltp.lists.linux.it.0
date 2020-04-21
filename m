Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA21B2325
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:46:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FBD83C29B7
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:46:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 376A83C2999
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:46:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E830C1401A3D
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:46:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2794AE87;
 Tue, 21 Apr 2020 09:46:03 +0000 (UTC)
Date: Tue, 21 Apr 2020 11:46:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200421094622.GF6577@yuki.lan>
References: <CAKohponWBU_pSDk6sjsMFBkJzwPDz71DcyC1_X6x1=0bZMb=aQ@mail.gmail.com>
 <20200421092045.GC6577@yuki.lan>
 <20200421092616.lnktrr4e4pv7wemm@vireshk-i7>
 <20200421094422.GE6577@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421094422.GE6577@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Purpose of clock_nanosleep2 tests ?
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
> > clock_nanosleep03.c already tests ABSTIME. I think we can just drop
> > clock_nanosleep2 directory completely. I will send a patch if that looks okay.
> 
> clock_nanosleep03 is testing that inside of a time namespace, I think
> that there is still value of having the simpler test as well.

Moreover the time namespaces does not support CLOCK_REALTIME so we
should implement clock_nanosleep() test with CLOCK_REALTIME and
TIMER_ABSTIME which is not covered at the moment anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
