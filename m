Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF8993EF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 14:37:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C9A83C1D68
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 14:37:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5210C3C1CF4
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 14:37:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A74BE600666
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 14:37:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E300C04BD33;
 Thu, 22 Aug 2019 12:37:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F7D60600;
 Thu, 22 Aug 2019 12:37:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA7F61802216;
 Thu, 22 Aug 2019 12:37:47 +0000 (UTC)
Date: Thu, 22 Aug 2019 08:37:47 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <1053175586.7790160.1566477467514.JavaMail.zimbra@redhat.com>
In-Reply-To: <145293056.7577705.1566403293117.JavaMail.zimbra@redhat.com>
References: <1566376044-175216-1-git-send-email-zhe.he@windriver.com>
 <145293056.7577705.1566403293117.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.133, 10.4.195.1]
Thread-Topic: Fix kernel symbol finding for meltdown case
Thread-Index: jStTc6XK2ImYjkh4Ai6zsGE/7IWtxISQavs/
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 22 Aug 2019 12:37:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cve: Fix kernel symbol finding for meltdown
 case
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
> 
> 
> ----- Original Message -----
> > From: He Zhe <zhe.he@windriver.com>
> > 
> > meltdown case fails as below.
> > safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272
> > 
> > find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
> > /boot/System.map-%s. Currently if the symbol is not found in
> > /proc/kallsyms,
> > when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
> > immediately due to SAFE_FILE_LINES_SCANF.
> > 
> > This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol second
> > chance.
> 
> That explains it, thanks for the patch.
> 
> We should also tweak TCONF condition in find_kernel_symbol - no need
> to re-post for that, I can add that.

Pushed, also with tweak for commit 7709d2ae92ea, so we try System.map,
even if kallsyms are completely disabled.

Regards,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
