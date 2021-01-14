Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15E2F58D1
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 04:14:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9270F3C6AAA
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 04:14:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3A2A03C27E0
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 04:14:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 145A1200AF0
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 04:14:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,345,1602518400"; d="scan'208";a="103464955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 11:14:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4C2434CE1A08;
 Thu, 14 Jan 2021 11:14:33 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 11:14:32 +0800
Message-ID: <5FFFB70A.9040000@cn.fujitsu.com>
Date: Thu, 14 Jan 2021 11:14:18 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210111123626.28932-1-pvorel@suse.cz>
 <5FFEBDCC.6020102@cn.fujitsu.com> <X/7NxM9EaGiXvjDy@pevik>
In-Reply-To: <X/7NxM9EaGiXvjDy@pevik>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4C2434CE1A08.A767D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2021/1/13 18:39, Petr Vorel wrote:
> Hi Yang,
>
>> On 2021/1/11 20:36, Petr Vorel wrote:
>>> Using pkg-config is less error prone during cross compilation.
>> Hi Petr,
>> Is there any detailed example about the above point?
> Sometimes I experienced problems during cross compilation with installed library
> for build architecture but missing library for host architecture build failed
> during linking because library was expected but missing.
>
> But I it turned out to be when using our CROSS_COMPILE implementation (without
> specifying --host). When configuring with just --host libraries are properly
> detected with AC_CHECK_LIB().
Hi Petr,

Does the issue only happened when we use ./configure without --host?
In an other word, AC_CHECK_LIB() can detect proper installed libraries 
for build architecture by './configure --host', right?
> pkg-config has some pros and cons.
> Pros:
> * easily require specific library version
> * getting CFLAGS from *.pc file
> * IMHO it's a standard way nowadays

> Cons:
> * For cross compilation it's reuired to set correctly PKG_CONFIG_LIBDIR.
Current ltp mixes pkg-config and AC_CHECK_LIB() so I want to unify them.
We cannot use pkg-config for all libraries because some packages don't 
provide *.pc files.

Best Regards,
Xiao Yang
> I brought pkg-config as dependency to LTP due checking libtirpc>= 0.2.4.
> But this version is already 7 years old so we might not need this version check now.
> (and one day it'd be best to fix (or rewrite from scratch) rpc/tirpc tests and
> move them to libtirpc upstream as Sun-RPC was removed from glibc in 2.32).
>
> Thus we can safely reconsider if we want pkg-config or not.
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
