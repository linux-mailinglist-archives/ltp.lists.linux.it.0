Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97EAB983
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Sep 2019 15:43:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBC573C1CDE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Sep 2019 15:43:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 39C1A3C14EE
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 15:43:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 26B276657CE
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 15:43:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37B1AAF5C
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 13:43:16 +0000 (UTC)
References: <20190903111535.27565-1-chrubis@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190903111535.27565-1-chrubis@suse.cz>
Date: Fri, 06 Sep 2019 15:43:16 +0200
Message-ID: <87imq5levf.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> v5:
>
> Fixed problems pointed out by Jan.

I am happy with these changes and have rebased bpf_prog02 on this
patchset.

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


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
