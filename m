Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3CE2974CA
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:42:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C07E3C3180
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:42:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 51F723C23CB
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:42:01 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D5B5601331
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:42:00 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id 77so2866715lfl.2
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+nAaUgoJjn1GQQL32t4mHWQAk8gM2x+fHttImUTwKg=;
 b=gZYzE2Wyu9NfbAuQl968/JXo1ZhCIPYLE6wxIP+CB4bWgLYHDuhie8M+a6Os9bY3Dc
 3VzE0z0qYdmpNEIF6kN4ikCY+XJiuGnZ2+VSk2EcrlNz8yB6iboOEbDjbz5YGc7pFCUU
 IeMOR2/UGwHXVW7+KYrRWhze4FTSmtywNIGs1yVaKnQqDJaxn5xnqBnV1KQtLv90LFRj
 1ZaWjS7aUU6F4MZMhnmfussVIdp6KjZ1N6vGSLX91hJbT7yHIUzoOGcWUp+7kYV0FCrU
 J6oKHaXfQUBlxZdQ9pJ4/+Om5zikFNqFqZHCgKa9wMkxy/0uiQJQaSuNKKSMd3UxAFcm
 OkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+nAaUgoJjn1GQQL32t4mHWQAk8gM2x+fHttImUTwKg=;
 b=C7lfgoX4CC09chWVdMka2sDycH7+zeV9cS66TkTv8q85SIlkT5wuF+XyooR4jI46Sp
 SjoY9YLclwkMnohPLP5o24WPX/7rqWUU8FltucvdN5aJkRGn1iJ0SK7j/PAx9mhgy/iG
 LPfN0JQebAXfw4Bk6OkZLubvrU6FLC6/UP//xCVJtOXtWuGnfSQzxvixwufXCIcN2kve
 1Kh2BJZIzukqdcPlNed1SeHz+X42y8jPDKsq5PdVKMEMZfQFoWpaDJxMsugEHjQwgduw
 1Rc/D3wyst0fS4W3UODSQGcP9m994fkUSu4ZSl337ynDfesUAuwfyenffbPPQOiVDxAO
 gW0w==
X-Gm-Message-State: AOAM531FjO5tmbHoh1A4iMDZQ9hfUHVosnm3aEHTfsCXT0Sa96UC54nP
 shjBWAL/uWf825Oeqkewngcbw0y6rKBw0YVuqNlSO4JDZus=
X-Google-Smtp-Source: ABdhPJwpQ5H7r233jV7T3JW/pOsMBOSVEoi/WJkVU2RAvFICk4MZO8C+MOb2CV7Xv3qeJUojo70vLZ5+E4EO7ck5Atg=
X-Received: by 2002:a19:7f43:: with SMTP id a64mr1012830lfd.449.1603471319533; 
 Fri, 23 Oct 2020 09:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <87sga6vizp.fsf@suse.de>
 <20201022122858.8638-1-rpalethorpe@suse.com>
 <CALvZod4u79DSwyM=Kg8g5tR1L5eomHgUkaJmp6s9D3jC7OnN0A@mail.gmail.com>
 <20201022172508.GF300658@carbon.dhcp.thefacebook.com>
 <CALvZod5p-O72gCY-R+oLcDZjEkPRioz7e7p5Jg=nXxhmtiwKWw@mail.gmail.com>
 <20201023004026.GG300658@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201023004026.GG300658@carbon.dhcp.thefacebook.com>
Date: Fri, 23 Oct 2020 09:41:48 -0700
Message-ID: <CALvZod7opFD4RTWmcXP_BHpW=t3uAJQNLx_UKRMw=UtfFA+jSA@mail.gmail.com>
To: Roman Gushchin <guro@fb.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] mm: memcg/slab: Stop reparented obj_cgroups
 from charging root
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
From: Shakeel Butt via ltp <ltp@lists.linux.it>
Reply-To: Shakeel Butt <shakeelb@google.com>
Cc: Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 22, 2020 at 5:40 PM Roman Gushchin <guro@fb.com> wrote:
>
> On Thu, Oct 22, 2020 at 04:59:56PM -0700, Shakeel Butt wrote:
> > On Thu, Oct 22, 2020 at 10:25 AM Roman Gushchin <guro@fb.com> wrote:
> > >
> > [snip]
> > > >
> > > > Since bf4f059954dc ("mm: memcg/slab: obj_cgroup API") is in 5.9, I
> > > > think we can take this patch for 5.9 and 5.10 but keep Roman's cleanup
> > > > for 5.11.
> > > >
> > > > What does everyone think?
> > >
> > > I think we should use the link to the root approach both for stable backports
> > > and for 5.11+, to keep them in sync. The cleanup (always charging the root cgroup)
> > > is not directly related to this problem, and we can keep it for 5.11+ only.
> > >
> > > Thanks!
> >
> > Roman, can you send the signed-off patch for the root linking for
> > use_hierarchy=0?
>
> Sure, here we are.
>
> Thanks!
>
> --
>
> From 19d66695f0ef1bf1ef7c51073ab91d67daa91362 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Thu, 22 Oct 2020 17:12:32 -0700
> Subject: [PATCH] mm: memcg: link page counters to root if use_hierarchy is false
>
> Richard reported a warning which can be reproduced by running the LTP
> madvise6 test (cgroup v1 in the non-hierarchical mode should be used):
>
> [    9.841552] ------------[ cut here ]------------
> [    9.841788] WARNING: CPU: 0 PID: 12 at mm/page_counter.c:57 page_counter_uncharge (mm/page_counter.c:57 mm/page_counter.c:50 mm/page_counter.c:156)
> [    9.841982] Modules linked in:
> [    9.842072] CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.9.0-rc7-22-default #77
> [    9.842266] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-48-gd9c812d-rebuilt.opensuse.org 04/01/2014
> [    9.842571] Workqueue: events drain_local_stock
> [    9.842750] RIP: 0010:page_counter_uncharge (mm/page_counter.c:57 mm/page_counter.c:50 mm/page_counter.c:156)
> [ 9.842894] Code: 0f c1 45 00 4c 29 e0 48 89 ef 48 89 c3 48 89 c6 e8 2a fe ff ff 48 85 db 78 10 48 8b 6d 28 48 85 ed 75 d8 5b 5d 41 5c 41 5d c3 <0f> 0b eb ec 90 e8 4b f9 88 2a 48 8b 17 48 39 d6 72 41 41 54 49 89
> [    9.843438] RSP: 0018:ffffb1c18006be28 EFLAGS: 00010086
> [    9.843585] RAX: ffffffffffffffff RBX: ffffffffffffffff RCX: ffff94803bc2cae0
> [    9.843806] RDX: 0000000000000001 RSI: ffffffffffffffff RDI: ffff948007d2b248
> [    9.844026] RBP: ffff948007d2b248 R08: ffff948007c58eb0 R09: ffff948007da05ac
> [    9.844248] R10: 0000000000000018 R11: 0000000000000018 R12: 0000000000000001
> [    9.844477] R13: ffffffffffffffff R14: 0000000000000000 R15: ffff94803bc2cac0
> [    9.844696] FS:  0000000000000000(0000) GS:ffff94803bc00000(0000) knlGS:0000000000000000
> [    9.844915] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.845096] CR2: 00007f0579ee0384 CR3: 000000002cc0a000 CR4: 00000000000006f0
> [    9.845319] Call Trace:
> [    9.845429] __memcg_kmem_uncharge (mm/memcontrol.c:3022)
> [    9.845582] drain_obj_stock (./include/linux/rcupdate.h:689 mm/memcontrol.c:3114)
> [    9.845684] drain_local_stock (mm/memcontrol.c:2255)
> [    9.845789] process_one_work (./arch/x86/include/asm/jump_label.h:25 ./include/linux/jump_label.h:200 ./include/trace/events/workqueue.h:108 kernel/workqueue.c:2274)
> [    9.845898] worker_thread (./include/linux/list.h:282 kernel/workqueue.c:2416)
> [    9.846034] ? process_one_work (kernel/workqueue.c:2358)
> [    9.846162] kthread (kernel/kthread.c:292)
> [    9.846271] ? __kthread_bind_mask (kernel/kthread.c:245)
> [    9.846420] ret_from_fork (arch/x86/entry/entry_64.S:300)
> [    9.846531] ---[ end trace 8b5647c1eba9d18a ]---
>
> The problem occurs because in the non-hierarchical mode non-root page
> counters are not linked to root page counters, so the charge is not
> propagated to the root memory cgroup.
>
> After the removal of the original memory cgroup and reparenting of the
> object cgroup, the root cgroup might be uncharged by draining a objcg
> stock, for example. It leads to an eventual underflow of the charge
> and triggers a warning.
>
> Fix it by linking all page counters to corresponding root page
> counters in the non-hierarchical mode.
>
> The patch doesn't affect how the hierarchical mode is working,
> which is the only sane and truly supported mode now.
>
> Thanks to Richard for reporting, debugging and providing an
> alternative version of the fix!
>
> Reported-by: ltp@lists.linux.it
> Debugged-by: Richard Palethorpe <rpalethorpe@suse.com>
> Fixes: bf4f059954dc ("mm: memcg/slab: obj_cgroup API")
> Signed-off-by: Roman Gushchin <guro@fb.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Shakeel Butt <shakeelb@google.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
