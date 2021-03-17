Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC733EFC0
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:47:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFABF3C61EA
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:47:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 53A053C2CF2
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:47:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CB431600C7F
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:47:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23A91AB8C;
 Wed, 17 Mar 2021 11:47:23 +0000 (UTC)
Date: Wed, 17 Mar 2021 12:47:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YFHsSWLeaqwdAWzZ@pevik>
References: <20210315092844.991073-1-lkml@jv-coder.de> <YFHNDN1CEcBo6oMG@pevik>
 <87117f6f-58e7-8b68-38c3-be5b080e86b6@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87117f6f-58e7-8b68-38c3-be5b080e86b6@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] pec: Convert to the new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> Hi Petr,

> On 3/17/2021 10:34 AM, Petr Vorel wrote:
> > BTW: would it make sense to rename runtest/connectors to runtest/netlink
> > and move code from testcases/kernel/connectors/ to testcases/kernel/net=
link/?
> Maybe kernel/netlink/connector/. Connector is an abstraction on top of
+1

> netlink with a slightly
> different interface than pure netlink (eg. cn_msg instead of nlmsghdr).
> There are only very few other modules, that use this interface at the mom=
ent
> (MS HyperV, MD,=A0 uvesafb=A0 and dallas' 1-wire).
I'd still put it into netlink and try to put there more general netlink
subsystem tests. My objection is that runtest/connectors has only single te=
st
and connectors is very generic name.

> The question is: Is the interface the correct think to categorize by? If =
the
> interface (i.e. netlink) is used for categorization, then some of the cry=
pto
> tests should also be in this netlink category.
Thus maybe add some of relevant tests also into runtest/netlink? We shave s=
ome
kind of duplicity (see runtest/cve, it contains some tests which are also in
runtest/syscalls). That would also justify creating runtest/netlink (because
having just single test for legacy connector interface in runtest/netlink d=
oes
not sound good to me).

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
