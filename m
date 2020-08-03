Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409C23A771
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 15:27:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0AF03C678F
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 15:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CC6003C1CB7
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 15:27:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4F9E06005FB
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 15:25:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13023ACA0;
 Mon,  3 Aug 2020 13:27:30 +0000 (UTC)
Date: Mon, 3 Aug 2020 15:27:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200803132713.GA8810@dell5510>
References: <20200731121508.12805-2-chrubis@suse.cz>
 <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build system: Add explicit make rules
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

Hi all,

> ----- Original Message -----
> > This commit adds explicit build rules, the main motivation are recent
> > build failures caused by library orderings. To fix that this commit
> > introduces LTPLDLIBS special variable that is passed to linker before
> > the LDLIBS which avoids the need for tricks as
> > "LDLIBS := -lltpfoo $(LDLIBS)" in the Makefiles.

> > This commit also silences the output by default a bit, the verbose
> > output could be enabled by VERBOSE=1 env variable, which is probably
> > what most of the build systems will do if this gets commited. I guess
> > that we can as well silence a bit the "make entering/leaving directory"
> > if this the right way to go.

> alias for V=0 / V=1 would be nice

> LTPLDLIBS should probably be mentioned in doc/build-system-guide.txt

...

> What if we wouldn't print "DIR" (for non-clean targets) and printed relative paths instead?

+1 to all suggestions (including Li's to avoid printing DIR in 3rd commit).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
