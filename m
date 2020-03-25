Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EA192E4E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 17:37:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F18D03C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 17:37:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 551503C4BA7
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 17:37:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E07021000543
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 17:37:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29717AB76
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:37:34 +0000 (UTC)
Date: Wed, 25 Mar 2020 17:39:59 +0100
From: Jozef Pupava <jpupava@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200325173959.1de8d9c4@daedruan>
In-Reply-To: <20200325163350.GA11691@yuki.lan>
References: <20200325123403.56628ed7@daedruan>
 <20200325163350.GA11691@yuki.lan>
Organization: SUSE
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Replace deprecated <strings.h> with <string.h>
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 25 Mar 2020 17:33:50 +0100
Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I guess this won't really solve anything, just the issue.  
> 
> Looks okay, but the patch got line-wrapped, possibly by your email
> client.
> 

Ah, yes, sorry I have problems with git send-email so I used client and
forgot about wrapping.

Jozef

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
