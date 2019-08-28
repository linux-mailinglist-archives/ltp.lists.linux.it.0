Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD579FF35
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:15:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70C043C1D24
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:15:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5C4D93C1CE4
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:15:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8761D6024F7
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:15:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDC5DAC26;
 Wed, 28 Aug 2019 10:15:02 +0000 (UTC)
Message-ID: <1566987302.6539.21.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Jan Stancek <jstancek@redhat.com>
Date: Wed, 28 Aug 2019 12:15:02 +0200
In-Reply-To: <2001459109.8602383.1566978371578.JavaMail.zimbra@redhat.com>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
 <1566977183.6539.10.camel@suse.de>
 <2001459109.8602383.1566978371578.JavaMail.zimbra@redhat.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/4] Basic eBPF tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2019-08-28 at 03:46 -0400, Jan Stancek wrote:
> ----- Original Message -----
> > On Mon, 2019-08-26 at 10:29 -0400, Jan Stancek wrote:
> > > 
> > > ----- Original Message -----
> > > > I've ended up playing with the patchset and fixed a few loose
> > > > ends
> > > > on
> > > > the map test and as I had the code at hand I decided to send v4
> > > > instead
> > > > of pointing out the mistakes in a review.
> > > > 
> > > > There were numerous small changes for the map test:
> > > > 
> > > > * Make sure the key buffer is sized exactly for the content
> > > > 
> > > > * Initialized the array/hash element value in test setup
> > > > 
> > > > * Made the code flow a bit more obvious, it was hard to tell
> > > > which
> > > >   part was run for n == 0 and which for n == 1
> > > > 
> > > > Also it looks that for me the test that loads the eBPF program
> > > > ends
> > > > up
> > > > with EPERM randomly at about 10th iteration both as
> > > > unpriviledged
> > > > and
> > > > priviledged user, which is really strange.
> > > 
> > > There's one EPERM I can reproduce reliably with bpf_map test,
> > > which
> > > appears
> > > to originate from "bpf_charge_memlock".
> > > 
> > > There's a deferred component to map freeing, and unchange appears
> > > to
> > > be part of it:
> > >   bpf_map_release
> > >     bpf_map_put
> > >       INIT_WORK(&map->work, bpf_map_free_deferred);
> > >         (deferred) bpf_uncharge_memlock
> > > 
> > > When I lower max locked memory, it's easy to hit:
> > > # ulimit  -l 128; ./bpf_map01 -i 100
> > > ...
> > > bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this
> > > system:
> > > EPERM
> > > 
> > > Can you try bumping max locked memory to some high value and
> > > check
> > > if that helps your case?
> > 
> > # for i in 64 128 256 1024; do
> >     echo $i;
> >     ulimit -l $i;
> >     ./bpf_prog01 -i 100 |& grep -P 'passed|CONF';
> > done
> > 
> > 64
> > CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > passed   16
> > 
> > 128
> > CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > passed   16
> > 
> > 256
> > CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > passed   32
> > 
> > 1024
> > CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > passed   192
> > 
> > 
> > Which produce almost the same results.
> > Same approach with `bpf_map01` differs a lot. Sometimes all pass,
> > sometimes none.
> 
> Seems to make difference for me on 5.2:
> 
> # cat bench.sh; sh bench.sh 
> for i in 128 256 512 1024 4096 65536; do
>         echo $i;
>         ulimit -l $i;
>         ./bpf_prog01 -i 100 |& grep -P 'passed|CONF';
>         sleep 4;
> done
> 
> 128
> bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> EPERM
> passed   32
> 256
> bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> EPERM
> passed   64
> 512
> bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> EPERM
> passed   128
> 1024
> passed   200
> 4096
> passed   200
> 65536
> passed   200
> 

I ran it again and now my results looks like yours...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
