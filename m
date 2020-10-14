Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCA28E728
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 21:19:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96FC53C6854
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 21:19:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 118423C268D
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 17:13:15 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 15F2C600918
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 17:13:14 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id e2so3055240wme.1
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wKovQW/BZuEib5N5VKz8qE8nvWBDTtqg2/y0GWx/Iik=;
 b=YmNXzgrXVkV698eCXfcnujqTNF3EKUMoTQh9uHThFLNUxNiPJDLk1hI+WU0Ps9QUO8
 cuGhKieHQH6XcpjSiluSYv1h/NGuD32ednc4pR2Ezz0Rq+theBtb0TZBFhpDlgJmXc9V
 hco3+4ai/fq1K56tqCHnVcnjupTq/p1U2PphwPR7Wt64HcAYz86SXfeulVdAhSNbUFVm
 zfIn6oxR22rIYftr0tStucjaJmYIGWbUbAagURiSTfk3JLPGHd51QSmFkqzkzqukniDc
 pl0WWTAtuUXEOUjZo2U9yxTtBVzMmZQO2CdVtRcngXRmPqGUZz21aqyeQswvfLRLbx/i
 hX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wKovQW/BZuEib5N5VKz8qE8nvWBDTtqg2/y0GWx/Iik=;
 b=BEKeymD2mnKqMueo4Krt+QowhyFhbq9tZm+UMhkMxMvGhgGvNP27J+FiJEbAGLsQiM
 RPUCPPulvuaR+d2tZy9/Sa5D+0JWmjNpASz8LC9sPo8dMJtxq+LeqZYsBCvY8Vt8YZ4y
 TPZR/68im7QCWO+/8D62Yt141P6DhEzAwH0/IKUMBWKljb+MsJxdbK/pN63hqGeCFZeb
 1Yr7fMw1wJKiS8XcUiPOgb6XcOIlzp7EAxXm7gsL9Jt2MWgzirEX0V3x9mWY02BbRChu
 FY9oO5GdIsPr5NJgrMxfh9ExXXoN7JhQrOoEEUwh0YOl0X8v8Ln5FBfo0EzK6T70lGrt
 MXJQ==
X-Gm-Message-State: AOAM532Q34z6HAH8HtSq9akBwF7+j9mBpkfbm6Hb15hr20Afp+Dc8KG6
 Tr56h78YMMTa+EXTmD9ltsU=
X-Google-Smtp-Source: ABdhPJwNJFUjgI7k1EEdEK1tFg+hZKBTmpSryM9LzxTsfjZfGH0RpcayvBv23jwUUqfioArrIn4Aow==
X-Received: by 2002:a1c:495:: with SMTP id 143mr3713978wme.63.1602688394508;
 Wed, 14 Oct 2020 08:13:14 -0700 (PDT)
Received: from alley (176-114-240-43.rychlydrat.cz. [176.114.240.43])
 by smtp.gmail.com with ESMTPSA id p4sm5463735wrf.67.2020.10.14.08.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:13:13 -0700 (PDT)
From: Petr Mladek <mladek.petr@gmail.com>
X-Google-Original-From: Petr Mladek <pmladek@suse.com>
Date: Wed, 14 Oct 2020 17:13:11 +0200
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20201014151311.GB13775@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014140514.GB17231@alley>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 14 Oct 2020 21:19:31 +0200
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
 John Ogness <john.ogness@linutronix.de>,
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

On Wed 2020-10-14 16:05:20, Petr Mladek wrote:
> On Wed 2020-10-14 16:19:18, Naresh Kamboju wrote:
> > While testing LTP controllers testing on x86_64 KASAN enabled linux
> > next 20201013 tag
> > kernel this kernel BUG noticed. The oom-killer log also noticed while
> > running tests.
> > 
> > metadata:
> >   git branch: master
> >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >   git commit: f2fb1afc57304f9dd68c20a08270e287470af2eb
> >   git describe: next-20201013
> >   make_kernelversion: 5.9.0
> >   kernel-config:
> > https://builds.tuxbuild.com/TXP6cqokP8BCYJrv7zf6kw/kernel.config
> > 
> This is the last string stored in the ring buffer before KASAN trigerred.
> 
> > [  221.922108] ==================================================================
> > [  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
> > [  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
> > memcg_test_1/11282
> 
> > [  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
> > 5.9.0-next-20201013 #1
> > [  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > 2.0b 07/27/2017
> > [  221.922116] Call Trace:
> > [  221.922117]  dump_stack+0xa4/0xd9
> > [  221.922118]  print_address_description.constprop.0+0x21/0x210
> > [  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
> > [  221.922120]  ? vprintk_store+0x362/0x3d0
> > [  221.922121]  kasan_report.cold+0x37/0x7c
> > [  221.922122]  ? vprintk_store+0x362/0x3d0
> > [  221.922123]  check_memory_region+0x18c/0x1f0
> > [  221.922124]  memcpy+0x3c/0x60
> > [  221.922125]  vprintk_store+0x362/0x3d0
> 
> It seems that vprintk() store was able to extend the last string
> by the two characters. So this is likely:
> 
> static size_t log_output(int facility, int level, enum log_flags lflags,
> 			 const struct dev_printk_info *dev_info,
> 			 char *text, size_t text_len)
> {
> [...]
> 		if (prb_reserve_in_last(&e, prb, &r, caller_id, LOG_LINE_MAX)) {
> 			memcpy(&r.text_buf[r.info->text_len], text, text_len);
> 
> But very likely the two characters were copied to wrong location.
> There are many similar lines in the full log and they always contain
> 
>     task_memcg=/0
> 
> It means that the size of the path is 2 characters but it should be
> "/0". I guess that "in" was in the log buffer from the previous
> wrap.
> 
> So, it seems that prb_reserve_in_last() correctly updated the size
> of the extended record but it returned wrong pointer to the buffer
> or wrong current length.
> 
> Anyway, prb_commit(&e) moved the buffer back to consistent state.


> > [  213O[  221.922182] The buggy address belongs to the variable:
> > [  221.922183]  clear_seq+0x2d/0x40
> 
> The address ffffffffba51dbcd seems to be from the range of
> "module mapping space" adresses.
> 
> "clear_seq" is static variable from kernel/printk/printk.c.

There is a bug in data_realloc(). We return wrong pointer when there
is no need to resize the record and it has been wrapped.

It might happen when we add only few characters and there was
a space because of alignment.

It would cause writing outside the buffer into another statically
defined variables. So, it might be it.

The following change patch should fix it:


diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 2493348a1631..24a960a89aa8 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
 
 	/* If the data block does not increase, there is nothing to do. */
 	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
-		blk = to_block(data_ring, blk_lpos->begin);
+		if (wrapped)
+			blk = to_block(data_ring, 0);
+		else
+			blk = to_block(data_ring, blk_lpos->begin);
 		return &blk->data[0];
 	}
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
