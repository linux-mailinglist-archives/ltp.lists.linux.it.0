Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C41848CD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:07:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09BA43C5912
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:07:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3C70F3C58E7
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:07:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A81E601430
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:07:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 70A02AC6E;
 Fri, 13 Mar 2020 14:07:41 +0000 (UTC)
Date: Fri, 13 Mar 2020 15:07:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Chen Li <chenli@uniontech.com>
Message-ID: <20200313140739.GA21248@dell5510>
References: <87mu8smyab.wl-chenli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mu8smyab.wl-chenli@uniontech.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Subject: [PATCH] Update legacy codes in ltp_tpci.c
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

Hi,


> The kernel api used in ltp_tpci.c is too old and connot pass compile
> after 3.12.
Merged as obviously correct.
I added git commit references.

BTW whole pci is not used atm.
We should decide for versions we want to support and then update kernel
versions, which are now wrongly set to 2.6:

REQ_VERSION_MAJOR := 2
REQ_VERSION_PATCH := 6

This waits for project to define which kernel versions we support.
We had some discussion about it in the past, I just cannot find it,
so I'll probably send a new mail about it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
