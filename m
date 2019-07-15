Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF6E698B6
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 18:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597A53C1D17
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 18:00:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id ECA4E3C1D0B
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 18:00:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 52A2D1A0110C
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 18:00:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E953AFCD;
 Mon, 15 Jul 2019 16:00:11 +0000 (UTC)
Date: Mon, 15 Jul 2019 18:00:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20190715160010.GA30303@rei.lan>
References: <1563203796-22102-1-git-send-email-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563203796-22102-1-git-send-email-ice_yangxiao@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02.c: Read threshold from
 /proc/sys/kernel/acct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Don't use hardcoded threshold(default 4%) to check free space
> because it can be changed by writing "/proc/sys/kernel/acct"
> or using sysctl.

Good catch, I missed the sysctl API since I haven't realized that the
proc handlers are all stuffed in a different file in kernel/sysctl.c.

What about we as well temporarily lower the value if needed while the
test is running?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
