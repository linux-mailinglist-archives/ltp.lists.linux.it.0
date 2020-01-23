Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91C146858
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:47:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 806B73C24C1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 13:47:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 028AA3C2499
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:47:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DA079601F67
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:47:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1354AC84;
 Thu, 23 Jan 2020 12:47:11 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:47:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200123124711.GF27845@rei>
References: <1577269768-30118-1-git-send-mail-xuyang2018.jy@cn.fujitsu.com>
 <1578365634-19825-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200110133746.GB14140@rei.lan>
 <90d369da-1340-d919-e9e5-f819d028daf9@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90d369da-1340-d919-e9e5-f819d028daf9@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/pipe12: add new test for pipe when
 write bytes > PIPE_BUF
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
> > 		Here as well, write is supposed to return the number of
> > 		bytes written so in this case the TST_RET must be
> > 		max_size - tcase->offset which is all we have to check
> > 		for, anything else than that means failure.
> I have seen pipe_write kernel code[1], it only merged small size write 
> but not large size write(large size write will still page-align size, in 
> other word, it uses new page). So, I think it is why man-pages said 
> "from 1 to n bytes may be written". It may exist a hole when we use a 
> unalign offset and the sequent align-page write. I think it is normal 
> and don't need to mean failure.  "TST_RET is max_size - tcase->offset" 
> is ok when we use [0,N*page_size-1] [page_size,page_buf-1] write or 
> [0,a-1] [a, page_buf-1] write.
> 
> The other reason for it I guess beacause looking for a hole  may drop 
> peformance when pipe buf is large.
> 
> Also, we can print write btyes by ioctl(fd, FIONREAD, &nbytes) command
> (cover this ioctl test point).

Okay, I see that we merge only if the write fits into the free space in
the current head in the right buffer. Which means that we may write less
than max pipe size if we do not write in page aligned chunks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
