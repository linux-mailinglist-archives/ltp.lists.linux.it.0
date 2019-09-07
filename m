Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656CAC60E
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Sep 2019 12:19:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB52F3C1CF2
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Sep 2019 12:19:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 99E473C18F7
 for <ltp@lists.linux.it>; Sat,  7 Sep 2019 12:19:05 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BC4001400E0E
 for <ltp@lists.linux.it>; Sat,  7 Sep 2019 12:19:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B06B459449;
 Sat,  7 Sep 2019 10:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A76405DA21;
 Sat,  7 Sep 2019 10:19:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CB5518005A0;
 Sat,  7 Sep 2019 10:19:02 +0000 (UTC)
Date: Sat, 7 Sep 2019 06:19:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1108769731.10519822.1567851542307.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190903111535.27565-1-chrubis@suse.cz>
References: <20190903111535.27565-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: Basic eBPF tests
Thread-Index: tpDMzVRYfPwF89jxD24DfqrXPdLkaw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sat, 07 Sep 2019 10:19:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] Basic eBPF tests
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
> v5:
> 
> Fixed problems pointed out by Jan.

ack

> 
> Richard Palethorpe (4):
>   BPF: Essential headers for map creation
>   BPF: Sanity check creating and updating maps
>   BPF: Essential headers for a basic program
>   BPF: Sanity check creating a program
> 
>  include/lapi/bpf.h                         | 526 +++++++++++++++++++++
>  include/lapi/socket.h                      |   4 +
>  include/lapi/syscalls/aarch64.in           |   1 +
>  include/lapi/syscalls/i386.in              |   1 +
>  include/lapi/syscalls/s390.in              |   1 +
>  include/lapi/syscalls/sparc.in             |   1 +
>  include/lapi/syscalls/x86_64.in            |   1 +
>  runtest/syscalls                           |   3 +
>  testcases/kernel/syscalls/bpf/.gitignore   |   2 +
>  testcases/kernel/syscalls/bpf/Makefile     |  10 +
>  testcases/kernel/syscalls/bpf/bpf_map01.c  | 163 +++++++
>  testcases/kernel/syscalls/bpf/bpf_prog01.c | 166 +++++++
>  12 files changed, 879 insertions(+)
>  create mode 100644 include/lapi/bpf.h
>  create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
>  create mode 100644 testcases/kernel/syscalls/bpf/Makefile
>  create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c
>  create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog01.c
> 
> --
> 2.21.0
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
