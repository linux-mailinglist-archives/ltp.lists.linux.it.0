Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 285663D11A7
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 16:52:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDAD03C6C7D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 16:52:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7206B3C6354
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 16:52:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD3EC1000450
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 16:52:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 296E71FEBA;
 Wed, 21 Jul 2021 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626879162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gLUJM3lHoUXxBP9ba9MrZkfPdnbRWuKbvPngnf/m1s0=;
 b=kR2FCt7olhVV9mAYy+QTFNcUCEmf2SqQQdpS5kdfx0vqjHCSyvDIHqH63BsyhlHl8tWuCN
 J3Oo8qlT54JlD8tWtDz2twmeRi0fjDyxX1xtpcuqhrVKSDEtAADxBpymIL1VtojqrkGba0
 +GrVeljRkeRBpfOfdq2nFMnOkQZKal8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626879162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gLUJM3lHoUXxBP9ba9MrZkfPdnbRWuKbvPngnf/m1s0=;
 b=iC2J19GgQZnQ8H+8bgspyGC80WtnGnn6JOeQ5o/ohDvFcWbLGfSl7Xo1VolSaH99K8KOK+
 aGjbtUQOxq//ghBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1655A139F8;
 Wed, 21 Jul 2021 14:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0+NIBLo0+GAQfgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 14:52:42 +0000
Date: Wed, 21 Jul 2021 16:27:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YPguw96IP/TehZVe@yuki>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] libs/libltpnewipc/libnewipc.c: Add
 msg_do_reader/msg_do_writer function
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
First of all sorry for the long delay.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/libnewipc.h           | 11 +++++
>  libs/libltpnewipc/libnewipc.c | 75 +++++++++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/include/libnewipc.h b/include/libnewipc.h
> index 075364f85..0f099c939 100644
> --- a/include/libnewipc.h
> +++ b/include/libnewipc.h
> @@ -45,6 +45,14 @@
>  #define INT_SIZE	4
>  #define MODE_MASK	0x01FF
>  
> +struct mbuffer {
> +	long type;
> +	struct {
> +		char len;
> +		char pbytes[99];
> +	} data;
> +};
> +
>  key_t getipckey(const char *file, const int lineno);
>  #define GETIPCKEY() \
>  	getipckey(__FILE__, __LINE__)
> @@ -59,4 +67,7 @@ void *probe_free_addr(const char *file, const int lineno);
>  
>  time_t get_ipc_timestamp(void);
>  
> +void msg_do_reader(long key, int tid, long type, int child, int nreps);
> +
> +void msg_do_writer(long key, int tid, long type, int child, int nreps);
>  #endif /* newlibipc.h */
> diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
> index d0974bbe0..09871b421 100644
> --- a/libs/libltpnewipc/libnewipc.c
> +++ b/libs/libltpnewipc/libnewipc.c
> @@ -99,3 +99,78 @@ time_t get_ipc_timestamp(void)
>  
>  	return ts.tv_sec;
>  }
> +
> +static int verify(char *buf, char val, int size, int child)
> +{
> +	while (size-- > 0) {
> +		if (*buf++ != val) {
> +			tst_res(TFAIL,
> +				"Verify error in child %d, *buf = %x, val = %x, size = %d",
> +				child, *buf, val, size);

Actually this piece of code had a bug in the original version as well,
as we do *buf++ we end up one byte after the position we wanted to
print if we ever got wrong byte, possibly out of the buffer as well.

So I guess that this will be much better and easier to read with usuall
for loop and array subscript:

	for (i = 0; i < size; i++) {
		if (buf[i] != val)  {
		...

Also we report failure in the msg_do_reader() so I guess that it would
be slightly better to report TINFO with the details here and let the
msg_do_reader() report the failure.

> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +void msg_do_reader(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_brk(TFAIL,
> +			"Message queue mismatch in the reader of child group %d for message queue id %d ",
> +			child, id);
> +	}
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
> +		if (buffer.type != type) {
> +			tst_brk(TFAIL,
> +				"Type mismatch in child %d, read #%d, for message got %ld, exected %ld",
> +				child, (i + 1), buffer.type, type);
> +		}
> +		if (buffer.data.len + 1 != size) {
> +			tst_brk(TFAIL,
> +				"Size mismatch in child %d, read #%d, for message got %d, expected %d",
> +				child, (i + 1), buffer.data.len + 1, size);
> +		}
> +		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
> +			tst_brk(TFAIL,
> +				"Verify failed in child %d read # = %d, key = %lx",
> +				child, (i + 1), key);
> +		}
> +		key++;
> +	}
> +}
> +
> +void msg_do_writer(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_brk(TFAIL,
> +			"Message queue mismatch in the writer of child group %d for message queue id %d",
> +			child, id);
> +	}
> +
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));

We set the relevant part of the buffer with (key % 255), do we really
have to clear it here?

> +		do {
> +			size = (lrand48() % 99);
> +		} while (size == 0);
> +		memset(buffer.data.pbytes, (key % 255), size);
> +		buffer.data.len = size;
> +		buffer.type = type;
> +		SAFE_MSGSND(id, &buffer, size + 1, 0);
> +		key++;
> +	}
> +}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
