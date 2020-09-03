Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C325C220
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 16:03:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB8213C54EA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 16:03:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 59AFB3C2D45
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 16:03:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B2149200CE2
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 16:03:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E86A8AB7D
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 14:03:31 +0000 (UTC)
Date: Thu, 3 Sep 2020 16:03:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200903140329.GA1002@dell5510>
References: <20200825160735.24602-1-mdoucha@suse.cz>
 <20200825160735.24602-5-mdoucha@suse.cz>
 <20200902171717.GC26811@dell5510>
 <4c6dce78-8801-0ff2-43e5-7d518d79fdf9@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c6dce78-8801-0ff2-43e5-7d518d79fdf9@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] ioctl_sg01: Loop data leak check 100 times
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

> On 02. 09. 20 19:17, Petr Vorel wrote:
> > BTW do I understand the test correctly: we expect ioctl() return -1 because we
> > use uninitialized command[CMD_SIZE] in query.cmdp (as the requirement for empty
> > command in kernel commit message)?

> command[CMD_SIZE] is initialized to 0 which is the SCSI command TEST
> UNIT READY. We expect ioctl() to return 0 but also ignore -1 because the
> only thing we really care about are the contents of query.dxferp buffer.
> If ioctl() fails for some legitimate reason but kernel still fills the
> buffer with private data, we need to report that the CVE is present.
Thanks for info, Martin.

Kind regards,
Petr

> https://en.wikipedia.org/wiki/SCSI_command

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
