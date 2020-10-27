Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7929AD8A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:39:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 975D73C5609
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:39:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DC4F03C23BB
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:39:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67E03200C25
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:39:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3405AF10;
 Tue, 27 Oct 2020 13:39:08 +0000 (UTC)
Date: Tue, 27 Oct 2020 14:39:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <20201027133944.GA23030@yuki.lan>
References: <20201006085309.32227-1-cascardo@canonical.com>
 <20201013140315.GD29925@yuki.lan> <20201020122351.GA15920@yuki.lan>
 <20201026151250.GA370402@mussarela>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026151250.GA370402@mussarela>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/timer_settime01: adjust for rounding
 from nsec to usec
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
Cc: Kelsey Skunberg <kelsey.skunberg@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Sorry, I was out on vacation. This fixes it for me when using
> clocksource=jiffies.

Thanks a lot for testing, pushed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
