Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0CA308963
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 14:47:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AFCC3C77FB
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 14:47:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6EE203C5A1F
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 14:47:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1FBFA1000F35
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 14:47:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CBC0AC41;
 Fri, 29 Jan 2021 13:47:21 +0000 (UTC)
Date: Fri, 29 Jan 2021 14:47:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <YBQR50ltZa+d1Or7@pevik>
References: <20210129090759.16534-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129090759.16534-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory,

> +	if (tst_check_driver("sctp"))
> +		tst_brkm(TCONF, tst_exit, "sctp driver not available");
Using tst_check_driver requires #include "tst_kernel.h".

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
