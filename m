Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34C10D380
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 10:55:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 615143C2284
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 10:55:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8503D3C2078
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 10:55:20 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 230FB6023F6
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 10:55:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FD11ACE3;
 Fri, 29 Nov 2019 09:55:19 +0000 (UTC)
Date: Fri, 29 Nov 2019 10:55:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191129095517.GA30496@dell5510>
References: <20191128045525.15454-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128045525.15454-1-liwang@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mtest01: correct the ALLOC_THRESHOLD definition
 on s390x
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

Hi Li,

> mtest01 hits a problem on s390x platform. The situation is that if children's
> memory allocating is ongoing and the test remaining time is in an emergency, the
> parent will break from the while loop and try to revoke children, obviously, it
> doesn't have enough time to wait for the children's status change to 'T'. Then it
> occurs timeout issue as below:

>   mtest01.c:134: INFO: Filling up 80% of free ram which is 5868864 kbytes
>   mtest01.c:149: INFO: ... child 38289 starting
>   mtest01.c:149: INFO: ... child 38288 starting
>   mtest01.c:208: WARN: the remaininig time is not enough for testing
>   mtest01.c:218: FAIL: kbytes allocated (and written to) less than expected 5868864
>   Test timeouted, sending SIGKILL!

> The immediate cause is the memory allocating is too slow to finish fleetly on such
> a small virtual s390x machine, because ALLOC_THRESHOLD does not take real effort.
> Here let's correct the allocating threshold definition to make sure each child
> allocates less memory.

> And, another fix for the fail handling. In case children are still on memory
> allocating, the remaining 15 seconds is not enough to wait for process status
> change. We kill them directly to avoid test timeout occurring.

> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Rachel Sibley <rasibley@redhat.com>

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
