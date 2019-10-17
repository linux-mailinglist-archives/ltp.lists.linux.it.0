Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B0DB11B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 17:29:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 697D63C233A
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 17:29:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B9E383C147F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 17:29:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B523A60234F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 17:29:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3BF8B4D7;
 Thu, 17 Oct 2019 15:29:08 +0000 (UTC)
Date: Thu, 17 Oct 2019 17:29:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191017152906.GA28447@dell5510>
References: <20190924183325.6143-1-pvorel@suse.cz>
 <20191017120829.GA31415@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017120829.GA31415@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] doc: Add very simple library API writing
 guidelines docs
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

> > Feel free to write more useful docs than my stub.

> It's a good stub actually, there is a lot that is not described at all.

> We should probably draft a longer readme that describes why we also
> have a mechanism for additional libraries in place and when to use it.
"additional libraries" do you mean tst_net.sh or what?
Or a text "put useful things into library"?
Or "try to keep synced shell and C API?

> Generally we lack a lot of documentation.
Yep.

> Now we only need someone to volunteer to write it down.
:).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
