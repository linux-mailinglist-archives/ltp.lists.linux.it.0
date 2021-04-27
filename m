Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCF36C799
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:14:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F48D3C65A4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:14:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 759793C1DA6
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:14:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CF135600648
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:14:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E103AB1AB
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:14:01 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210426111918.4304-1-mdoucha@suse.cz>
 <20210426111918.4304-4-mdoucha@suse.cz> <YIgUcqIhXVgiqaMu@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <ceb5f5b5-2efd-beaf-e617-7fa0b28c0ff2@suse.cz>
Date: Tue, 27 Apr 2021 16:14:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YIgUcqIhXVgiqaMu@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] RFC: Add rtnetlink helper library
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

On 27. 04. 21 15:41, Cyril Hrubis wrote:
> Hi!
>> +static int tst_rtnl_grow_buffer(const char *file, const int lineno,
>> +	struct tst_rtnl_context *ctx, size_t size)
>> +{
>> +	size_t needed, offset, curlen = NLMSG_ALIGN(ctx->datalen);
>> +	char *buf;
>> +
>> +	if (ctx->bufsize - curlen >= size)
>> +		return 1;
>> +
>> +	needed = size - (ctx->bufsize - curlen);
>> +	size = ctx->bufsize + (ctx->bufsize > needed ? ctx->bufsize : needed);
>> +	size = NLMSG_ALIGN(size);
>> +	buf = safe_realloc(file, lineno, ctx->buffer, size);
>> +
>> +	if (!buf)
>> +		return 0;
> 
> You are calling safe_realloc() here yet you check the return value. And
> it's the same for safe_malloc(), safe_bind(), safe_socket() and a few
> more in the code.
> 
> So either we get rid of the error checks and of the error
> propagation or we avoid using safe_ variants.

Both rtnetlink and netdevice management functions will be called in
cleanup() so I have to assume that the safe functions will only print a
warning instead of terminating the program. But I still want to use the
error reporting code in the safe functions.

> Other than that the code looks sane but it's hard to review the API
> without an example that would excersize it. What about adding something
> simple in newlib_tests?

There are short examples for both rtnetlink and netdevice management in
the cover letter. The netdevice library itself is also a detailed
example for the rtnetlink API. The final patchset will include the
SADDNS CVE test which will use most of the netdevice management
functions in setup().

>> +void tst_rtnl_free_context(const char *file, const int lineno,
>> +	struct tst_rtnl_context *ctx)
> 
> This should be probably called destroy_context() but that is very minor.

OK, why not.

>> +int tst_rtnl_wait(struct tst_rtnl_context *ctx)
>> +{
>> +	fd_set fdlist;
>> +	struct timeval timeout = {0};
>> +
>> +	FD_ZERO(&fdlist);
>> +	FD_SET(ctx->socket, &fdlist);
>> +	timeout.tv_sec = 1;
>> +
>> +	return select(ctx->socket + 1, &fdlist, NULL, NULL, &timeout);
> 
> I find the poll() syscall to have a bit saner API than this.

I'll have a look at it.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
