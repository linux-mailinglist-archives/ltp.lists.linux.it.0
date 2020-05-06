Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA81C7549
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:47:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 214B53C57B0
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:47:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D7F483C2610
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:47:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5FEC61000B3A
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:47:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4ABE4ADAB;
 Wed,  6 May 2020 15:47:29 +0000 (UTC)
Date: Wed, 6 May 2020 17:47:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200506154724.GA19535@dell5510>
References: <20200506134858.23919-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506134858.23919-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

The struct added in 6b6b56cf3 ("pty04: Add SLCAN ldisc and check for CVE-2020-11494") uses
uint32_t, kernel version always used __u8. Richie, any reason to use uint32_t
instead of uint8_t? I does not fixes the problem, I'm just asking, whether
different size affect test coverage.

struct can_frame {
	canid_t can_id;
	uint32_t can_dlc;
	uint32_t __pad;
	uint32_t __res0;
	uint32_t __res1;
	uint32_t data[CAN_MAX_DLEN] __attribute__((aligned(8)));
};

struct can_frame {
	canid_t can_id;  /* 32 bit CAN_ID + EFF/RTR/ERR flags */
	__u8    can_dlc; /* frame payload length in byte (0 .. CAN_MAX_DLEN) */
	__u8    __pad;   /* padding */
	__u8    __res0;  /* reserved / padding */
	__u8    __res1;  /* reserved / padding */
	__u8    data[CAN_MAX_DLEN] __attribute__((aligned(8)));
};

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
