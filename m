Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4A2B0B77
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:43:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9D753C6018
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 18:43:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 95F553C5FE0
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:43:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 547096009BE
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 18:43:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D1DDAEA3
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 17:43:42 +0000 (UTC)
Date: Thu, 12 Nov 2020 18:43:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201112174341.GB29575@pevik>
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201112142146.GA19824@yuki.lan>
 <2c091ecd-af38-2569-5fd4-a1f3e3458a01@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c091ecd-af38-2569-5fd4-a1f3e3458a01@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] Add tst_secureboot_enabled() helper
 function
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

> On 12. 11. 20 15:21, Cyril Hrubis wrote:
> > Hi!
> > I've looked into the library and what it actually does in this case is
> > that it opens a sysfs file and reads a few bytes from there. I guess
> > that we can even avoid linking the library in this case, since we just
> > want to know a value of the single bit in the SecureBoot file.

> > The full path is:

> > /sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c

> Yes, we could read the sysfile directly. But do we want to deal with
> potential compatibility issues and test breakage if the UEFI vars API
> changes in the future? The binary format of those sysfiles is controlled
> by the UEFI Forum, not by kernel devs. The efivars library is available
> on basically all modern distros and we most likely won't do any
> SecureBoot tests on distros that don't have it.

I also don't see a big deal to use the efivars library.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
