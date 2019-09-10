Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9FBAEB65
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 15:23:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A68433C2096
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 15:23:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3E3FB3C2075
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 15:23:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 05326200DC5
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 15:23:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C3D1AC2C;
 Tue, 10 Sep 2019 13:23:45 +0000 (UTC)
Date: Tue, 10 Sep 2019 15:23:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190910132338.GB29865@rei>
References: <20190905124504.24909-1-rpalethorpe@suse.com>
 <496221419.11145941.1568120105161.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <496221419.11145941.1568120105161.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] BPF: Regression test for 64bit arithmetic
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > +static int load_prog(int fd)
> > +{
> > +	struct bpf_insn *prog;
> > +	struct bpf_insn insn[] = {
> > +		BPF_MOV64_IMM(BPF_REG_6, 1),            /* r6 = 1 */
> > +
> > +		BPF_LD_MAP_FD(BPF_REG_1, fd),	        /* r1 = &fd */
> > +		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),   /* r2 = fp */
> > +		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),  /* r2 = r2 - 8 */
> > +		BPF_ST_MEM(BPF_DW, BPF_REG_2, 0, 0),    /* *r2 = 0 */
> > +		BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),
> > +		BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 17), /* if(!r0) goto exit */
> 
> Patch looks good to me.
> 
> But I keep thinking if there's way to make it more obvious where
> offset (e.g. 17) came from.
> 
> Idea 1: use multiple lines per instruction to denote length 
>   BPF_LD_IMM64(BPF_REG_4,
>                A64INT),
> 
> Idea 2: prefix commented instructions with offset
>         /* 1: r3 = r0 */
>         /* 2: r4 = 2^61 */

I guess I like the Idea 2 better.

Another option would be having eBPF assembler included in the LTP build
system. I guess that it may be useful later on and there seems to be one
written in python:

https://github.com/solarflarecom/ebpf_asm

But for the short term I would go with adding the offset to the
comments.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
