Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3799FC27
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 09:46:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700D33C1D1D
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 09:46:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AA75D3C1C95
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 09:46:15 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 201011A01D02
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 09:46:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F050F87638;
 Wed, 28 Aug 2019 07:46:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D5D6060D;
 Wed, 28 Aug 2019 07:46:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF71125540;
 Wed, 28 Aug 2019 07:46:11 +0000 (UTC)
Date: Wed, 28 Aug 2019 03:46:11 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: cfamullaconrad@suse.com
Message-ID: <2001459109.8602383.1566978371578.JavaMail.zimbra@redhat.com>
In-Reply-To: <1566977183.6539.10.camel@suse.de>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
 <1566977183.6539.10.camel@suse.de>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.161, 10.4.195.11]
Thread-Topic: Basic eBPF tests
Thread-Index: JsTwvk0g72Y7x9c/qNCT07alNizhiQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 28 Aug 2019 07:46:12 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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


----- Original Message -----
> On Mon, 2019-08-26 at 10:29 -0400, Jan Stancek wrote:
> > 
> > ----- Original Message -----
> > > I've ended up playing with the patchset and fixed a few loose ends
> > > on
> > > the map test and as I had the code at hand I decided to send v4
> > > instead
> > > of pointing out the mistakes in a review.
> > > 
> > > There were numerous small changes for the map test:
> > > 
> > > * Make sure the key buffer is sized exactly for the content
> > > 
> > > * Initialized the array/hash element value in test setup
> > > 
> > > * Made the code flow a bit more obvious, it was hard to tell which
> > >   part was run for n == 0 and which for n == 1
> > > 
> > > Also it looks that for me the test that loads the eBPF program ends
> > > up
> > > with EPERM randomly at about 10th iteration both as unpriviledged
> > > and
> > > priviledged user, which is really strange.
> > 
> > There's one EPERM I can reproduce reliably with bpf_map test, which
> > appears
> > to originate from "bpf_charge_memlock".
> > 
> > There's a deferred component to map freeing, and unchange appears to
> > be part of it:
> >   bpf_map_release
> >     bpf_map_put
> >       INIT_WORK(&map->work, bpf_map_free_deferred);
> >         (deferred) bpf_uncharge_memlock
> > 
> > When I lower max locked memory, it's easy to hit:
> > # ulimit  -l 128; ./bpf_map01 -i 100
> > ...
> > bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> > EPERM
> > 
> > Can you try bumping max locked memory to some high value and check
> > if that helps your case?
> 
> # for i in 64 128 256 1024; do
>     echo $i;
>     ulimit -l $i;
>     ./bpf_prog01 -i 100 |& grep -P 'passed|CONF';
> done
> 
> 64
> CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> passed   16
> 
> 128
> CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> passed   16
> 
> 256
> CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> passed   32
> 
> 1024
> CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> passed   192
> 
> 
> Which produce almost the same results.
> Same approach with `bpf_map01` differs a lot. Sometimes all pass,
> sometimes none.

Seems to make difference for me on 5.2:

# cat bench.sh; sh bench.sh 
for i in 128 256 512 1024 4096 65536; do
        echo $i;
        ulimit -l $i;
        ./bpf_prog01 -i 100 |& grep -P 'passed|CONF';
        sleep 4;
done

128
bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
passed   32
256
bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
passed   64
512
bpf_prog01.c:114: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
passed   128
1024
passed   200
4096
passed   200
65536
passed   200

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
