Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34A2AADB7
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Nov 2020 22:43:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EC2C3C2F8B
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Nov 2020 22:43:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 76B7D3C2360
 for <ltp@lists.linux.it>; Sun,  8 Nov 2020 22:43:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D7696140042E
 for <ltp@lists.linux.it>; Sun,  8 Nov 2020 22:43:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9D30ABB2;
 Sun,  8 Nov 2020 21:43:07 +0000 (UTC)
Date: Sun, 8 Nov 2020 22:43:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201108214306.GA115861@pevik>
References: <20201016112441.4838-1-pvorel@suse.cz>
 <CAOQ4uxixzOtXjyVTUNR03ffJHgTQCm5+L46zNNgdxvB0n9ZuhA@mail.gmail.com>
 <20201020070017.GA4263@dell5510>
 <CAOQ4uxgAk_k8de0XTewYoFKYYr2Ykpe3Ww5vy7Xfqy9hbUb7VA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgAk_k8de0XTewYoFKYYr2Ykpe3Ww5vy7Xfqy9hbUb7VA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify16: Introduce SAFE_FANOTIFY_MARK()
 macro
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> On Tue, Oct 20, 2020 at 10:00 AM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Amir,

> > thanks for your suggestions, I'll send v2 shortly.
> > I've been thinking about it for a while and agree it's better to simplify
> > safe_fanotify_mark() hints.
> > I'll also separate fixes into more commits to be more readable.


> Hi Petr,

> I guess v2 got delayed,
Yes, I'm sorry. While being in the middle of the work, but higher priority work
arrived :). I'll try to get to v2 soon, but just let me know if it block you and
you're going to implement the cleanup yourself.

> so while at it let me ask -
> Did you maybe consider also moving the checks for
> "FAN_REPORT_FID not supported in kernel?" and
> "FAN_REPORT_NAME not supported in kernel?"
> into safe_fanotify_init()?
Sure.

> The reason I am asking is because I am working on adding a test case
> to fanotify09 [1], which involves converting SAFE_FANOTIFY_INIT()
> to fanotify_init(), due to pottenitally unsupported init flags in the kernel.
I see, third patch.

Kind regards,
Petr

> Thanks,
> Amir.

> [1] https://github.com/amir73il/ltp/commits/fsnotify-fixes

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
