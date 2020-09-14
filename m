Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32012268769
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 10:43:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE7FC3C4F2A
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 10:43:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 613833C2B69
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 10:42:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F13E32001A7
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 10:42:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C21EEAF8A;
 Mon, 14 Sep 2020 08:43:13 +0000 (UTC)
Date: Mon, 14 Sep 2020 10:43:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <20200914084325.GB5524@yuki.lan>
References: <BMXPR01MB23445019F67B128E04B26612EE250@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <20200914083623.GA5524@yuki.lan>
 <BMXPR01MB23441EA1A33E38BF93274ED1EE230@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB23441EA1A33E38BF93274ED1EE230@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Error with fs_fill
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> how i can resolve it?

That's a kernel bug, so it could be resolved by fixing the kernel.

> is there any way that i can find what's exactly happening ??

You would need to understand how Btrfs filesystem works internally. I
guess that a year or two spend studying it will do.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
