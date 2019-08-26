Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC139D105
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 15:48:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A7103C1CF8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 15:48:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 379E93C12EB
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 15:48:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64F856021F6
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 15:48:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97476AC32
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:48:40 +0000 (UTC)
Date: Mon, 26 Aug 2019 15:55:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20190826135550.GC15568@haruka>
References: <20190820151831.7418-1-chrubis@suse.cz>
 <20190820151831.7418-6-chrubis@suse.cz>
 <1566464435.3467.4.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566464435.3467.4.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] kernel/uevent: Add uevent03
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
> > +	handler1 = strtok(handlers, " ");
> Not sure if it's possible that we will get none or only one handler?

Well that would be a bug. As far as I can tell we have to get eventX
handler and mouseY handler for each device that looks like a mouse.

I guess that checking the content of handler1 and handler2 wouldn't harm
though.

> > +	get_minor_major(handler1, minor_event1, major_event1,
> > MINOR_MAJOR_SIZE);
> > +
> > +	handler2 = strtok(NULL, " ");
> > +	get_minor_major(handler2, minor_event2, major_event2,
> > MINOR_MAJOR_SIZE);
> > +
> > +	destroy_uinput_mouse();
> > +
> > +	tst_res(TINFO, "Sysname: %s", sysname);
> > +	tst_res(TINFO, "Handlers: %s", handlers);
> Because of strtok(), we do not see all handlers here.

Ah my bad, we have to move that before the strtok() call.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
