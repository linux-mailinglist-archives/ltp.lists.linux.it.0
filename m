Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F5BBA1A
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 19:02:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09CFB3C2076
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 19:02:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DCB313C1C86
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 19:02:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 666E26007B7
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 19:02:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CF4BB607;
 Mon, 23 Sep 2019 17:02:27 +0000 (UTC)
Date: Mon, 23 Sep 2019 19:02:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20190923170225.GA10355@dell5510>
References: <20190919145911.22278-1-mdoucha@suse.cz>
 <20190919145911.22278-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919145911.22278-3-mdoucha@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Add connection tests for bind()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Add two new test programs to verify that bind() will open sockets for incoming
> connections. Both programs follow the same test scenario:
> - Create and bind() a socket
> - Wait for connection from peer thread
> - Send request to peer thread
> - Receive and verify response from peer thread

> bind04 tests stream-oriented sockets (SOCK_STREAM and SOCK_SEQPACKET).
> bind05 tests datagram-oriented sockets (SOCK_DGRAM).

> Both programs test the following socket types:
> - AF_UNIX (pathname and abstract addresses)
> - AF_INET (loopback)
> - AF_INET6 (loopback)

I'd drop libbind.c and move content into libbind.h, using inline functions.

Both tests also share a lot of code. I understand you don't want to mix TCP and
UDP tests (I would probably do), but could you at least move setup() and constants into libbind.h?

I'd also test:
IPPROTO_SCTP (SOCK_STREAM) for TCP and
IPPROTO_UDPLITE (SOCK_DGRAM) for UDP.

+ test some protocols for other sock types: 
IPPROTO_SCTP (SOCK_STREAM).

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
