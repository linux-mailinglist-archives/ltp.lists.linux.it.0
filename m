Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E82A7EBE
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:37:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B143A3C2FE1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:37:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9543E3C08DA
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:37:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 395AE1A007E3
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:37:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86600ACF1;
 Thu,  5 Nov 2020 12:37:05 +0000 (UTC)
Date: Thu, 5 Nov 2020 13:37:51 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <20201105123751.GB10395@yuki.lan>
References: <1604575034-17799-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604575034-17799-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] sycalls: select03: Make nfds use the correct
 value
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
> When running select03 with runltp in /opt/ltp, this case failed as below:
> select03.c:52: TFAIL: Invalid readfds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid writefds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid exceptfds: select() passed unexpectedly with 0

Also I do not get how runltp changes the test behavior, does ltp-pan
leak file descriptors? If so it should be fixed to open files with
O_CLOEXEC.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
