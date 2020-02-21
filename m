Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFB167FED
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 15:17:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ED3F3C2671
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 15:17:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C1593C057F
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 15:16:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E4137602337
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 15:16:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1660DAC54;
 Fri, 21 Feb 2020 14:16:58 +0000 (UTC)
Date: Fri, 21 Feb 2020 15:16:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200221141656.GA18564@rei>
References: <1579686442-24689-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200127162016.GD30831@rei.lan>
 <6c3adcfb-b3e4-ba8f-d084-a664145c1380@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c3adcfb-b3e4-ba8f-d084-a664145c1380@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/fcntl30: clean up && add more
 range test
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
> > Do we really need this? Looking at the kernel code the fcntl() just
> > reallocates the array that is holding the slots, so we only allocate new
> > array of struct pipe_buffer which contains a pointer for the actuall
> > page that is allocated when we _WRITE_ to the pipe.
> > 
> Yes, you are right. But this case indeed fail when on low memory machine 
> (4kb page size, 256/512M memory).

That's strange, I had a look at the code today again and as far as I can
tell we only check for user ulimit there.

What was the errno when the ioctl() has failed? Was it EPERM or ENOMEM?
The ENOMEM may have happened if the system overcommit was disabled and
the system was out of memory.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
