Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019826BDA2
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 09:04:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3953A3C2B09
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 09:04:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 77B2B3C149D
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 09:04:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EFAAC14010CF
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 09:04:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D708B147;
 Wed, 16 Sep 2020 07:04:57 +0000 (UTC)
Date: Wed, 16 Sep 2020 09:04:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200916070440.GA1433@dell5510>
References: <CY4PR13MB11752979CBBBBCAD98EC86E0FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB11752979CBBBBCAD98EC86E0FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ltp-selftest-quick runtest file (was RE:  LTP release)
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tim,

...
> > e.g. route tests with netlink also uses shell API and it's really quick (real
> > time 0m0,687s):
> > route6-change-netlink-dst route-change-netlink-dst.sh -6
> This particular one gives me:
> ...
>  route-change-netlink-dst 1 TINFO: running route-change-netlink -c 10000 -6 -p 65535 -d ltp_ns_veth2 -r 'fd00:23:4::1,fd00:23:3::1,fd00:23:2::1,fd00:23:1::1,fd00:23::1,'
> tst_test.c:871: CONF: libmnl library and headers are required
> route-change-netlink-dst 1 TCONF: not supported configuration

> Is there a networking one with less requirements, that is basically guaranteed to work?
Good catch. Although TCONF is also a test for shell API :), let's use plan shell
implementation:
route6-change-dst route-change-dst.sh -6

(a bit longer to run, but without libmnl dependency).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
