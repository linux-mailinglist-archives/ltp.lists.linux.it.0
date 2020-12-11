Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 791122D72AC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:15:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED7DE3C61BA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:15:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B175E3C4AF7
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:15:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5366960084D
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:15:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 802FFADA2;
 Fri, 11 Dec 2020 09:15:16 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:15:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <X9M4ol3AqYU8YtZQ@pevik>
References: <20201208162440.14538-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208162440.14538-1-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_net.sh: add getopts to tst_ping()
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

Hi Alexey,

BTW -f does not require root (but effectively it's required by netns setup).

> * Replace '-i 0' with '-f'
Out of curiosity, why flood ping is better than -i 0?
More effective stressing?

Ad Busybox ping fallback -i 0.01, interesting -i 0 keeps blocked in
recvfrom():

$ strace busybox ping -i 0 localhost
setsockopt(0, SOL_SOCKET, SO_BROADCAST, [1], 4) = 0
setsockopt(0, SOL_SOCKET, SO_RCVBUF, [7280], 4) = 0
rt_sigaction(SIGINT, {sa_handler=0x55935b81f3a0, sa_mask=[INT], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f82be570af0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
sendto(0, "\10\0H\25*k\0\0T\2200\357\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 64, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, 28) = 64
rt_sigaction(SIGALRM, {sa_handler=0x55935b81f4d0, sa_mask=[ALRM], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f82be570af0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=0, tv_usec=0}}, NULL) = 0
recvfrom(0, "E\0\0Tf\25@\0@\1\326\221\177\0\0\1\177\0\0\1\10\0H\25*k\0\0T\2200\357"..., 192, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, [16]) = 84
recvfrom(0, "E\0\0Tf\26\0\0@\1\26\221\177\0\0\1\177\0\0\1\0\0P\25*k\0\0T\2200\357"..., 192, 0, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, [16]) = 84
write(1, "64 bytes from 127.0.0.1: seq=0 t"..., 5264 bytes from 127.0.0.1: seq=0 ttl=64 time=0.634 ms
) = 52
recvfrom(0,

Is that a bug?

Kind regards,
Petr

> * Add similar checks for the flood and interval options as
>   in ping02 test

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
