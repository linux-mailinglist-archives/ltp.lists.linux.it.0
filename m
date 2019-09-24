Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412CDBC541
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 11:52:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA41A3C2077
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 11:52:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CE2A93C0428
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 11:52:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 06FCC6008C1
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 11:52:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00831AC32;
 Tue, 24 Sep 2019 09:52:31 +0000 (UTC)
References: <20190923125914.2572-1-rpalethorpe@suse.com>
 <20190923155215.GA2531@dell5510>
 <BYAPR11MB362484D50E4178C05B7D09C3CD850@BYAPR11MB3624.namprd11.prod.outlook.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <BYAPR11MB362484D50E4178C05B7D09C3CD850@BYAPR11MB3624.namprd11.prod.outlook.com>
Date: Tue, 24 Sep 2019 11:52:31 +0200
Message-ID: <87y2yeja1s.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: Add reproducing race-conditions section
 to docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Steve East <sge@cray.com> writes:

>>> +2.2.33 Reproducing race-conditions
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +If a bug is caused by two tasks in the kernel racing and you wish to 
>>> +create a regression test (or bug-fix validation test). The 
>>> +'tst_fuzzy_sync.h' library should be used.
>>Looks a bit strange to have this in 2 sentences (I'd write single one), but you're a native speaker, so you must know what is correct :).
>
> It is strange... 
>
> "If a bug is caused by two tasks in the kernel racing and you wish to create a regression test (or bug-fix validation test) then the 'tst_fuzzy_sync.h' library should be used."
>
> Steve.

OK, I was trying to make the sentences shorter, but obviously that was
not the correct way to do it.

Metan feel free to merge with fix :-)

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
