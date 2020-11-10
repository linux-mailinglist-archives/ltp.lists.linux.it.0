Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 058282AD630
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:28:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C92203C5364
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:28:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 22CAD3C2F5A
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:28:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D5AA760010F
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:28:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 023CAAD6D;
 Tue, 10 Nov 2020 12:28:56 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:28:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20201110122854.GA30193@pevik>
References: <20201109191618.4442-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109191618.4442-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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

Hi Kory, Alexey,

> The ping from busybox does not have -f parameter, use -i parameter instead.
> BusyBox does not accept pattern longer than 2 bytes.

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---

> Changes since v1:
>  - Use "-i 0.01 -p aa" parameter instead of "-f"

> Changes since v2:
>  - Use "-i 0.01 -p aa" only in the case of "-f" parameter is not valid

Reviewed-by: Petr Vorel <pvorel@suse.cz>

-i option was added in busybox 1.30 (2 years old), it'd be good to note that in
the commit message.

I have in my TODO list C/shell API helper which would help to verify command
version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
