Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6CAF8AC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:16:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5C073C2091
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:16:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E33023C061B
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:16:30 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CE89601E03
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:16:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99B83AFFE;
 Wed, 11 Sep 2019 09:16:28 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:16:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: frequent <frequentemail@126.com>
Message-ID: <20190911091626.GA15652@rei.lan>
References: <9146674.351f.16d1e65cf38.Coremail.frequentemail@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9146674.351f.16d1e65cf38.Coremail.frequentemail@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/dup2/dup201.c: buffer overflow detected
 ***: dup201 terminated
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
I've tried to apply the patch but it looks like it has been mangled by
your email client. The patch does not apply and git complains about
incorrect format.

There is some information on email clients and how to make sure they
send the patches in a correct way here:

https://www.kernel.org/doc/html/v4.17/process/email-clients.html

Also the best way is just to learn to use 'git send-email' which works
quite nicely once you learn to use it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
