Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 787485B98D6
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 12:32:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91A6E3CAC15
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 12:32:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA4453C0475
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 12:32:51 +0200 (CEST)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D27FE600298
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 12:32:47 +0200 (CEST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 28FAWaZi042458;
 Thu, 15 Sep 2022 18:32:36 +0800 (+08)
 (envelope-from dylan@andestech.com)
Received: from atcsi01 (10.0.15.167) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Sep 2022 18:32:35 +0800
Date: Thu, 15 Sep 2022 18:32:35 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YyL/QxV+D0ei0vGX@atcsi01>
References: <20220914131950.1783054-1-dylan@andestech.com>
 <YyLpUMPMlGoXjwls@yuki> <YyL4cqTctXZ4TMmt@atcsi01>
 <YyL5w+DzuI7U06Td@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyL5w+DzuI7U06Td@yuki>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Originating-IP: [10.0.15.167]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 28FAWaZi042458
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel/uevent: Adjust the number of uevents
 dynamically in uevent02
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
Cc: "Mina Hui-Min Chou\(\(\(\(\(\(\(\)" <minachou@andestech.com>,
 "x5710999x@gmail.com" <x5710999x@gmail.com>,
 "Charles Ci-Jyun Wu\(\(\(\(\(\(\(\)" <dminus@andestech.com>,
 "Alan Quey-Liang Kao\(\(\(\(\(\(\(\)" <alankao@andestech.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Oh, i got it!!! Sorry for the misunderstanding.
I thought this was talking about adding the .needs_kconfigs property.
I will add setup() function in v2 patch.

And about the adjustment of uevent declaration, any comments that I can
do in v2 patch?

Best,
Dylan

On Thu, Sep 15, 2022 at 06:09:07PM +0800, Cyril Hrubis wrote:
> Hi!
> > > >  #include "uevent.h"
> > > >  
> > > >  #define TUN_PATH "/dev/net/tun"
> > > >  
> > > > +#define MAX_UEVENT 7
> > > > +
> > > > +struct uevent_desc add = {
> > > > +	.msg = "add@/devices/virtual/net/ltp-tun0",
> > > > +	.value_cnt = 4,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=add",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0",
> > > > +		"SUBSYSTEM=net",
> > > > +		"INTERFACE=ltp-tun0",
> > > > +	}
> > > > +};
> > > > +struct uevent_desc add_rx = {
> > > > +	.msg = "add@/devices/virtual/net/ltp-tun0/queues/rx-0",
> > > > +	.value_cnt = 3,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=add",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
> > > > +		"SUBSYSTEM=queues",
> > > > +	}
> > > > +};
> > > > +struct uevent_desc add_tx = {
> > > > +	.msg = "add@/devices/virtual/net/ltp-tun0/queues/tx-0",
> > > > +	.value_cnt = 3,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=add",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
> > > > +		"SUBSYSTEM=queues",
> > > > +	}
> > > > +};
> > > > +struct uevent_desc rem_rx = {
> > > > +	.msg = "remove@/devices/virtual/net/ltp-tun0/queues/rx-0",
> > > > +	.value_cnt = 3,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=remove",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
> > > > +		"SUBSYSTEM=queues",
> > > > +	}
> > > > +};
> > > > +struct uevent_desc rem_tx = {
> > > > +	.msg = "remove@/devices/virtual/net/ltp-tun0/queues/tx-0",
> > > > +	.value_cnt = 3,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=remove",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
> > > > +		"SUBSYSTEM=queues",
> > > > +	}
> > > > +};
> > > > +struct uevent_desc rem = {
> > > > +	.msg = "remove@/devices/virtual/net/ltp-tun0",
> > > > +	.value_cnt = 4,
> > > > +	.values = (const char*[]) {
> > > > +		"ACTION=remove",
> > > > +		"DEVPATH=/devices/virtual/net/ltp-tun0",
> > > > +		"SUBSYSTEM=net",
> > > > +		"INTERFACE=ltp-tun0",
> > > > +	}
> > > > +};
> > > 
> > > Why do we have to move these outside of the function? I do not see a
> > > single reason to do so.
> > > 
> > 
> > I think separating the declaration of uevents and dynamic adding uevents 
> > will make the program easier to read.
> > This part is open to discussion, I'm just giving my thoughts.
> > if everyone think it's a bad idea, I'll change it back in v2 patch.
> > 
> > declaration
> > ----------------------------
> > struct uevent_desc rem_tx = {}
> > struct uevent_desc add_rx = {}
> > struct uevent_desc add_tx = {}
> > .....
> > 
> > dynamically adding uevent:
> > --------------------------
> > uevents[i++] = &add;
> > if (has_RPS)
> >         uevents[i++] = &add_rx;
> > uevents[i++] = &add_tx;
> > if (has_RPS)
> >         uevents[i++] = &rem_rx;
> > uevents[i++] = &rem_tx;
> > uevents[i++] = &rem;
> > uevents[i++] = NULL;
> > 
> > > > +	const struct uevent_desc *uevents[MAX_UEVENT];
> > > > +	int pid, fd, i = 0;
> > > > +	int has_RPS = tst_kconfig_get("CONFIG_RPS");
> > > 
> > > Getting the flag should be done once in the test setup, otherwise kernel
> > > config will be parsed in each iteration of the test.
> > > 
> > 
> > If we parse the kernel configuration during test setup, we will block all 
> > images without CONFIG_RPS from executing this testcase. This is not my 
> > intention, in this patch I designed to continue executing uevent02 even 
> > without CONFIG_RPS. Just adjusting uevents can pass this test. So I think 
> > parsing the kernel config in test_all() should be the correct way.
> 
> I do not think that we understand each other here. What I proposed is to
> call the function that parses kernel config in the test setup and
> initialize the has_RPS flag there so that it's not called on each
> interation of the run() function (e.g. when test is passed -i 100 on
> command line).
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
