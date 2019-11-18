Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D85571000D8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 09:59:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95C863C183D
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 09:59:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B631F3C0300
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 09:59:31 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1AD72100195F
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 09:59:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6ECBAAD72;
 Mon, 18 Nov 2019 08:59:29 +0000 (UTC)
Date: Mon, 18 Nov 2019 09:59:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191118085927.GC8415@dell5510>
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
 <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
 <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
 <CAEemH2dPwqX1FtNvF7=hxbAfVMz7i_u+TpUBaU1mqKhY-G0Vig@mail.gmail.com>
 <20191118061634.GA21536@x230>
 <4e9d5014-baea-98ba-c042-a65e5eca64e1@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e9d5014-baea-98ba-c042-a65e5eca64e1@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,
> > I'm for merging this. I just wonder if it's not better to remove $with_bash and
> > $with_python (as part of this patch), if they're not working.
> I think you misunderstood. I did not say, that Bash and Python switches were
> not working,
> just that the dependency of bash and python for realtime tests did not work
> -> it was not a dependency.
> The realtime testsuite could be enabled without bash and python enabled.
I understood :). It's just that this whole Bash and Python switches are meant to
be just for realtime testsuite (therefore completely useless, if they're not
working for the only use). As we generally don't want to depend on either
python nor bash, this switches will be removed sooner or later.
And our autoconf needs more love, it's obscure.
https://github.com/linux-test-project/ltp/issues/508

But ok, it's a separate problem, I'm for merging it as it is.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
