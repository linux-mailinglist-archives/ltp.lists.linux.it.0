Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD68116A038
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 09:40:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27EF83C2675
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 09:40:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 57D543C1414
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 09:40:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6814D1400265
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 09:40:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52B28ACCA;
 Mon, 24 Feb 2020 08:40:02 +0000 (UTC)
Date: Mon, 24 Feb 2020 09:40:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200224084000.GA29280@dell5510>
References: <20200208092014.24824-1-liwang@redhat.com>
 <20200218162739.GA9985@rei.lan> <20200221121618.GA16421@dell5510>
 <CAEemH2ftLanZppq4kiVCK7JuRvCh+xX4GG9--GKrOQ8j8c2idw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ftLanZppq4kiVCK7JuRvCh+xX4GG9--GKrOQ8j8c2idw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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

> > > If you agree with this change I can change it before applying.
> > Merged both patches with this change and my docs change.

> Thanks very much Petr. Btw, I added a commit to remove the surplus variable
> 'mem_avail'.(It's a tiny issue so I pushed directly:)
Thanks for fixing it and sorry for not amending your commit correctly.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
