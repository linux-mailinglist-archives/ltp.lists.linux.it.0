Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56376328296
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 16:35:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC7473C0BCB
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 16:35:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A488A3C0BCB
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 16:35:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2A49B1000A37
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 16:35:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67945AF54;
 Mon,  1 Mar 2021 15:35:51 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:35:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YD0J1eQ162gmyd4C@pevik>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-4-pvorel@suse.cz> <YD0AUrSXxGabE+jB@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD0AUrSXxGabE+jB@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/6] zram: Move zram_compress_alg() to zram02.sh
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

Hi Cyril,

> Hi!
> > Quit at setup in case there is no fs support (change in previous commit)
> > can lead to skipping zram_compress_alg(). Move to zram02.sh where is no
> > such limitation.

> Actually I think that we should keep it in both for now, since the tests
> do depend on each other, the zram_fill_fs actually checks compression
> ration, which only makes sense if compression is enabled.
Makes sense.

> Ideally we should use different compression algorithms in the zram01
> test, so I guess that we can, later on distribute the compression
> algorithms between the created devices, but that shouldn't stop this
> patchset.
OK. I'll change this patchset to *add* zram_compress_alg() to zram02.sh (keep it
in zram01.sh) and update following commit.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
