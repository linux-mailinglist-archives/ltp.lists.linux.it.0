Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A73836B9FC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 21:28:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D35D73C673F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 21:28:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD1D53C1935
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 21:28:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 541E01400B8F
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 21:28:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 306AFAE72;
 Mon, 26 Apr 2021 19:28:35 +0000 (UTC)
Date: Mon, 26 Apr 2021 21:28:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>
Message-ID: <YIcUYThenEVjYZJa@pevik>
References: <f224defc029816a74c518c54af2fbf2b90a90da6.1619176445.git.jstancek@redhat.com>
 <CAEemH2eieMfag5MDeayoeFTjn+JBuKKk8JB-bLVn6uY_SxUWhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eieMfag5MDeayoeFTjn+JBuKKk8JB-bLVn6uY_SxUWhg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: relax size check
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

Hi Jan, Li,

> On Fri, Apr 23, 2021 at 7:16 PM Jan Stancek <jstancek@redhat.com> wrote:

> > Number of total data blocks in filesystem reported by statfs
> > may be less than current formula of 90%. For example ext4 will
> > subtract "s_first_data_block plus internal journal blocks".

> > With recent change to e2fsprogs, overhead calculated in user-space
> > increased slightly and LTP test started failing:
> >   https://github.com/tytso/e2fsprogs/commit/59037c5357d39c6d0f14a0aff70e67dc13eafc84

> > Since there's no strict rule how much the overhead will be,
> > as rule of thumb relax the condition to 80%.

> > Signed-off-by: Jan Stancek <jstancek@redhat.com>

> Reviewed-by: Li Wang <liwang@redhat.com>

I dared to merge your fix. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
