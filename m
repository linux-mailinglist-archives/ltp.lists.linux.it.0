Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6C7BAAF
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:27:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F0AC3C1D49
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:27:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 98ECF3C194D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:27:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A2FC602285
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:27:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD8E1AC9A;
 Wed, 31 Jul 2019 07:27:45 +0000 (UTC)
Date: Wed, 31 Jul 2019 09:27:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190731072744.GA9043@x230>
References: <20190731063320.4898-1-pvorel@suse.cz>
 <CAEemH2f5XQZw-1hP7ffNYFUtPcBW7TujgkGjN5T0NBa5gnx_AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f5XQZw-1hP7ffNYFUtPcBW7TujgkGjN5T0NBa5gnx_AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] zram01: Fix division by 0
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > +       if [ $used_mem -eq 0 ]; then
> > +               tst_resm TBROK "no memory used by zram"
> > +               return
> > +       fi

> Why not use tst_brkm directly? Otherwise looks good to me.
Make sense.
Thanks for your ack, lets wait for Alexey.

I wonder how this can happen (found occasionally on ppc64le).

If this happen than zram02 and zram03 fails on timeout:
/opt/ltp/testcases/bin/zram_lib.sh: line 38: echo: write error: Device or resource busy
zram03      1  TBROK  :  safe_file_ops.c:301: Failed to close FILE '/sys/block/zram0/disksize' at zram03.c:87: errno=EBUSY(16): Device or resource busy

Maybe some timeout would help, need to look into it.

Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
