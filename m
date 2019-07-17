Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA56B855
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:36:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEFDC3C1D1E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:36:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 49DC33C1CA0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:36:06 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9265F1A00F4A
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:36:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56D8F368FF;
 Wed, 17 Jul 2019 08:36:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFCC5DA34;
 Wed, 17 Jul 2019 08:36:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D50118089C8;
 Wed, 17 Jul 2019 08:36:02 +0000 (UTC)
Date: Wed, 17 Jul 2019 04:36:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Message-ID: <1984233025.591567.1563352562020.JavaMail.zimbra@redhat.com>
In-Reply-To: <1563267862-42483-2-git-send-email-hongzhi.song@windriver.com>
References: <1563267862-42483-1-git-send-email-hongzhi.song@windriver.com>
 <1563267862-42483-2-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.16]
Thread-Topic: getrlimit03: adjust a bit of code to compatiable with mips32
Thread-Index: u0j2aDvVz7bB92SPKRIon3yWboggMA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 17 Jul 2019 08:36:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrlimit03: adjust a bit of code to compatiable
 with mips32
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



----- Original Message -----
> Error info:
> getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
> ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
> 
> According to kernel code: [arch/mips/include/uapi/asm/resource.h]
> RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
> 
>  /*
>  * SuS says limits have to be unsigned.
>  * Which makes a ton more sense anyway,
>  * but we keep the old value on MIPS32,
>  * for compatibility:
>  */
>  #ifndef __mips64
>  # define RLIM_INFINITY      0x7fffffffUL
>  #endif
> 
> Adding conditional statement about mips to fix this.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>

Pushed.

Thanks,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
