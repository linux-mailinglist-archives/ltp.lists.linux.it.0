Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6CB12FE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 18:47:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2225F3C1823
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 18:47:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8F25D3C0358
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 18:47:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4CB461F74C
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 18:47:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47EE7ABB1;
 Thu, 12 Sep 2019 16:47:21 +0000 (UTC)
Message-ID: <1568306840.3621.32.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, Cristian Marussi <cristian.marussi@arm.com>
Date: Thu, 12 Sep 2019 18:47:20 +0200
In-Reply-To: <20190912152820.GB1064@dell5510>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
 <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
 <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
 <20190912152820.GB1064@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2019-09-12 at 17:28 +0200, Petr Vorel wrote:
> Hi,
> 
> LTP_TIMEOUT_MUL is only for user, LTP_TIMEOUT_MUL_MIN is only for
> library.
> It's similar to way which is used in virt_lib.sh
> (VIRT_PERF_THRESHOLD_MIN).

Agree that LTP_TIMEOUT_MUL is for the user and the initial timeout
value comes from library.
I only say, that a LTP_TIMEOUT_MUL_MIN isn't needed from my
perspective, if we allow to set a absolute timeout value like
TST_TIMEOUT (as we already do in c). Because it has the same effect,
setting a minimum timeout value which the user cannot reduce.


> See
> https://patchwork.ozlabs.org/patch/1155460/
> 
> I'll probably sent this patch today although so you can base the work
> on it.
> Is that ok?
sure it is.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
