Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D72940F0
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:57:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFBCC3C56C8
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:57:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BBB763C31B4
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:57:03 +0200 (CEST)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4B6C16008BC
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:57:03 +0200 (CEST)
Received: by mail-lj1-x244.google.com with SMTP id p15so2787769ljj.8
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bq8GoxVyo7gYf7b14RQXOf1f0F80lNlq4H2QZVhqpxs=;
 b=GlmFnKSun8DV43nTlPdV+XO2Gf5tvurJdBjQjMLyLJc7GzalEIG6ugrLcrOYrvLNVL
 eI5ABURDeNtLlU9DzOsIDes1PDJPHBqJqWO4J/+b/mL4oAoA+ps0nCFliPaCVagdn0VK
 VeVW0OmGjSuAT3AUYEc6lveH9NPknQ95fx20WayIvbHHE/D6wCDfBmlEWHhgEPV7xBDW
 qCnqbqc3SlT6jIC261l88VcYxFYzPZTvSFKbRdW0lURyl9ADY2a2SGJkmDeiJKXhmpRn
 IxqCFW+Z225MyB+sKga38zg1TqgidiuYm0cfcCRV1K7LJqct8Rp5DhUNHjWFF8SRldiK
 1+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bq8GoxVyo7gYf7b14RQXOf1f0F80lNlq4H2QZVhqpxs=;
 b=pZbI5k9mFapTllvrK1IwkGlKXwbLRsJOsZVZXZHM7MXvIqiA7Kb5b9FTj7eDFbu/3D
 pZ0kTTZY+A6Csow596Mw8e15cm//uUJwoaM927Jk/Bv1033iCfhJ8KunQn7uF8yR8sWG
 OpKBUbROCfPAiWDNyNVlbttN1+oNAJZdedHYZovM2/kNC5+u4pwrD/18sgAt5VtWb2ih
 Cy6Vw7wKWaJfqiwB/lzPs3K43Qm5nb2/2j51LDDBELjRyxwWxK60pU77UTMQFWPoW9Mm
 deGJ9VQkwLLUyPIkewJGJYANzDDpl5kxztuLi9WxyNfGxSTxJq8Wx0OLzJVwkcubzzVK
 YZ2Q==
X-Gm-Message-State: AOAM5319hnXHyX13XUpBnFoKCin0XJ3ujPigmtGVXZfa1bEHZufUaScN
 BhF624vyIDwIUtiT2O51BU8z/tJ/9IUU1yMqfeW0jw==
X-Google-Smtp-Source: ABdhPJyP/DA7JLtU7l6FFKLqDzXFS9L6C8jNSI7xsOJZaUVquq/DPfMLt8k9HTf5vT6Xt1piKgc+oG8QTp5H3VgE7F4=
X-Received: by 2002:a2e:91c8:: with SMTP id u8mr1475971ljg.192.1603213022378; 
 Tue, 20 Oct 2020 09:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <87lfg2ob83.fsf@suse.de>
 <20201019095812.25710-1-rpalethorpe@suse.com>
 <CALvZod6FNH3cZfZxLSFXtQR5bV_2Tese0793Ve9rd1YNW22MKg@mail.gmail.com>
 <87mu0hwik7.fsf@suse.de> <87eeltvwg4.fsf@suse.de>
In-Reply-To: <87eeltvwg4.fsf@suse.de>
Date: Tue, 20 Oct 2020 09:56:51 -0700
Message-ID: <CALvZod45mAzyo9LNR4YtX_3J0gZJDagYTNv8NbJAuXzwK5A2DA@mail.gmail.com>
To: rpalethorpe@suse.de
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] mm: memcg/slab: Stop reparented obj_cgroups
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
 Roman Gushchin <guro@fb.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 20, 2020 at 6:49 AM Richard Palethorpe <rpalethorpe@suse.de> wrote:
>
> Hello,
>
> Richard Palethorpe <rpalethorpe@suse.de> writes:
>
> > Hello Shakeel,
> >
> > Shakeel Butt <shakeelb@google.com> writes:
> >>>
> >>> V3: Handle common case where use_hierarchy=1 and update description.
> >>>
> >>>  mm/memcontrol.c | 7 +++++--
> >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> >>> index 6877c765b8d0..34b8c4a66853 100644
> >>> --- a/mm/memcontrol.c
> >>> +++ b/mm/memcontrol.c
> >>> @@ -291,7 +291,7 @@ static void obj_cgroup_release(struct percpu_ref *ref)
> >>>
> >>>         spin_lock_irqsave(&css_set_lock, flags);
> >>>         memcg = obj_cgroup_memcg(objcg);
> >>> -       if (nr_pages)
> >>> +       if (nr_pages && (!mem_cgroup_is_root(memcg) || memcg->use_hierarchy))
> >>
> >> If we have non-root memcg with use_hierarchy as 0 and this objcg was
> >> reparented then this __memcg_kmem_uncharge() can potentially underflow
> >> the page counter and give the same warning.
> >
> > Yes, although the kernel considers such a config to be broken, and
> > prints a warning to the log, it does allow it.
>
> Actually this can not happen because if use_hierarchy=0 then the objcg
> will be reparented to root.
>

Yup, you are right. I do wonder if we should completely deprecate
use_hierarchy=0.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
