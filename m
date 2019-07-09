Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EEC6342F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 12:24:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CB713C1D06
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 12:24:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2AF353C02C3
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 12:24:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 99EC7100115B
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 12:24:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2557B134;
 Tue,  9 Jul 2019 10:24:31 +0000 (UTC)
Date: Tue, 9 Jul 2019 12:24:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190709102431.GB30251@rei.lan>
References: <20190703154709.20863-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703154709.20863-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/ioctl08: Require btrfs
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
> WARNING: failed to open /dev/btrfs-control, skipping device
> registration: No such file or directory
> safe_macros.c:757: BROK: tst_test.c:752: mount(/dev/loop0, mnt_point,
> btrfs, 0, (nil)) failed: ENODEV
> 
> Cc: Christian Amann <camann@suse.com>
> Reported-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Amir,
> 
> thanks a lot for a report and sorry for longer time to reply (vacation).
> Could you please test it? (I don't have any VM with kernel >= 4.5 && !btrfs).

Looks good to me.

Amir have you had a chance to test this patch?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
