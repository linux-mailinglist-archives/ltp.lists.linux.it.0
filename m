Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F31FB466
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 16:29:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8E2E3C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 16:29:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3A9EA3C2262
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 16:29:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 072741BD9156
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 16:29:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B9EFABE4;
 Tue, 16 Jun 2020 14:29:48 +0000 (UTC)
Date: Tue, 16 Jun 2020 16:29:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200616142958.GA25688@yuki.lan>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
 <20200616131014.GB2790@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616131014.GB2790@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 0/6] syscalls: Add tests to verify the
 _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Looking at the travis it looks like we do have a problem with missing
__kernel_ulong_t on older kernel headers:

https://api.travis-ci.org/v3/job/698929344/log.txt

Also looking into kernel headers it looks like it's defined to unsigned
long unless on x32 which has unsigned long long. It seems that the types
__kernel_long_t and __kernel_ulong_t firstly appeared in 3.4 along with
the x32 so I guess that we will need a fallback definition in UAPI as
well. And given that __kernel_long_t is defined we may need something
as lapi/posix_types.h with:

#include "linux/posix_types.h"

#ifndef __kernel_long_t
# if (defined(__x86_64__) && defined(__ILP32__))
typedef long          __kernel_long_t
typedef unsigned long __kernel_ulong_t
# else
typedef long long          __kernel_long_t
typedef unsigned long long __kernel_ulong_t
# endif
#endif


Is that all or do I miss some 32bit ABI with 64bit syscalls?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
