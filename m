Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44A28E10A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 15:11:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A00C33C3292
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 15:11:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 674103C2695
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 14:47:07 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B34C41000B2F
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 14:47:06 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id a1so1642773pjd.1
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hj+ZCgQKhreBQYhtsAFJvmMRs2GZZ5ANAJ12F6nGDr4=;
 b=poYkB0CJLjO7PdZQDsYFRdcRLzsclNxELfpx/QRkPvqChsQu42qJ0/PcSrs/QTMY3n
 gkV55WRhQo4ucMaqLwdZoV/f9OMmYxkH7pWvXC6ROIamo1+Y4wevRQpZuDRppEzA3FVs
 D4RSLRZ8TOQ/zXF02YPrbFxV1Jlwk2wHS6PPQUsJfMF1dHPYO1gausj/vwFiOlDBcsmK
 YxTJYd2dg+nbqkF6pM1nMCWQQ3fZvAF45JMIAc2i3nYjwxrS4V2xbxFjD7ooIhasQgOh
 za8gR2HZFnTtsKbeLuWrGA3HvtNuB25wsZELIvGAlg5B1xIrJklz0EArt745PSyW0U8T
 7bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hj+ZCgQKhreBQYhtsAFJvmMRs2GZZ5ANAJ12F6nGDr4=;
 b=FiJ/4P+KM/eOb7D96vZwdkHXRadlzIBYSdL1JnSaOqgH46LzhNlPFlEhwK460aA9Fz
 /w8VLNX7ownKZWi4Xtoa6jY4JhhudPh36egElqHqxGau9nnx7/2OsDhMcOM83dyAYvFs
 epRoVLpmHS5yf9aX6fh2JbC6BZEgy41wfGyA4f+Urtl+8L/g0e3ejyWB1hl5gECqZRm1
 oT47JnYDWm5mwdlSkppjr1MBfLQkT5bxZotKTUg1UzPyz1bpY8alPyC7AwtUFXVxtRGT
 Vzp63oqP9RV5/RTS7Ha8nGwJIr02TRsqfrqsYic5gssOYBxwjXROdAvMgBoeDSnX2S9U
 Yi1w==
X-Gm-Message-State: AOAM533LMNCK5dXHLPHC0xLHZaqeQe4+nTnxcGzs1S8QEJ3t3+if5Tt9
 E6jfSXedFc1qoqD5DwsgDYY=
X-Google-Smtp-Source: ABdhPJxhROKW+4z70T9DiNRMPAyHbvrReUSWvahNL8E1zlFIQEEUB4pcIQ4uaTFWt6dVFM3rSBqTjA==
X-Received: by 2002:a17:90a:dd46:: with SMTP id
 u6mr3604305pjv.67.1602679625208; 
 Wed, 14 Oct 2020 05:47:05 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id na9sm2659609pjb.45.2020.10.14.05.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 05:47:03 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:47:01 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Message-ID: <20201014124701.GA614@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 14 Oct 2020 15:11:43 +0200
Subject: Re: [LTP] BUG: KASAN: global-out-of-bounds in vprintk_store on
 x86_64
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On (20/10/14 16:19), Naresh Kamboju wrote:
> Crash log:
> --------------
> [  221.921944] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=c,mems_allowed=0,oom_memcg=/0,task_memcg=in
> [  221.922108] ==================================================================
> [  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
> [  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
> memcg_test_1/11282
> [  221.922113]
> [  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
> 5.9.0-next-20201013 #1
> [  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [  221.922116] Call Trace:
> [  221.922117]  dump_stack+0xa4/0xd9
> [  221.922118]  print_address_description.constprop.0+0x21/0x210
> [  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922120]  ? vprintk_store+0x362/0x3d0
> [  221.922121]  kasan_report.cold+0x37/0x7c
> [  221.922122]  ? vprintk_store+0x362/0x3d0
> [  221.922123]  check_memory_region+0x18c/0x1f0
> [  221.922124]  memcpy+0x3c/0x60
> [  221.922125]  vprintk_store+0x362/0x3d0
> [  221.922125]  ? __ia32_sys_syslog+0x50/0x50
> [  221.922126]  ? _raw_spin_lock_irqsave+0x9b/0x100
> [  221.922127]  ? _raw_spin_lock_irq+0xf0/0xf0
> [  221.922128]  ? __kasan_check_write+0x14/0x20
> [  221.922129]  vprintk_emit+0x8d/0x1f0
> [  221.922130]  vprintk_default+0x1d/0x20
> [  221.922131]  vprintk_func+0x5a/0x100
> [  221.922132]  printk+0xb2/0xe3
> [  221.922133]  ? swsusp_write.cold+0x189/0x189
> [  221.922134]  ? kernfs_vfs_xattr_set+0x60/0x60
> [  221.922134]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922135]  ? trace_hardirqs_on+0x38/0x100
> [  221.922136]  pr_cont_kernfs_path.cold+0x49/0x4b

A side note,
So this brings the question:


	#define PATH_MAX        4096

	static char kernfs_pr_cont_buf[PATH_MAX];

	void pr_cont_kernfs_path(struct kernfs_node *kn)
	{
	...
		if (sz >= sizeof(kernfs_pr_cont_buf)) {
			pr_cont("(name too long)");
			goto out;
		}
	
		pr_cont("%s", kernfs_pr_cont_buf);
	...
	}

Do we still want to limit printk line to 1024?
There are functions that want longer lines (e.g. kernel boot command
line).

	-ss

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
