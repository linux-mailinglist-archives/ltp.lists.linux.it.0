Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374A30897C
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 15:17:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1355E3C5E4E
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 15:17:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E8DE03C2959
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 15:17:18 +0100 (CET)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 70C356008B8
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 15:17:18 +0100 (CET)
X-Originating-IP: 78.113.208.92
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net
 [78.113.208.92]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 203C5E0010;
 Fri, 29 Jan 2021 14:17:16 +0000 (UTC)
Date: Fri, 29 Jan 2021 15:17:15 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210129151715.2a865703@kmaincent-XPS-13-7390>
In-Reply-To: <YBQR50ltZa+d1Or7@pevik>
References: <20210129090759.16534-1-kory.maincent@bootlin.com>
 <YBQR50ltZa+d1Or7@pevik>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sctp/func_test: add check on the sctp driver
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Fri, 29 Jan 2021 14:47:19 +0100
Petr Vorel <pvorel@suse.cz> wrote:

> Hi Kory,
> 
> > +	if (tst_check_driver("sctp"))
> > +		tst_brkm(TCONF, tst_exit, "sctp driver not available");  
> Using tst_check_driver requires #include "tst_kernel.h".

Weird I did not get any build error and the binaries are built.
Maybe Yocto manage to build it even without the include.
Sorry for that.

Regards,

Kory

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
