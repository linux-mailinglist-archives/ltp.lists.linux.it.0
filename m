Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64F36C771
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:00:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5424D3C65D4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:00:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA6DD3C1DA6
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:00:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 590EA100117F
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:00:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE10FAFCF
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:00:37 +0000 (UTC)
Date: Tue, 27 Apr 2021 15:41:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YIgUcqIhXVgiqaMu@yuki>
References: <20210426111918.4304-1-mdoucha@suse.cz>
 <20210426111918.4304-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426111918.4304-4-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Hi!
> +static int tst_rtnl_grow_buffer(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx, size_t size)
> +{
> +	size_t needed, offset, curlen = NLMSG_ALIGN(ctx->datalen);
> +	char *buf;
> +
> +	if (ctx->bufsize - curlen >= size)
> +		return 1;
> +
> +	needed = size - (ctx->bufsize - curlen);
> +	size = ctx->bufsize + (ctx->bufsize > needed ? ctx->bufsize : needed);
> +	size = NLMSG_ALIGN(size);
> +	buf = safe_realloc(file, lineno, ctx->buffer, size);
> +
> +	if (!buf)
> +		return 0;

You are calling safe_realloc() here yet you check the return value. And
it's the same for safe_malloc(), safe_bind(), safe_socket() and a few
more in the code.

So either we get rid of the error checks and of the error
propagation or we avoid using safe_ variants.

Other than that the code looks sane but it's hard to review the API
without an example that would excersize it. What about adding something
simple in newlib_tests?

> +	memset(buf + ctx->bufsize, 0, size - ctx->bufsize);
> +	offset = ((char *)ctx->curmsg) - ctx->buffer;
> +	ctx->buffer = buf;
> +	ctx->curmsg = (struct nlmsghdr *)(buf + offset);
> +	ctx->bufsize = size;
> +	return 1;
> +}
> +
> +struct tst_rtnl_context *tst_rtnl_create_context(const char *file,
> +	const int lineno)
> +{
> +	struct tst_rtnl_context *ctx;
> +	struct sockaddr_nl addr = {0};
> +
> +	ctx = safe_malloc(file, lineno, NULL, sizeof(struct tst_rtnl_context));
> +
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->pid = 0;
> +	ctx->seq = 0;
> +	ctx->bufsize = 1024;
> +	ctx->datalen = 0;
> +	ctx->curmsg = NULL;
> +	ctx->socket = safe_socket(file, lineno, NULL, AF_NETLINK,
> +		SOCK_DGRAM | SOCK_CLOEXEC, NETLINK_ROUTE);
> +	addr.nl_family = AF_NETLINK;
> +
> +	if (ctx->socket < 0) {
> +		free(ctx);
> +		return NULL;
> +	}
> +
> +	if (safe_bind(file, lineno, NULL, ctx->socket, (struct sockaddr *)&addr,
> +		sizeof(addr))) {
> +		free(ctx);
> +		return NULL;
> +	}
> +
> +	ctx->buffer = safe_malloc(file, lineno, NULL, ctx->bufsize);
> +
> +	if (!ctx->buffer) {
> +		safe_close(file, lineno, NULL, ctx->socket);
> +		free(ctx);
> +		return NULL;
> +	}
> +
> +	memset(ctx->buffer, 0, ctx->bufsize);
> +	return ctx;
> +}
> +
> +void tst_rtnl_free_message(struct tst_rtnl_message *msg)
> +{
> +	if (!msg)
> +		return;
> +
> +	// all ptr->header and ptr->info pointers point to the same buffer
> +	// msg->header is the start of the buffer
> +	free(msg->header);
> +	free(msg);
> +}
> +
> +void tst_rtnl_free_context(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx)

This should be probably called destroy_context() but that is very minor.

> +{
> +	safe_close(file, lineno, NULL, ctx->socket);
> +	free(ctx->buffer);
> +	free(ctx);
> +}
> +
> +int tst_rtnl_send(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx)
> +{
> +	struct sockaddr_nl addr = {0};
> +	struct iovec iov;
> +	struct msghdr msg = {0};
> +	int ret;
> +
> +	if (!ctx->curmsg) {
> +		tst_brk_(file, lineno, TBROK, "%s(): No message to send",
> +			__func__);
> +		return 0;
> +	}
> +
> +	if (ctx->curmsg->nlmsg_flags & NLM_F_MULTI) {
> +		size_t size = NLMSG_ALIGN(ctx->curmsg->nlmsg_len);
> +
> +		if (!tst_rtnl_grow_buffer(file, lineno, ctx, NLMSG_SPACE(0)))
> +			return 0;
> +
> +		ctx->curmsg = NLMSG_NEXT(ctx->curmsg, size);
> +		memset(ctx->curmsg, 0, sizeof(struct nlmsghdr));
> +		ctx->curmsg->nlmsg_len = NLMSG_LENGTH(0);
> +		ctx->curmsg->nlmsg_type = NLMSG_DONE;
> +		ctx->curmsg->nlmsg_flags = 0;
> +		ctx->curmsg->nlmsg_seq = ctx->seq++;
> +		ctx->curmsg->nlmsg_pid = ctx->pid;
> +		ctx->datalen = NLMSG_ALIGN(ctx->datalen) + NLMSG_LENGTH(0);
> +	}
> +
> +	addr.nl_family = AF_NETLINK;
> +	iov.iov_base = ctx->buffer;
> +	iov.iov_len = ctx->datalen;
> +	msg.msg_name = &addr;
> +	msg.msg_namelen = sizeof(addr);
> +	msg.msg_iov = &iov;
> +	msg.msg_iovlen = 1;
> +
> +	ret = safe_sendmsg(file, lineno, ctx->datalen, ctx->socket, &msg, 0);
> +
> +	if (ret > 0)
> +		ctx->curmsg = NULL;
> +
> +	return ret;
> +}
> +
> +int tst_rtnl_wait(struct tst_rtnl_context *ctx)
> +{
> +	fd_set fdlist;
> +	struct timeval timeout = {0};
> +
> +	FD_ZERO(&fdlist);
> +	FD_SET(ctx->socket, &fdlist);
> +	timeout.tv_sec = 1;
> +
> +	return select(ctx->socket + 1, &fdlist, NULL, NULL, &timeout);

I find the poll() syscall to have a bit saner API than this.

> +}
> +
> +struct tst_rtnl_message *tst_rtnl_recv(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx)
> +{
> +	char *buffer, tmp;
> +	struct tst_rtnl_message *ret;
> +	struct nlmsghdr *ptr;
> +	ssize_t size;
> +	int i, size_left, msgcount;
> +
> +	errno = 0;
> +	size = recv(ctx->socket, &tmp, 1, MSG_DONTWAIT | MSG_PEEK | MSG_TRUNC);
> +
> +	if (size <= 0) {
> +		if (errno != EAGAIN)
> +			tst_brk_(file, lineno, TBROK | TERRNO, "recv() failed");
> +		return NULL;
> +	}
> +
> +	buffer = safe_malloc(file, lineno, NULL, size);
> +
> +	if (!buffer)
> +		return NULL;
> +
> +	size = safe_recv(file, lineno, size, ctx->socket, buffer, size, 0);
> +
> +	if (size <= 0) {
> +		free(buffer);
> +		return NULL;
> +	}
> +
> +	ptr = (struct nlmsghdr *)buffer;
> +	size_left = size;
> +	msgcount = 0;
> +
> +	for (; size_left > 0 && NLMSG_OK(ptr, size_left); msgcount++)
> +		ptr = NLMSG_NEXT(ptr, size_left);
> +
> +	ret = safe_malloc(file, lineno, NULL,
> +		(msgcount + 1) * sizeof(struct tst_rtnl_message));
> +
> +	if (!ret) {
> +		free(buffer);
> +		return NULL;
> +	}
> +
> +	memset(ret, 0, (msgcount + 1) * sizeof(struct tst_rtnl_message));
> +	ptr = (struct nlmsghdr *)buffer;
> +	size_left = size;
> +
> +	for (i = 0; i < msgcount; i++, ptr = NLMSG_NEXT(ptr, size_left)) {
> +		ret[i].header = ptr;
> +		ret[i].payload = NLMSG_DATA(ptr);
> +		ret[i].payload_size = NLMSG_PAYLOAD(ptr, 0);
> +
> +		if (ptr->nlmsg_type == NLMSG_ERROR)
> +			ret[i].err = NLMSG_DATA(ptr);
> +	}
> +
> +	return ret;
> +}
> +
> +int tst_rtnl_add_message(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx, const struct nlmsghdr *header,
> +	const void *payload, size_t payload_size)
> +{
> +	size_t size;
> +	unsigned int extra_flags = 0;
> +
> +	if (!tst_rtnl_grow_buffer(file, lineno, ctx, NLMSG_SPACE(payload_size)))
> +		return 0;
> +
> +	if (!ctx->curmsg) {
> +		/*
> +		 * datalen may hold the size of last sent message for ACK
> +		 * checking, reset it back to 0 here
> +		 */
> +		ctx->datalen = 0;
> +		ctx->curmsg = (struct nlmsghdr *)ctx->buffer;
> +	} else {
> +		size = NLMSG_ALIGN(ctx->curmsg->nlmsg_len);
> +
> +		extra_flags = NLM_F_MULTI;
> +		ctx->curmsg->nlmsg_flags |= extra_flags;
> +		ctx->curmsg = NLMSG_NEXT(ctx->curmsg, size);
> +		ctx->datalen = NLMSG_ALIGN(ctx->datalen);
> +	}
> +
> +	*ctx->curmsg = *header;
> +	ctx->curmsg->nlmsg_len = NLMSG_LENGTH(payload_size);
> +	ctx->curmsg->nlmsg_flags |= extra_flags;
> +	ctx->curmsg->nlmsg_seq = ctx->seq++;
> +	ctx->curmsg->nlmsg_pid = ctx->pid;
> +	memcpy(NLMSG_DATA(ctx->curmsg), payload, payload_size);
> +	ctx->datalen += ctx->curmsg->nlmsg_len;
> +	return 1;
> +}
> +
> +int tst_rtnl_add_attr(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx, unsigned short type,
> +	const void *data, unsigned short len)
> +{
> +	size_t size;
> +	struct rtattr *attr;
> +
> +	if (!ctx->curmsg) {
> +		tst_brk_(file, lineno, TBROK,
> +			"%s(): No message to add attributes to", __func__);
> +		return 0;
> +	}
> +
> +	if (!tst_rtnl_grow_buffer(file, lineno, ctx, RTA_SPACE(len)))
> +		return 0;
> +
> +	size = NLMSG_ALIGN(ctx->curmsg->nlmsg_len);
> +	attr = (struct rtattr *)(((char *)ctx->curmsg) + size);
> +	attr->rta_type = type;
> +	attr->rta_len = RTA_LENGTH(len);
> +	memcpy(RTA_DATA(attr), data, len);
> +	ctx->curmsg->nlmsg_len = size + attr->rta_len;
> +	ctx->datalen = NLMSG_ALIGN(ctx->datalen) + attr->rta_len;
> +	return 1;
> +}
> +
> +int tst_rtnl_add_attr_string(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx, unsigned short type,
> +	const char *data)
> +{
> +	return tst_rtnl_add_attr(file, lineno, ctx, type, data,
> +		strlen(data) + 1);
> +}
> +
> +int tst_rtnl_add_attr_list(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx,
> +	const struct tst_rtnl_attr_list *list)
> +{
> +	int i, ret;
> +	size_t offset;
> +
> +	for (i = 0; list[i].len >= 0; i++) {
> +		if (list[i].len > USHRT_MAX) {
> +			tst_brk_(file, lineno, TBROK,
> +				"%s(): Attribute value too long", __func__);
> +			return -1;
> +		}
> +
> +		offset = NLMSG_ALIGN(ctx->datalen);
> +		ret = tst_rtnl_add_attr(file, lineno, ctx, list[i].type,
> +			list[i].data, list[i].len);
> +
> +		if (!ret)
> +			return -1;
> +
> +		if (list[i].sublist) {
> +			struct rtattr *attr;
> +
> +			ret = tst_rtnl_add_attr_list(file, lineno, ctx,
> +				list[i].sublist);
> +
> +			if (ret < 0)
> +				return ret;
> +
> +			attr = (struct rtattr *)(ctx->buffer + offset);
> +
> +			if (ctx->datalen - offset > USHRT_MAX) {
> +				tst_brk_(file, lineno, TBROK,
> +					"%s(): Sublist too long", __func__);
> +				return -1;
> +			}
> +
> +			attr->rta_len = ctx->datalen - offset;
> +		}
> +	}
> +
> +	return i;
> +}
> +
> +int tst_rtnl_check_acks(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx, struct tst_rtnl_message *res)
> +{
> +	struct nlmsghdr *msg = (struct nlmsghdr *)ctx->buffer;
> +	int size_left = ctx->datalen;
> +
> +	for (; size_left > 0 && NLMSG_OK(msg, size_left);
> +		msg = NLMSG_NEXT(msg, size_left)) {
> +
> +		if (!(msg->nlmsg_flags & NLM_F_ACK))
> +			continue;
> +
> +		while (res->header && res->header->nlmsg_seq != msg->nlmsg_seq)
> +			res++;
> +
> +		if (!res->err || res->header->nlmsg_seq != msg->nlmsg_seq) {
> +			tst_brk_(file, lineno, TBROK,
> +				"No ACK found for Netlink message %u",
> +				msg->nlmsg_seq);
> +			return 0;
> +		}
> +
> +		if (res->err->error) {
> +			TST_ERR = -res->err->error;
> +			return 0;
> +		}
> +	}
> +
> +	return 1;
> +}
> +
> +int tst_rtnl_send_validate(const char *file, const int lineno,
> +	struct tst_rtnl_context *ctx)
> +{
> +	struct tst_rtnl_message *response;
> +	int ret;
> +
> +	TST_ERR = 0;
> +
> +	if (tst_rtnl_send(file, lineno, ctx) <= 0)
> +		return 0;
> +
> +	tst_rtnl_wait(ctx);
> +	response = tst_rtnl_recv(file, lineno, ctx);
> +
> +	if (!response)
> +		return 0;
> +
> +	ret = tst_rtnl_check_acks(file, lineno, ctx, response);
> +	tst_rtnl_free_message(response);
> +	return ret;
> +}
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
