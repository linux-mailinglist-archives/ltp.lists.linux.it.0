Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1131FC96
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 17:02:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 724CE3C65B9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 17:02:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BAD993C4F0B
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 17:02:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 27ADD100112F
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 17:02:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29D4FACBF;
 Fri, 19 Feb 2021 16:02:01 +0000 (UTC)
References: <BMXPR01MB2870FA73C10D2EDB69D61050EE849@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Pankaj  Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
In-reply-to: <BMXPR01MB2870FA73C10D2EDB69D61050EE849@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 19 Feb 2021 16:02:00 +0000
Message-ID: <875z2o59mv.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP madvise06.c
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com> writes:

> Hi,
> i am running madvise06.c but i am getting message madvise06.c:63:
> CONF: System swap is too small (838860800 bytes needed) can someone
> suggest if i can increase size of swap and make this testcase work ??

Yes, you can increase your swap partition.

>
>
> Thanks!


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
