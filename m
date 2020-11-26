Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F682C50F4
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 10:19:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19F9A3C4E1E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 10:19:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 87C813C2246
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 10:19:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 23A661000486
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 10:19:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4841DAE39;
 Thu, 26 Nov 2020 09:19:01 +0000 (UTC)
Date: Thu, 26 Nov 2020 10:19:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201126091953.GA4646@yuki.lan>
References: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
 <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
 <5FBF3A16.6090101@cn.fujitsu.com>
 <CAEemH2c3U7DY70QiVKZoUhdtLdr0QBc+VqAkFt9GzoUp-kmbyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c3U7DY70QiVKZoUhdtLdr0QBc+VqAkFt9GzoUp-kmbyA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> As discussed in the previous mail, it should be accomplished in the current
> release 20200930.
> @Petr Vorel <pvorel@suse.cz>  @Cyril Hrubis <chrubis@suse.cz> what do you
> think?

Unless anybody objects I would go for it. I guess that first step would
be removign CentOS6 from travis.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
