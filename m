Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CA151C04
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 15:19:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B09F3C2546
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 15:19:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 336103C242F
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 15:19:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7205C200DC3
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 15:19:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB14FAFA8
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 14:19:23 +0000 (UTC)
Date: Tue, 4 Feb 2020 15:19:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200204141922.GA18759@dell5510>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <20200204132152.GC16090@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204132152.GC16090@rei>
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

Hi Cyril,

> > +AC_CHECK_HEADERS(fts.h, [have_fts=1])
> > +AC_SUBST(HAVE_FTS_H, $have_fts)

> How is that different from simple AC_CHECK_HEADERS() ?

> Can't we just put the hader into the call above?

AC_SUBST(HAVE_FTS_H, $have_fts) is needed as HAVE_FTS_H
is used in testcases/kernel/controllers/Makefile to filter out cpuset.

> Other than this the changes looks fine.
OK, I'll push it with your ack, unless you have idea, how to avoid using
AC_SUBST(HAVE_FTS_H, $have_fts).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
