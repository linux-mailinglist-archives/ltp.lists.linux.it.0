Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA72D2C36
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 14:51:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C8283C4B8A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 14:51:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 82C3A3C2C2A
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 14:51:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4544E600934
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 14:51:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76CC7AC94
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 13:51:33 +0000 (UTC)
Date: Tue, 8 Dec 2020 14:51:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X8+E5BMEOjuVIRen@pevik>
References: <20201127163150.22903-1-chrubis@suse.cz>
 <20201127163150.22903-2-chrubis@suse.cz>
 <20201203121642.GA5809@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203121642.GA5809@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: tst_test.c: Add TBROK counter.
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

> Hi!
> > This ensures that TBROK is never lost.

> > If test process forks a child and the child calls SAFE_MACRO() the
> > failure will be lost unless the test process handles the exit value
> > properly and propagates the TBROK.

> > It is also strange that TBROK is the only return value that is solely
> > propagated by the exit value and not by the counters. This has been
> > mistake to begin with.

> Anybody to review this?

> I consider it important and at the same time quite safe to apply since
> I've tried to keep the changes minimal.

+1

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
