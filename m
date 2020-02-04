Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0F151DAB
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:53:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 135823C2467
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:53:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 928633C244B
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:52:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 35646201356
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:52:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6381AAD5D;
 Tue,  4 Feb 2020 15:52:56 +0000 (UTC)
Date: Tue, 4 Feb 2020 16:52:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200204155254.GA15212@dell5510>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <20200204132152.GC16090@rei> <20200204142918.GB18759@dell5510>
 <20200204154432.GB2255@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204154432.GB2255@rei>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] autotools: Move simple definitions out of
 m4/* to configure.ac
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

> > Maybe we could use ac_cv_header_sys_xattr_h=yes to set HAVE_FTS_H for Makefile.

> > So it works with following diff applied work as well.
> > I have no strong opinion which one is better.

> That looks like even more black magic, let's go with the first version.
Thanks, merged original.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
