Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172434FE12
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 12:31:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ECC33C8A29
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 12:31:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 472533C1A24
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 12:31:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3DFEA1A0112A
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 12:31:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C442AF1F;
 Wed, 31 Mar 2021 10:31:02 +0000 (UTC)
Date: Wed, 31 Mar 2021 12:31:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YGRPZF+DJy/jAZRN@pevik>
References: <20210330130115.26575-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330130115.26575-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for cpio/cpio_tests.sh
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

> In cpio version 2.12 and 2.13,'cpio --help' create is lowercase

> -	if ! cpio --help 2>&1 | grep -q -- '-o.*Create'; then
> +	if ! cpio --help 2>&1 | grep -qi -- '-o.*Create'; then

First, are you talking about cpio implementation [1]
or busybox implementation [2] ?

I suppose cpio, but also busybox had in the past 2.12 and 2.13.
There is no lower case in cpio 2.12 [3] neither in 2.13 [4].

Looking at busybox, I'm not sure how help was printed ([5] [6]), as I'm not able
to install this version (1_13_4 tag is from 2009 - I guess you're not talking about it).

Kind regards,
Petr

[1] https://git.savannah.gnu.org/cgit/cpio.git
[2] https://git.busybox.net/busybox/
[3] https://git.savannah.gnu.org/cgit/cpio.git/tree/src/main.c?h=release_2_12#n101
[4] https://git.savannah.gnu.org/cgit/cpio.git/tree/src/main.c?h=release_2_13#n100
[5] https://git.busybox.net/busybox/tree/archival/cpio.c?h=1_12_stable#n185
[6] https://git.busybox.net/busybox/tree/archival/cpio.c?h=1_13_stable

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
