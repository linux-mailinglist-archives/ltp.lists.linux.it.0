Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AE372563
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 07:13:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EDE13C585F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 07:13:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C61003C57F3
 for <ltp@lists.linux.it>; Tue,  4 May 2021 07:13:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 49CED600D72
 for <ltp@lists.linux.it>; Tue,  4 May 2021 07:13:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A3E6AC79;
 Tue,  4 May 2021 05:13:40 +0000 (UTC)
Date: Tue, 4 May 2021 07:13:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YJDYAnOZgAgu5y6A@pevik>
References: <20210429115021.24128-1-xieziyao@huawei.com>
 <YJBJB/S1ThSsNvCk@pevik>
 <CAASaF6w3xihoQRakDsBB52jnTimexy3V6eoj2wVbtT43Yq9iCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6w3xihoQRakDsBB52jnTimexy3V6eoj2wVbtT43Yq9iCQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wrapper function
 to kernel syscall
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> On Mon, May 3, 2021 at 9:03 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Ziyao,

> > > Instead of using the libaio wrapper function, the system call is changed
> > to be invoked via syscall(2).


> I probably missed some discussion. Why are we replacing it with syscall?

you haven't missed anything. io_destroy(ctx) (libaio.h) is being replaced with
raw syscall (tst_syscall(__NR_io_destroy, ctx).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
