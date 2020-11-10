Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2F2AD953
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 15:55:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34C463C6057
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 15:55:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0C7FB3C0752
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 15:55:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7CBD100035C
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 15:55:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0769ACF5;
 Tue, 10 Nov 2020 14:54:59 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:54:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201110145458.GA13043@pevik>
References: <20201109191618.4442-1-kory.maincent@bootlin.com>
 <20201110122854.GA30193@pevik> <20201110123616.GA31347@pevik>
 <48e1bd71-021d-d405-fd67-c35dcd8b53e2@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48e1bd71-021d-d405-fd67-c35dcd8b53e2@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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

Hi Kory, Alexey,

> On 10.11.2020 15:36, Petr Vorel wrote:
> > Hi Kory, Alexey,

> >> -i option was added in busybox 1.30 (2 years old), it'd be good to note that in
> >> the commit message.
> > Actually, maybe also test -i option and if even -i not working run?

> > tst_brk TCONF "unsupported ping version (old busybox?)"

> Hi Petr,

> What if it failed for some other reason, it would be a wrong assumption
> that ping doesn't support -i...
Yep, that'd be bad.
Thus maybe just check
$PING 2>&1 |grep -q -- -i

in case of busybox?

If you don't like it, at least put tst_res TINFO message in case of busybox.
(but I'd prefer this check).

And maybe move $ping_opts and this check to setup.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
