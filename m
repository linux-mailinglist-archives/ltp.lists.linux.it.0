Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C87718CC88
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 12:18:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC4833C53B1
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 12:18:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7FC563C537F
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 12:18:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1C1081402C4D
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 12:18:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 185E3ACB9
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 11:18:05 +0000 (UTC)
Date: Fri, 20 Mar 2020 12:18:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200320111803.GA2935@dell5510>
References: <20200317121057.13529-1-mdoucha@suse.cz>
 <20200317121057.13529-3-mdoucha@suse.cz>
 <20200320085427.GA14750@dell5510>
 <5cf7a3b1-1b34-d10c-5c93-e77ef77f3044@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cf7a3b1-1b34-d10c-5c93-e77ef77f3044@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] Add connection tests for bind()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> tst_init_sockaddr_inet6() was trivial to implement so it's there for
> future use. The only reason why I'm not using it is that both loopback
> and wildcard addresses are provided by libc in expanded form so I don't
> need to convert them from string. I'll leave this patch as is.
Understand. My concern was that using it there would be more test coverage,
but actually it wouldn't. I'm ok to merge it as it is, just remove IPV6_ADDRESS,
which you don't use.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
