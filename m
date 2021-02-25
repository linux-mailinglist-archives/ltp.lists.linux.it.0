Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98E324B9A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 09:00:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 689A33C5A38
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 09:00:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B457F3C4E1E
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 09:00:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D6AC1600F06
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 09:00:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4FCDACE5;
 Thu, 25 Feb 2021 08:00:03 +0000 (UTC)
Date: Thu, 25 Feb 2021 09:00:02 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Liam Howlett <liam.howlett@oracle.com>
Message-ID: <YDdZAu9KlOsVToML@pevik>
References: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
 <20210209143702.2003038-2-Liam.Howlett@Oracle.com>
 <YCZYB2w+Il5F0TlI@pevik> <20210224213520.rfdk2hdslqua7a2c@revolver>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224213520.rfdk2hdslqua7a2c@revolver>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] brk02: Add test for removing more than one VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Liam,

> > > +	addr += page_size;
> > > +	if (brk(addr))
> > > +		return;
> > You need to add tst_ret(TFAIL, "failed due ..."); before each return otherwise
> > you get error:
> > tst_test.c:1080: TBROK: Test haven't reported results!

> I believe you mean tst_res().  I will fix it.
Yes, sorry for typo.

Thanks for your work!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
