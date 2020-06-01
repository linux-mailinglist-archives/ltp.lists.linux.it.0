Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 075081EA59E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 16:16:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46BEC3C30C7
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 16:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D845D3C308B
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 16:16:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6ED73600A59
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 16:15:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92A47B33C;
 Mon,  1 Jun 2020 14:16:02 +0000 (UTC)
Date: Mon, 1 Jun 2020 16:16:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200601141620.GB8417@yuki.lan>
References: <CA+G9fYvU3g1HqOT8UbNBzXCjCD7Ot1pAFjv-8PGee9ObdbYksg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvU3g1HqOT8UbNBzXCjCD7Ot1pAFjv-8PGee9ObdbYksg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] i386: fanotify01.c:115: BROK: fanotify_mark () failed:
 EFAULT (14)
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
Cc: Jan Kara <jack@suse.cz>, lkft-triage@lists.linaro.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> fanotify01.c:115: BROK: fanotify_mark (6, FAN_MARK_ADD, FAN_ACCESS |
> FAN_MARK_INODE | FAN_MODIFY | FAN_CLOSE | FAN_OPEN, AT_FDCWD,
> fs_mnt/tfile_19115) failed: EFAULT (14)

Looking at these failures we do not pass anything that may cause EFAULT,
the only pointer we pass is the path at the end but that thing is null
terminated properly. In a case of fanotify09.c it's even constant string.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
