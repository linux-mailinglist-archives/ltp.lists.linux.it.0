Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6AB4841
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 09:27:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 733573C1CF9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 09:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 925C83C1C95
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 09:27:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 41FC81401822
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 09:27:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 79E75AF4C;
 Tue, 17 Sep 2019 07:27:44 +0000 (UTC)
References: <20190911095422.11767-1-rpalethorpe@suse.com>
 <1568372120.3306.13.camel@suse.de> <20190913114613.GA7939@rei>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190913114613.GA7939@rei>
Date: Tue, 17 Sep 2019 09:27:44 +0200
Message-ID: <874l1bl6vj.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] BPF: Regression test for 64bit arithmetic
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
Cc: cfamullaconrad@suse.com, Richard Palethorpe <rpalethorpe@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > +		BPF_LD_IMM64(BPF_REG_4, A64INT),        /* 21: r4 =
>> > 2^61 */
>>   ^
>>   I think 2^61 is different to 1<<60
>
> Agreed, 1<<60 is 2^60
>
>> > +		BPF_ALU64_REG(BPF_SUB, BPF_REG_4, BPF_REG_6), /* 23:
>> > r4 -= r6 */
>> > +		BPF_STX_MEM(BPF_DW, BPF_REG_3, BPF_REG_4, 0), /* 24:
>> > *r3 = r4 */
>> > +
>> > +		BPF_MOV64_IMM(BPF_REG_0, 0),            /* 25: r0 =
>> > 0 */
>> > +		BPF_EXIT_INSN(),		        /* 26:
>> > return r0 */
>> > +	};
>> > +
>> > +	/* Leaks memory when -i is specified */
>> > +	prog = tst_alloc(sizeof(insn));
>> > +	memcpy(prog, insn, sizeof(insn));
>> > +
>> > +	memset(attr, 0, sizeof(*attr));
>> > +	attr->prog_type = BPF_PROG_TYPE_SOCKET_FILTER;
>> > +	attr->insns = ptr_to_u64(prog);
>> > +	attr->insn_cnt = ARRAY_SIZE(insn);
>> > +	attr->license = ptr_to_u64("GPL");
>> > +	attr->log_buf = ptr_to_u64(log);
>> > +	attr->log_size = BUFSIZ;
>> > +	attr->log_level = 1;
>> > +
>> > +	TEST(bpf(BPF_PROG_LOAD, attr, sizeof(*attr)));
>> > +	if (TST_RET == -1) {
>> > +		if (log[0] != 0) {
>> > +			tst_res(TINFO, "Verification log:");
>> > +			fputs(log, stderr);
>> > +			tst_brk(TBROK | TTERRNO, "Failed
>> > verification");
>> > +		} else {
>> > +			tst_brk(TBROK | TTERRNO, "Failed to load
>> > program");
>> > +		}
>> > +	}
>> > +
>> > +	return TST_RET;
>> > +}
>> > +
>> > +static void setup(void)
>> > +{
>> > +	memcpy(msg, MSG, sizeof(MSG));
>> > +}
>> > +
>> > +static void run(void)
>> > +{
>> > +	int map_fd, prog_fd;
>> > +	int sk[2];
>> > +
>> > +	memset(attr, 0, sizeof(*attr));
>> > +	attr->map_type = BPF_MAP_TYPE_ARRAY;
>> > +	attr->key_size = 4;
>> > +	attr->value_size = 8;
>> > +	attr->max_entries = 2;
>> > +
>> > +	TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));
>> > +	if (TST_RET == -1) {
>> > +		if (TST_ERR == EPERM) {
>> > +			tst_brk(TCONF | TTERRNO,
>> > +				"bpf() requires CAP_SYS_ADMIN on
>> > this system");
>> > +		} else {
>> > +			tst_brk(TBROK | TTERRNO, "Failed to create
>> > array map");
>> > +		}
>> > +	}
>> > +	map_fd = TST_RET;
>> > +
>> > +	prog_fd = load_prog(map_fd);
>> > +
>> > +	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
>> > +	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
>> > +			&prog_fd, sizeof(prog_fd));
>> > +
>> > +	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
>> > +
>> > +	memset(attr, 0, sizeof(*attr));
>> > +	attr->map_fd = map_fd;
>> > +	attr->key = ptr_to_u64(key);
>> > +	attr->value = ptr_to_u64(val);
>> > +	*key = 0;
>> > +
>> > +	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
>> > +	if (TST_RET == -1) {
>> > +		tst_res(TFAIL | TTERRNO, "array map lookup");
>> > +	} else if (*val != A64INT + 1) {
>> > +		tst_res(TFAIL,
>> > +			"val = %lu, but should be val = %lu + 1",
>>                                 ^
>> Not sure if it is really needed but I would use %llu here. If so, other
>> places as well.
>
> Technically we should be using PRIu64 which expands to %lu on 64 bit and
> to %llu on 32 bit. But given that sizeof(long long) == sizeof(long) on
> 64 bit on Linux %llu should work as well.

Ack.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
