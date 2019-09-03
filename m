Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF6A673B
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 13:15:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D53CF3C2100
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 13:15:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CD4AC3C209F
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 13:15:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0366B1A0111E
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 13:15:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18E98AD2A
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 11:15:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Sep 2019 13:15:31 +0200
Message-Id: <20190903111535.27565-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/4] Basic eBPF tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

v5:

Fixed problems pointed out by Jan.

Richard Palethorpe (4):
  BPF: Essential headers for map creation
  BPF: Sanity check creating and updating maps
  BPF: Essential headers for a basic program
  BPF: Sanity check creating a program

 include/lapi/bpf.h                         | 526 +++++++++++++++++++++
 include/lapi/socket.h                      |   4 +
 include/lapi/syscalls/aarch64.in           |   1 +
 include/lapi/syscalls/i386.in              |   1 +
 include/lapi/syscalls/s390.in              |   1 +
 include/lapi/syscalls/sparc.in             |   1 +
 include/lapi/syscalls/x86_64.in            |   1 +
 runtest/syscalls                           |   3 +
 testcases/kernel/syscalls/bpf/.gitignore   |   2 +
 testcases/kernel/syscalls/bpf/Makefile     |  10 +
 testcases/kernel/syscalls/bpf/bpf_map01.c  | 163 +++++++
 testcases/kernel/syscalls/bpf/bpf_prog01.c | 166 +++++++
 12 files changed, 879 insertions(+)
 create mode 100644 include/lapi/bpf.h
 create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
 create mode 100644 testcases/kernel/syscalls/bpf/Makefile
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog01.c

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
