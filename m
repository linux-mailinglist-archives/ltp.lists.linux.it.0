Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF2jH1qgjGmPrgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 16:29:30 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC352125AB9
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 16:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770823769; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=fs/izYoVkHzeLxKZTeDXW/RWDeudfu/fnn4fjERyqUQ=;
 b=SMNJJPyzf5aG7RHNCeQzHSpTHrwx6shvoM0jJmp5Vt5PIwxDIHuvwuTO8OQQP8W1jfk7S
 as4XNx75OkfTDzDmiyuQo8LYL0af40yTrqMqCIMQBiXzqH7m8hf6m7UZlrGDzodLzCJ0xvm
 SGpdcx0y7ZmdsJx9XJHmA7mxsDhpCkA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7779F3CACFD
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 16:29:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1EE43CACFD
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 16:29:17 +0100 (CET)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E43E51400E13
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 16:29:16 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso10295275e9.1
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770823756; x=1771428556; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydrNx1sGzbgEuf7hO5tQH6ctTBwFyDXMCQbNyqX1vgg=;
 b=IDp5QR+XW0izgS5WWCjhwqcurbzI5/XFoiJTJvFUG9d0ctSNz4s7g+s6Lo/h2j3saM
 yFMe7rS897bA69Dd1o1fqP2WRyHEmF4LjRrczW3sGtxLPAbCQ5rfsNUd+yfiUqaLHC/t
 SnwKIp6PIwSfu4RuBgERr/tOmKXUPEc3YXxOUH0hKVkO56cEpwNXZ0xm1/W42F+jTvlF
 mKerM5ffEbQCr0Q59G18Hyy3tG1Qo6k9pYYC35lpLWwp7E9MXLC1WC2en6R14eY5hPjT
 CeUiKv54UCjbDqF9qY9DfdSW8H8OnlmAVbPU4YKj2U95qjiNwFg1DVV+a6MXkEC3nxK4
 yl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770823756; x=1771428556;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydrNx1sGzbgEuf7hO5tQH6ctTBwFyDXMCQbNyqX1vgg=;
 b=O0dOLx83ySMbwccEXPQL+lKvQuVu1XL9H9Av8gIRlkxZmf111VtwqCtunEMbtuzVm0
 C89hgiXSIeuT0PIVYXAVNJVVev/emDpxLBpWear706MwBeJZTec8czl7FgWikRRAN66M
 IufU04aNymmPzWgxKbI3ryayxqBXe2qok2W3EkvmnR8BfrWms31WLdKgW+fxqC2Dq4E4
 P1U7mJpoa+Es4UbVBdc33gTPjxkuGHJpGZ6G5CFwbnLHOb4EoD4rvVVgZpZD6UmerBRW
 JXI2DTKCjVZJG51l9TVkE9VNKIqHxKV/gKGJJ8qdPNrjYuzarNRc5b91KnG68cbxfMvx
 equw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwCjwhVoZcqQUkpDzy/DgeCh120I8E1ZsCd+rDpU15CAyaeiFUufZ5OaBeUM0UrFfCNPM=@lists.linux.it
X-Gm-Message-State: AOJu0YwL2eQNcP1zc05tuiwXeJO1G5G6ovlkcW/C3Cnsk2NdUh6rfXNC
 fy3W0kokr+asW41+j2O7+1jxH6jIuPMiSDG9oMs77hGiNZEzHwtxoFazXmyCllHAr+A=
X-Gm-Gg: AZuq6aLWixLkPfsL9fdyTFJRrqKut7w1RKRGWAyqk8SnbGDyIjAS24RVIvPVy8NrJQ+
 wy0gyrkVSZTipbW+PSZj9A0nGq7m0vKwzzL2BL9XJIB6y38Xug7rdnN19erXcDbo+lolIqvBLzn
 p7OpOnWf9y+gMGPQ8MLozWFTXQaRRNWASY+rnAnMa355gSWhzXCPd3pv2rrglyFnElFYSgusmqW
 Vgv+UXbWcZd8+d1xz5kwufbvLRnFGONxvBF4JKLBGzji7hzprZWa4n51Kds9/KyQr/EyhuL3clN
 M7HgEa6LxCcdGBSjQlbi5ySp/Evs+imM/uboace/loLEbRXQLWNs8pQbY4F+6GWUyUasQM35R15
 1NpJVNYTTtb2uFDBn7V+QEZLTcOOciFtmC8KYdy0pOO7rAYqrKMBSQk73vTd+ld1TTBfDEzf+zs
 eLZGYgr8ebT6F3ULnh5jK2MdvSOA==
X-Received: by 2002:a05:600c:c050:b0:47e:e452:ec12 with SMTP id
 5b1f17b1804b1-4834ffa5efamr59720995e9.15.1770823756248; 
 Wed, 11 Feb 2026 07:29:16 -0800 (PST)
Received: from localhost ([37.162.80.213]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a1c2sm200172915e9.9.2026.02.11.07.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:29:15 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 16:29:12 +0100
Message-Id: <DGC8MPCRC69D.32BXXF7Y4L63S@suse.com>
To: "Wei Gao" <wegao@suse.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260125063035.31171-1-wegao@suse.com>
In-Reply-To: <20260125063035.31171-1-wegao@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] ioctl_pidfd02.c: fix clone3 EFAULT in 32-bit
 compat mode due to sign extension
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: EC352125AB9
X-Rspamd-Action: no action

Hi!

On Sun Jan 25, 2026 at 7:30 AM CET, Wei Gao via ltp wrote:
> When running 32-bit binaries on a 64-bit kernel (compat mode), the user
> stack is often mapped in the upper range of the 32-bit address space
> (e.g., 0xffxxxxxx).
>
> Directly casting a 32-bit pointer to uint64_t for the args->pidfd field
> in struct clone_args can trigger sign extension if the pointer's MSB
> (Most Significant Bit) is 1. For example, a 32-bit user address
> 0xff80e0bc is incorrectly sign-extended to 0xfffffffffff80e0bc.
>
> When the 64-bit kernel executes put_user(), it identifies this address
> as being in the 64-bit kernel canonical range rather than user space,
> leading to a failed access_ok() check and returning -EFAULT.
>
> This patch fixes the issue by double-casting through uintptr_t to
> ensure zero-extension, keeping the address within the valid 32-bit
> user-space range from the kernel's perspective.

The git commit message is unnecesarily complex. We can say:

Correct the 32-bit pointer u64 conversion for args->pidfd. Direct
casting from a 32-bit pointer to a 64-bit integer was causing incorrect
sign-extension. Using (uint64_t)(uintptr_t) ensures a valid zero-padded
64-bit address.

>
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c | 2 +-
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c | 2 +-
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c | 2 +-
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c | 2 +-
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
> index c6f8a02fe..cc44a1bb5 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd02.c
> @@ -27,7 +27,7 @@ static void run(unsigned int isolate)
>  
>  	if (isolate) {
>  		args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
> -		args->pidfd = (uint64_t)&pidfd;
> +		args->pidfd = (uint64_t)(uintptr_t)&pidfd;
>  		args->exit_signal = SIGCHLD;
>  
>  		pid_child = SAFE_CLONE(args);
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
> index 2c785004c..53223c0a5 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd03.c
> @@ -24,7 +24,7 @@ static void run(void)
>  	memset(args, 0, sizeof(struct tst_clone_args));
>  
>  	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
> -	args->pidfd = (uint64_t)&pidfd;
> +	args->pidfd = (uint64_t)(uintptr_t)&pidfd;
>  	args->exit_signal = SIGCHLD;
>  
>  	pid_child = SAFE_CLONE(args);
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
> index ff4316068..0b0e4053c 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd04.c
> @@ -26,7 +26,7 @@ static void run(void)
>  	info->mask = PIDFD_INFO_EXIT;
>  
>  	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
> -	args->pidfd = (uint64_t)&pidfd;
> +	args->pidfd = (uint64_t)(uintptr_t)&pidfd;
>  	args->exit_signal = SIGCHLD;
>  
>  	pid_child = SAFE_CLONE(args);
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> index 278e64cef..a921b6b05 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> @@ -36,7 +36,7 @@ static void run(void)
>  	info_invalid->dummy = 1;
>  
>  	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
> -	args->pidfd = (uint64_t)&pidfd;
> +	args->pidfd = (uint64_t)(uintptr_t)&pidfd;
>  	args->exit_signal = SIGCHLD;
>  
>  	pid_child = SAFE_CLONE(args);
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
> index 95c09dbda..9e78ece82 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd06.c
> @@ -26,7 +26,7 @@ static void run(void)
>  	info->mask = PIDFD_INFO_EXIT;
>  
>  	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
> -	args->pidfd = (uint64_t)&pidfd;
> +	args->pidfd = (uint64_t)(uintptr_t)&pidfd;
>  	args->exit_signal = SIGCHLD;
>  
>  	pid_child = SAFE_CLONE(args);

At this point I would define a macro as following and use it around the
tests when it's needed:

#define TST_PTR_TO_UINT(x) ( (uint64_t)(uintptr_t)(x) )

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
