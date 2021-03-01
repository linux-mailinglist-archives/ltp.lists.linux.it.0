Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F303282C3
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 16:46:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 749403C7E13
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 16:46:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D90563C575A
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 16:46:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7CE6B1000796
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 16:46:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A94DAB115;
 Mon,  1 Mar 2021 15:46:42 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:48:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YD0MvpaWz7gTjp9V@yuki.lan>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-7-pvorel@suse.cz> <YBRroFhaxdqCLv2i@pevik>
 <YD0EuJtWxhis24ZX@yuki.lan> <YD0LMzlHtms7WYEi@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD0LMzlHtms7WYEi@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/6] zram: Increase timeout according to used
 devices
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
> > I would still prefer if we had a timeout there, -1 is for something that
> > cannot be predicted.
> 
> > Also we do not expect machine to be heavily loaded, in that case half of
> > LTP tests would time out.
> 
> > So I would just measure how long the test takes, then multiply it by 5
> > or something like that and put that in as a timeout.
> Do you mean to use high enough static timeout defined before startup (working
> for maximum possible filesystems)? And create tst_set_timeout() for shell as
> independent effort?

I would do:

* Add tst_set_timeout for shell, so that it mirrors the C API

* Measure runtime of the test divide it by the number of supported
  filesystems, that way we would get mean runtime per filesystem

  now I would multiply this number with arbitrary constantm, e.g. 5 or
  even more, this is now timeout per iteration

  with this number the actuall timeout would be:

  number_of_filesystems * mean_max_per_run


Does this sound sane?

I guess that in the end we will end up with something similar what you
had there, but we would have some data that supports this decision.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
