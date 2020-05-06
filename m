Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE71C75A2
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 18:02:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 460253C57A4
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 18:02:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5C6273C2617
 for <ltp@lists.linux.it>; Wed,  6 May 2020 18:02:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE795600F99
 for <ltp@lists.linux.it>; Wed,  6 May 2020 18:01:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB597B007;
 Wed,  6 May 2020 16:02:03 +0000 (UTC)
Date: Wed, 6 May 2020 18:01:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200506160159.GA23110@dell5510>
References: <20200506134858.23919-1-pvorel@suse.cz>
 <20200506154724.GA19535@dell5510> <20200506155616.GE11352@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506155616.GE11352@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] pty04: Fix build for kernel headers < v4.2-rc1
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > The struct added in 6b6b56cf3 ("pty04: Add SLCAN ldisc and check for CVE-2020-11494") uses
> > uint32_t, kernel version always used __u8. Richie, any reason to use uint32_t
> > instead of uint8_t? I does not fixes the problem, I'm just asking, whether
> > different size affect test coverage.

> > struct can_frame {
> > 	canid_t can_id;
> > 	uint32_t can_dlc;
> > 	uint32_t __pad;
> > 	uint32_t __res0;
> > 	uint32_t __res1;
> > 	uint32_t data[CAN_MAX_DLEN] __attribute__((aligned(8)));
> > };

> > struct can_frame {
> > 	canid_t can_id;  /* 32 bit CAN_ID + EFF/RTR/ERR flags */
> > 	__u8    can_dlc; /* frame payload length in byte (0 .. CAN_MAX_DLEN) */
> > 	__u8    __pad;   /* padding */
> > 	__u8    __res0;  /* reserved / padding */
> > 	__u8    __res1;  /* reserved / padding */
> > 	__u8    data[CAN_MAX_DLEN] __attribute__((aligned(8)));
> > };

> These two structures are for sure incompatible, that should be uint8_t
> instead uint32_t.
OK I'll fix it.
I also add #define CAN_MTU     (sizeof(struct can_frame)), instead of 16 (which
is now correct, but for uint32_t should be 56).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
