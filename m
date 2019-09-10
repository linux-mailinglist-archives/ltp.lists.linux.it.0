Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F1AEAE6
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 14:55:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4DFA3C2090
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 14:55:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B25233C1C94
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 14:55:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 25540601262
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 14:55:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9744F10F2E84;
 Tue, 10 Sep 2019 12:55:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BAE4100194E;
 Tue, 10 Sep 2019 12:55:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D2C52551B;
 Tue, 10 Sep 2019 12:55:05 +0000 (UTC)
Date: Tue, 10 Sep 2019 08:55:05 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <496221419.11145941.1568120105161.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190905124504.24909-1-rpalethorpe@suse.com>
References: <20190905124504.24909-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.5]
Thread-Topic: Regression test for 64bit arithmetic
Thread-Index: k9iNSFBbDCe3Iq5jpo85+8wJTfFFlw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 10 Sep 2019 12:55:05 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> +static int load_prog(int fd)
> +{
> +	struct bpf_insn *prog;
> +	struct bpf_insn insn[] = {
> +		BPF_MOV64_IMM(BPF_REG_6, 1),            /* r6 = 1 */
> +
> +		BPF_LD_MAP_FD(BPF_REG_1, fd),	        /* r1 = &fd */
> +		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),   /* r2 = fp */
> +		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),  /* r2 = r2 - 8 */
> +		BPF_ST_MEM(BPF_DW, BPF_REG_2, 0, 0),    /* *r2 = 0 */
> +		BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),
> +		BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 17), /* if(!r0) goto exit */

Patch looks good to me.

But I keep thinking if there's way to make it more obvious where
offset (e.g. 17) came from.

Idea 1: use multiple lines per instruction to denote length 
  BPF_LD_IMM64(BPF_REG_4,
               A64INT),

Idea 2: prefix commented instructions with offset
        /* 1: r3 = r0 */
        /* 2: r4 = 2^61 */

> +		BPF_MOV64_REG(BPF_REG_3, BPF_REG_0),    /* r3 = r0 */
> +		BPF_LD_IMM64(BPF_REG_4, A64INT),        /* r4 = 2^61 */
> +		BPF_ALU64_REG(BPF_ADD, BPF_REG_4, BPF_REG_6), /* r4 += r6 */
> +		BPF_STX_MEM(BPF_DW, BPF_REG_3, BPF_REG_4, 0), /* *r3 = r4 */
> +
> +		BPF_LD_MAP_FD(BPF_REG_1, fd),	        /* r1 = &fd */
> +		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),   /* r2 = fp */
> +		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),  /* r2 = r2 - 8 */
> +		BPF_ST_MEM(BPF_DW, BPF_REG_2, 0, 1),    /* *r2 = 1 */
> +		BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),
> +		BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 5),  /* if(!r0) goto exit */
> +		BPF_MOV64_REG(BPF_REG_3, BPF_REG_0),    /* r3 = r0 */
> +		BPF_LD_IMM64(BPF_REG_4, A64INT),        /* r4 = 2^61 */
> +		BPF_ALU64_REG(BPF_SUB, BPF_REG_4, BPF_REG_6), /* r4 -= r6 */
> +		BPF_STX_MEM(BPF_DW, BPF_REG_3, BPF_REG_4, 0), /* *r3 = r4 */
> +
> +		BPF_MOV64_IMM(BPF_REG_0, 0),            /* r0 = 0 */
> +		BPF_EXIT_INSN(),		        /* return r0 */
> +	};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
