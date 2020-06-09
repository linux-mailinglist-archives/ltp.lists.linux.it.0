Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CC1F47A0
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 21:58:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 331923C2314
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 21:58:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 92EE13C2024
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 21:58:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 84ACC60082D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 21:58:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C8FAAA6F;
 Tue,  9 Jun 2020 19:58:57 +0000 (UTC)
Date: Tue, 9 Jun 2020 21:58:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <20200609195851.GA29515@x230>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
 <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Shuah,

...
> > I don't have any particular comments.
> > I assume Richard tested it and it works. if so, it's fine with me :)
> > I don't have any concrete plans to use this at the moment. We have a
> > corpus of reproducers in syzkaller format and we can run these. This
> > should be more useful for kernel continuous integration systems and
> > distro testing.

> Right. That is what I was thinking that this is more relevant for kernel
> developers, CI and distros.

> Richard, Please send the patch for linux-arts to me once Petr gives it a
> try and I will apply it.
NOTE: this patch is for LTP. But maybe I miss something (some other patch for
linux-arts I overlooked).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
