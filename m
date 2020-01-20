Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A74142B79
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:04:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D2423C2350
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:04:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D22C93C2266
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:04:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5611260046D
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:04:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D3AAB121;
 Mon, 20 Jan 2020 13:04:51 +0000 (UTC)
Date: Mon, 20 Jan 2020 14:04:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200120130449.GA615@dell5510>
References: <20200117113715.22786-1-pvorel@suse.cz>
 <20200117113715.22786-3-pvorel@suse.cz>
 <20200120103108.GA15405@dell5510>
 <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
 <20200120120309.GA24136@dell5510>
 <0409fc38-c432-e2f1-309e-f506826416d3@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0409fc38-c432-e2f1-309e-f506826416d3@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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

> On 1/20/20 1:03 PM, Petr Vorel wrote:
> > But none of lapi/syscalls.h use is in the API headers (only in API C and tests)

> And you could avoid #including lapi/syscalls.h in API headers by simply
> moving the implementation of tst_dev_sync() to lib/tst_device.c.

> Why do you guys use static inline functions so much anyway? There are no
> technical reasons to do that except for default main().

+1. I still think it's not good to include lapi/syscalls.h even it does not
break anything. I'll send a patch which uses tst_syscall in socketcall01.c and
second commit which moves tst_dev_sync() to lib/tst_device.c.
It's up to you if agree on second one.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
