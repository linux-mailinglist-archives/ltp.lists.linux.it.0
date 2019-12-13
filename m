Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56A11E000
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 09:55:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1E5B3C2272
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 09:55:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C64933C136E
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 09:55:26 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 32A631BCF374
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 09:55:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FE5AAE3F;
 Fri, 13 Dec 2019 08:55:23 +0000 (UTC)
Date: Fri, 13 Dec 2019 09:55:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Steve Dickson <SteveD@redhat.com>
Message-ID: <20191213085521.GA29513@dell5510>
References: <20191117131151.GA20302@x230> <20191210215304.GA473173@x230>
 <9566e015-27d1-8baf-e1c6-7b914923714c@RedHat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9566e015-27d1-8baf-e1c6-7b914923714c@RedHat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [Libtirpc-devel] Validity of RPC tests in LTP
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
Cc: ltp@lists.linux.it, kukuk@suse.com, Daniel Gryniewicz <dang@redhat.com>,
 libtirpc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Steve,

[Cc: Cyril, LTP mailing list, and some people connected to RPC libraries]

> Sorry... I was on PTO...
Not a problem, I know you're busy anyway.

> The tests look fine to me... Should be included in the libtirpc git tree?
Hm, IMHO this is better to be part of LTP, so other RPC implementations can be
tested with it.

According to README [1] [2] [3] LTP rpc tests contains:

* basic client-server RPC tests (testcases/network/rpc/basic_tests)
Looking at the code testing rpcinfo, rup, rusers, rusersd, requiring .rhosts
setup => quite outdated but some might still useful to test.
I'd appreciate some feedback to know whether this code is worth of cleanup.
IMHO this code is not interesting for libtirpc at all.

* SUN RPC and TI-RPC tests (testcases/network/rpc/rpc-tirpc)
Code originally written by Cyril Lacabanne in 2007 and later adopted for LTP.
IMHO it can be used to test any SUN RPC implementation. Although not sure if
there is nowadays any other implementation than libtirpc widely used, it still
can be used with:
  * glibc (it has deprecated it's implementation in 2.26, the
--enable-obsolete-rpc switch existed in 2.16, which is kind of deprecation,
but older glibc could be used or new one with RPC still enabled).
  * rpcsvc-proto [4] (Thorsten's rpcsvc-proto also recommends
libtirpc, but maybe somebody still uses it)
  * ntirpc [5] (libtirpc fork ntirpc has been packaged for some major distros
(at least Debian/Ubuntu, Fedora, Gentoo). LTP code doesn't support ntirpc, but
it'd be trivial to to allow to use it [6].
  * Maybe there are other SUN RPC implementations I'm not aware of

If there ever is just a libtirpc as SUN RPC implementation for Linux distros
I'd be for moving this code to LTP. But code quality is bad, it for sure
requires some cleanup in either case.

ATM it uses LTP legacy shell API in rpc_test.sh [7] wrapper and no LTP API in C
code (which contains a lot of duplicity). For the case of moving code into
libtirpc LTP dependencies would be easily removed. In case of staying in LTP
(again, IMHO better, but I might be wrong) I'd be for using new LTP API,
which would cleanup C code a lot [8].

Besides that libtirpc itself might deserve some unit testing code.

Any comments are welcome.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/tree/master/testcases/network/rpc
[2] https://github.com/linux-test-project/ltp/tree/master/testcases/network/rpc/basic_tests
[3] https://github.com/linux-test-project/ltp/tree/master/testcases/network/rpc/rpc-tirpc
[4] https://github.com/thkukuk/rpcsvc-proto
[5] https://github.com/nfs-ganesha/ntirpc
[6] https://github.com/linux-test-project/ltp/blob/master/include/lapi/rpc.h
[7] https://github.com/linux-test-project/ltp/blob/master/testcases/network/rpc/rpc-tirpc/rpc_test.sh
[8] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
