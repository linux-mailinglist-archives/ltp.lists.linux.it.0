Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73D184184
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 08:30:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E5AC3C5901
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 08:30:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 47A3D3C58F7
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 08:30:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFE3E601DD4
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 08:30:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F277AC24;
 Fri, 13 Mar 2020 07:30:15 +0000 (UTC)
Date: Fri, 13 Mar 2020 08:30:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200313073013.GB31549@dell5510>
References: <20200312142520.25842-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312142520.25842-1-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] proc01: exclude /proc/nfsd/clients/*/ctl
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

Hi Alexey,

> "ctl" files are write-only, added in Linux 5.3 with this commit
> 89c905beccbb ("nfsd: allow forced expiration of NFSv4 clients")

> Before the patch:
> proc01      1  TFAIL  :  proc01.c:396: read failed: /proc/fs/nfsd/clients/13/ctl: errno=EINVAL(22): Invalid argument
> proc01      0  TINFO  :  /proc/fs/nfsd/unlock_filesystem: known issue: errno=EINVAL(22): Invalid argument
> proc01      0  TINFO  :  /proc/fs/nfsd/unlock_ip: known issue: errno=EINVAL(22): Invalid argument
> ...

> After:
> proc01      0  TINFO  :  /proc/fs/nfsd/clients/13/ctl: known issue: errno=EINVAL(22): Invalid argument
> proc01      0  TINFO  :  /proc/fs/nfsd/unlock_filesystem: known issue: errno=EINVAL(22): Invalid argument
> proc01      0  TINFO  :  /proc/fs/nfsd/unlock_ip: known issue: errno=EINVAL(22): Invalid argument
> ...

> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
