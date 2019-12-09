Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C03311777F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 21:34:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02A4B3C2352
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 21:34:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 76CD23C03E8
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 21:34:03 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2CE22602079
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 21:34:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F2E9ACA0;
 Mon,  9 Dec 2019 20:34:02 +0000 (UTC)
Date: Mon, 9 Dec 2019 21:34:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191209203401.GA2426018@x230>
References: <1575447166-7813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191209074206.GA2373112@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209074206.GA2373112@x230>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Remove duplicated ".needs_tmpdir=1" when using
 equivalent flags
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

Hi Xu,

> > From ltp library code, when we have used these flags(".needs_device"
> > ".mntpoint" ".resource_file" ".needs_checkpoints" ".format_device"
> > "mount_device" ".all_filesystems"), we don't need to set ".needs_tmpdir=1".
> > So remove it.

Patch for shell API (should be merged only if we agree on this one).
https://patchwork.ozlabs.org/patch/1206651/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
