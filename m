Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4A3874D5
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:10:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E2CA3C95DD
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:10:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2DAD3C87D1
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:10:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D532F200236
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:10:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F604B0B7;
 Tue, 18 May 2021 09:10:23 +0000 (UTC)
Date: Tue, 18 May 2021 10:44:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YKN+Wi4qo4TnJGkg@yuki>
References: <YJOYgZNL7/qp5YCN@yuki> <YJpq26w8NBvBzUSc@yuki>
 <YJz4A3mR3jHciihe@yuki>
 <CAEemH2eo7LOvz0LBwuaNkM2aRRWxD_rErOWFyHjVOpRB3oNCsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eo7LOvz0LBwuaNkM2aRRWxD_rErOWFyHjVOpRB3oNCsw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP pre-release git freeze and call for testing
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Tested the latest LTP branch on RHEL8 (with itself kernel-4.18~ and
> mainline kernel-v5.13-rc1), the result looks pretty good to me.

Thanks a lot!

> Mainline kernel:
>   mkswap01 6 TBROK: "check_for_file /dev/disk/by-label/ltp_testswap" timed out
>     - looks like hit the race condition issue as before
>   hugemmap05.c:84: TBROK: mmap((nil),2147483648,3,1,3,0) failed: ENOMEM (12)
>     - seems caused by memory fragmentation, not a big deal

This should be probably changed to TCONF but that can wait after the
release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
