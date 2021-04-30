Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1036F792
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:08:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D9BF3C60CD
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:08:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1790B3C0207
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:08:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A038160032E
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:08:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02B6FAF52;
 Fri, 30 Apr 2021 09:08:34 +0000 (UTC)
Date: Fri, 30 Apr 2021 10:46:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YIvD+cd3I4ExCIY7@yuki>
References: <20210429150510.21585-1-rpalethorpe@suse.com>
 <20210429150510.21585-6-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429150510.21585-6-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] bpf: Check truncation on 32bit div/mod by
 zero
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

Hi!
> +static int load_prog(void)
> +{
> +	struct bpf_insn_buf prog_insn = { 0 };
> +        /* r6 = 1 << 32
> +	 * r7 = -1
> +	 */
> +	const struct bpf_insn set_src_dst_insn[] = {
> +		BPF_LD_IMM64(BPF_REG_6, 1ULL << 32),
> +		BPF_MOV64_IMM(BPF_REG_7, -1LL),
> +	};
> +	/* w7 /= w6 */
> +	const struct bpf_insn div_insn =
> +		BPF_ALU32_REG(BPF_DIV, BPF_REG_7, BPF_REG_6);
> +	/* w7 %= w6 */
> +	const struct bpf_insn mod_insn =
> +		BPF_ALU32_REG(BPF_MOD, BPF_REG_7, BPF_REG_6);
> +	/* exit(0) */
> +	const struct bpf_insn exit_insn[] = {
> +		BPF_MOV64_IMM(BPF_REG_0, 0),
> +		BPF_EXIT_INSN()
> +	};
> +
> +	bpf_insn_buf_cat(&prog_insn, set_src_dst_insn, sizeof(set_src_dst_insn));
> +	bpf_insn_buf_cat(&prog_insn, &div_insn, sizeof(div_insn));
> +
> +	bpf_insn_buf_array_set(&prog_insn, map_fd, 0, BPF_REG_6);
> +	bpf_insn_buf_array_set(&prog_insn, map_fd, 1, BPF_REG_7);
> +
> +	bpf_insn_buf_cat(&prog_insn, set_src_dst_insn, sizeof(set_src_dst_insn));
> +	bpf_insn_buf_cat(&prog_insn, &mod_insn, sizeof(mod_insn));
> +
> +	bpf_insn_buf_array_set(&prog_insn, map_fd, 2, BPF_REG_6);
> +	bpf_insn_buf_array_set(&prog_insn, map_fd, 3, BPF_REG_7);
> +
> +	bpf_insn_buf_cat(&prog_insn, exit_insn, sizeof(exit_insn));
> +
> +        bpf_init_prog_attr(attr, prog_insn.insn, prog_insn.byte_len, log, BUFSIZE);

I find this completely unreadable to be honest, the array with
instructions is much better.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
